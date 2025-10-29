
install.packages("tidyverse")
install.packages("skimr")

library(tidyverse)
library(skimr)
library(caret)

df <- read_tsv("merged_data.tsv")

print(df)

# Wymiary zbioru
cat("Wymiary zbioru (wiersze, kolumny):", dim(df), "\n")

# Podgląd danych
glimpse(df)

# Profilowanie za pomocą 'skimr'
skim(df)

# Usuwanie duplikaów
cat("Liczba wierszy PRZED deduplikacją:", nrow(df), "\n")
df_clean <- df %>%
  distinct(ID, .keep_all = TRUE)
cat("Liczba wierszy PO deduplikacji:", nrow(df_clean), "\n")

# Usunięcie zbędnych kolumn (duplikaty ID oraz 100% puste)
df_clean <- df_clean %>%
  select(
    -ID.1,                           # Duplikat ID
    -cases.submitter_id,             # Duplikat ID
    -patient,                        # Duplikat ID
    -cases.case_id,                  # Inny, zbędny identyfikator
    -Tumor_Grade,                    # 100% pusty
    -tobacco_smoking_history         # 100% pusty
  )

# Czyszczenie "brudnych" kolumn (konwersja '--' na NA) ---
# Identyfikujemy kolumny, które są 'character', ale powinny być 'numeric'
# (te, które zawierają '--' zamiast NA)
cols_to_clean_numeric <- c(
  "demographic.days_to_death",
  "cases.days_to_lost_to_followup",
  "diagnoses.age_at_diagnosis",
  "diagnoses.year_of_diagnosis"
)

df_clean <- df_clean %>%
  # Krok 1: Zamień tekst "'--'" na prawdziwe 'NA'
  mutate(across(all_of(cols_to_clean_numeric), ~ na_if(., "'--'"))) %>%
  # Krok 2: Konwertuj te kolumny na typ numeryczny
  mutate(across(all_of(cols_to_clean_numeric), as.numeric))


# Obsługa braków danych (NA) w kolumnach kategorycznych ---
# Po deduplikacji 'BRCA_Pathology' i 'pathologic_stage' nadal będą miały braki (NA).
# Zamiast usuwać wiersze, lepiej zamienić NA na nową kategorię "Unknown".
# Używamy forcats::fct_explicit_na()
df_clean <- df_clean %>%
  mutate(
    pathologic_stage = fct_explicit_na(pathologic_stage, na_level = "Unknown"),
    BRCA_Pathology = fct_explicit_na(BRCA_Pathology, na_level = "Unknown")
  )

# Sprawdzenie danych
cat("--- Wynik po czyszczeniu (glimpse) ---\n")
glimpse(df_clean)

cat("\n--- Wynik po czyszczeniu (skim) ---\n")
skim(df_clean)


# Lista kolumn diagnostycznych do czyszczenia
cols_to_factor <- c(
  "diagnoses.ajcc_pathologic_stage",
  "diagnoses.ajcc_pathologic_t",
  "diagnoses.ajcc_pathologic_n",
  "diagnoses.ajcc_pathologic_m",
  "treatments.treatment_outcome"
)

# Czyścimy '--' na NA i konwertujemy na faktor
df_clean <- df_clean %>%
  mutate(across(all_of(cols_to_factor), ~ na_if(., "'--'"))) %>%
  mutate(across(all_of(cols_to_factor), as.factor))

cat("--- Glimpse po doczyszczeniu metadanych ---\n")
glimpse(df_clean)
install.packages("caret")
library(caret)


# Wybieramy tylko kolumny z danymi numerycznymi (od ERALPHA do CD24)
df_features <- df_clean %>%
  select(ERALPHA:CD24) # Używamy nazw do zaznaczenia zakresu

nzv_metrics <- nearZeroVar(df_features, saveMetrics = TRUE)

# Sprawdzamy, czy któreś kolumny zostały oflagowane jako NZV
problematic_cols <- filter(nzv_metrics, nzv == TRUE)

if(nrow(problematic_cols) > 0) {
  cat("Znaleziono kolumny o niskiej wariancji (NZV):\n")
  print(rownames(problematic_cols))
  
  # Usuwamy te kolumny
  cols_to_remove <- rownames(problematic_cols)
  df_clean <- df_clean %>%
    select(-all_of(cols_to_remove))
  
  cat("\nUsunięto kolumny NZV. Nowa liczba kolumn:", ncol(df_clean), "\n")
  
} else {
  cat("Gratulacje! Brak kolumn o niskiej wariancji (NZV).\n")
}

library(janitor)


df_final <- df_clean %>%
  clean_names()


cat("--- Podgląd oczyszczonych nazw kolumn ---\n")
glimpse(df_final)

library(readr) 

write_csv(df_final, "merged_data_cleaned.csv")

