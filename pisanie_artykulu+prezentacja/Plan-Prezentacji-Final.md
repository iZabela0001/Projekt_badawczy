# PLAN PREZENTACJI: Multi-Omics Analysis of Breast Cancer Subtypes
## Zoptymalizowany Plan do Realizacji w PowerPoint/Keynote

---

## SLAJD 1: TYTUŁOWY

### Wizualnie:
- Tytuł główny (48pt, bold, białe)
- Podtytuł (32pt, jasno szare)
- Imiona autorów (24pt)
- Logo uniwersytetu + departamentu (dolny róg)
- Background: ciemny (gradient ciemny niebieski → czarny)

### Tekst na slajdzie:
```
Co zabija raka piersi?

Odkrywanie ukrytych mechanizmów agresywności guzów poprzez 
integracyjną analizę transkryptomu, proteom i miRNA

Izabela Reszka, Piotr Wiśniewski, Klaudia Woźniak
[Uniwersytet/Instytut]
```

### Narracja (20 sekund):
"Rak piersi zabija ponad 700 000 kobiet rocznie na świecie. Ale pewne rodzaje raka mogą być wyleczalne, a inne pozostają oporne na wszystkie terapie. Dzisiaj pokażemy, dlaczego. Szukaliśmy odpowiedzi na pytanie: co biologicznie różni dobry rak od złego? I odkryliśmy coś zadziwiającego – to nie obojętny brak receptorów, ale aktywny plan, napisany małymi cząsteczkami RNA."

---

## SLAJD 2: PROBLEM KLINICZNY

### Tytuł slajdu:
"Cztery twarze raka piersi – Dlaczego leki działają dla jednych, a nie dla innych?"

### Wizualnie (3-część layout):

**CZĘŚĆ A (Górny lewy):**
Pudełka z informacjami:
```
✅ LUMINAL A
   5-letnie przeżycie: 92%
   Receptory: ER+ PR+ HER2-
   Leki hormonalne DZIAŁAJĄ

⚠️ LUMINAL B
   5-letnie przeżycie: 82%
   Receptory: ER+ PR± HER2-/+
   Problem: proliferacja (Ki-67 wysoki)

🔴 HER2-ENRICHED
   5-letnie przeżycie: 65%
   Receptory: HER2+
   Trastuzumab to rozwiązał

❌ BASAL-LIKE (Triple Negative)
   5-letnie przeżycie: 28%
   Receptory: ER- PR- HER2-
   BEZ RECEPTORÓW = bez leków!
```

**CZĘŚĆ B (Górny prawy):**
Pudełko z pytaniem:
```
Dlaczego Basal-like jest taki zły?

Hipoteza #1 (stara):
"Brak receptorów = guz pasywny"

Hipoteza #2 (nasza):
"Aktywna supresja receptorów
 przez miRNA"

To jest nasz projekt!
```

**CZĘŚĆ C (Dolna):**
- Mapa świata z zaznaczeniami: Polska (150/rok), USA (23,000/rok), Świat (700,000 zgonów/rok)
- Napis: "28% kobiet z TNBC żyje 5 lat. 92% kobiet z Luminal A żyje 5 lat."

### Narracja (70 sekund):
"Zobaczcie tę mapę. Każdego roku 700 000 kobiet na świecie umiera z powodu raka piersi. Ale nie wszystkie umierają z tej samej przyczyny.

Rak piersi to cztery różne choroby. Luminal A – to najłagodniejsza. 92% pacjentek żyje 5 lat. Mamy dla niej terapię – receptory hormonalne, więc możemy dać leki hormonalne.

HER2-positive – był problem, ale Trastuzumab to rozwiązał. Teraz też 65-75% przeżycia.

Ale jest czwarta grupa: Basal-like, zwana też TNBC – Triple Negative. Bez receptorów ŻADNYCH. Przeżycie: zaledwie 28%. To znaczy – nie wiemy jak je leczyć.

Czyli pytanie brzmi: Dlaczego te guzy nie mają receptorów? Czy to przypadek? Czy może... aktywna liczba zabijająca te receptory?

To jest pytanie, na które chcieliśmy odpowiedzieć."

---

## SLAJD 3: CEL I METODYKA

### Tytuł slajdu:
"Dlaczego musimy patrzeć PONIŻEJ transkryptomu? (DNA → RNA ≠ RNA → Białko)"

### Wizualnie (3-część):

**CZĘŚĆ A (Górny lewy):**
Pudełko - Problem:
```
Klasyczne podejście (mRNA only):

DNA ──transcription──> mRNA
                       ↓
                    Protein (?)

BŁĄD: Zakładamy
mRNA = Protein

RZECZYWISTOŚĆ:
Spearman ρ (mRNA vs Protein) = 0.3-0.4
70% wariancji białka nie wyjaśnia się mRNA!
```

**CZĘŚĆ B (Górny prawy):**
Pudełko - Nasze rozwiązanie:
```
Nasz model (Post-transcriptional):

DNA ──transcription──> mRNA
                       ↓
         🔴 miRNA (MISSING LAYER)
         (miR-17, miR-20a, miR-210)
                       ↓
                    Protein

ESR1 protein pada mimo że ESR1 mRNA jest!
To wyjaśnia fenotyp "receptor-null"
```

**CZĘŚĆ C (Dolna):**
```
DANE I METODY:
Źródło: The Cancer Genome Atlas (TCGA)
N = 1,217 próbek

3 warstwy danych:
• RNA-seq (mRNA)
• RPPA (białka)
• miRNA-seq (regulatory RNA)

ANALIZA:
→ Limma (DE analysis)
→ Spearman (correlation)
→ Consensus miRNA prediction
→ Cox model (survival)
→ Internal validation (70/30 split)
```

### Narracja (45 sekund):
"Wiecie dlaczego klasyczne badania DNA/RNA tracą 70% informacji?

Większość projektów sekwencjonuje gen, mierzy mRNA i mówi: 'gotowe'. Ale białko – to, co naprawdę pracuje w komórce – może być całkowicie inne!

To jak mierzyć ile fabryka produkuje części, ignorując robotników, którzy je niszczą. miRNA to robotnicy.

W tym projekcie poszliśmy poniżej. Zmierzyliśmy z 1,200 próbek:
- Jaki kod mRNA
- Jaki faktycznie jest białkiem
- A najważniejsze: CO TYCH BIAŁEK UBYWA – czyli miRNA

Integracja trzech warstw pozwala nam odpowiedzieć: 'Dlaczego ESR1 białko zniknęło w Basal-like guzach?'

Spoiler: To miRNA!"

---

## SLAJD 4: KLUCZOWE ODKRYCIE 1 – MECHANIZM BASAL-LIKE

### Tytuł slajdu:
"Eureka! Znaleźliśmy 'hamulec' – miRNA-driven FOXA1/ESR1 suppression w TNBC"

### Wizualnie (3-panel layout):

**PANEL A (LEWY): Volcano Plot (Basal vs Luminal A)**
- Oś X: log2 fold-change (-6 do +6)
- Oś Y: -log10(p-value) (0 do 20)
- Górny lewy: miRNA (czerwone punkty) – miR-17, miR-20a, miR-210, miR-155
- Dolny prawy: mRNA (niebieskie punkty) – ESR1, FOXA1, KRT19
- Strzałka: "Czy miRNA tłumią mRNA?"
- Legenda: Red = miRNA upregulated, Blue = mRNA downregulated

**PANEL B (ŚRODKOWY): Heatmap - Protein Concordance**
- Wiersze: miRNA (miR-17, miR-20a, miR-210)
- Kolumny: Target proteins (ESR1, FOXA1, PGR, GATA3, KRT19)
- Basal-like samples: CZERWONE (high miRNA) + NIEBIESKIE (low protein)
- Luminal A samples: NIEBIESKIE (low miRNA) + CZERWONE (high protein)
- Strzałka: "mRNA + Protein CONCORDANCE = Validation!"
- Tekst: "High miRNA = Low Target Protein = ACTIVE SUPPRESSION"

**PANEL C (PRAWY): Schemat Biologiczny**
```
LUMINAL A (Healthy):
Nucleus: FOXA1 ✓ ESR1 ✓
miRNA: miR-17/20a/210 LOW
Outcome: ER-driven transcription
Phenotype: HORMONALLY RESPONSIVE
Survival: 92%

BASAL-LIKE (Tumor):
Nucleus: FOXA1 ✗ ESR1 ✗
miRNA: miR-17/20a/210 HIGH ⬆️
Mechanism: miR-17 binds ESR1 3'UTR
          → Degrades mRNA
          → No protein synthesis
Outcome: ER-silenced
Phenotype: AGGRESSIVE, THERAPY-RESISTANT
Survival: 28%
```

### Narracja (75 sekund):
"To jest moment 'eureka'. Na tym volcano plote widzicie:

Po lewej stronie (górnie): nasze miRNA. Zaczęły się rozmnażać.
miR-17: +2.4 fold, miR-20a: +2.1 fold, miR-210: +3.8 fold!
To znaczy – ekspresja tych miRNA EKSPLODOWAŁA w Basal-like.

Po prawej stronie (dolnie): receptory. Zaczęły znikać.
ESR1: −1.8 fold (zmniejszona o połowę)
FOXA1: −2.1 fold (zmniejszona niemal trzykrotnie!)

Ale czekajcie. Może to zbieg okoliczności? Może ESR1 mRNA jest tam, a białko jakoś naturalnie się rozkłada?

PANEL B pokazuje: NIE. To nie zbieg. miRNA NAPRAWDĘ tłumią białka.
Widzicie: gdzie miRNA wysoki (Basal – wiersze na górze), tam protein niski (kolory niebieskie).
To jest **AKTYWNA SUPRESJA**. To jest jak 'hamulec' naciskany przez miRNA.

PANEL C to mechanizm. W normalnym raku (Luminal A) FOXA1 i ESR1 pracują. Receptory sterują transkrypcją. Guz jest kontrolowany.

Ale w Basal-like? miRNA 17/20a zabija ESR1. Brak FOXA1 = brak dostępu do DNA. Brak ER = brak terapii. Brak kontroli = guz rośnie agresywnie.

To jest pułapka: guzy celowo wyłączają swoje hamulce poprzez miRNA!"

---

## SLAJD 5: KLUCZOWE ODKRYCIE 2 – LUMINAL B

### Tytuł slajdu:
"Zwrot akcji: Luminal B – Dobry rak z Złą Osobowością"

### Wizualnie (3-część):

**CZĘŚĆ A (Górny lewy): Paradoks**
```
Luminal A vs Luminal B:
Oba mają ER + PR (receptory!)

Luminal A:
• ER+  PR+  HER2-
• MKI67 NISKI (30-40%)
• Przeżycie: 92%
• Terapia: Hormonalna
• Wynik: ✓ Pacjentka żyje!

vs.

Luminal B:
• ER+  PR±  HER2±
• MKI67 WYSOKI (>60%) ⬆️⬆️
• Przeżycie: 82% ⬇️
• Terapia: Hormonalna + ?
• Problem: ???

Pytanie: Co różni B od A?
Odpowiedź: Proliferacja + miRNA
```

**CZĘŚĆ B (Górny prawy): Boxplot MKI67**
- Oś X: Luminal A vs Luminal B
- Oś Y: Log2(MKI67 expression)
- Luminal A: Mediana = -0.5
- Luminal B: Mediana = +1.5
- Różnica: +2.0 log2 FC, p < 0.001
- Anotacja: "Luminal B = 3x Wyższa proliferacja"

**CZĘŚĆ C (Dolna): Schemat Mechanizmu**
```
miR-210 (Hypoxia-Responsive miRNA)
        ↓ (HIGH w Luminal B)
Binds PGR 3'UTR
        ↓
PGR mRNA degraded
        ↓
NO PROGESTERONE RECEPTOR
        ↓
Loss of Antiproliferative Signal
        ↓
Cell Cycle: Ki-67 HIGH
        ↓
Aggressive Proliferation
        ↓
Faster Relapse & Poor Survival
```

### Narracja (60 sekund):
"Ale czekajcie – odkryliśmy coś dziwnego.

Luminal B ma receptory. Dokładnie jak Luminal A. Więc czemu pacjentki gorzej przeżywają?

Odpowiedź: to nie jest czystość receptorów. To TEMPO wzrostu.

Zobaczcie Boxplot: Luminal A ma niski Ki-67 (marker proliferacji). Guzy rosną powoli. Są 'leniwą'. Receptory je hamują.

Luminal B? Inny zwierzak. Ki-67 TAK wysoki! To znaczy – guzy rosną szybko. Tak szybko, że zanim hormonalna terapia zadziała, guz już się rozprzestrzeniła.

Dlaczego Ki-67 wysoki w B? Nasza analiza mówi: miR-210.

miR-210 to miRNA-responsive na niedotlenienie. To marker 'głodnych' guzów, które rosną szybko bez tlenu.

Ta miR-210 zabija receptor progesteronu (PGR). Bez PGR? Brak hamowania proliferacji. Guz robi co chce.

To jest **'dobry rak z złą osobowością'**. Luminal B: 'Mam receptory, ale brakuje mi hamulców!'"

---

## SLAJD 6: ANALIZA PRZEŻYCIA – WERYFIKACJA KLINICZNA

### Tytuł slajdu:
"Rzeczywistość: Stadium Wygrywa – Ale miRNA Dają Wskazówkę"

### Wizualnie (3-część):

**CZĘŚĆ A (Górny lewy): Forest Plot (Cox Model)**
```
MULTIVARIABLE COX MODEL
Outcome: Overall Survival

Variable              HR      95% CI        p
────────────────────────────────────────────
Stage (III vs I)     ●━━━━━━━>
                     2.31   [1.78-3.01]
                     p < 0.001 ★★★

Age (per +10yr)      ●━━━━>
                     1.23   [0.98-1.51]
                     p = 0.082

miRNA Score          ●━>
(continuous)         1.18   [0.99-1.40]
                     p = 0.068

Interpretacja:
★★★ = DOMINANT effect
Stage: NAJWIĘKSZY efekt (HR=2.31)
miRNA: MAŁY ale znaczący efekt
```

**CZĘŚĆ B (Górny prawy): Kaplan-Meier Curves**

KRZYWA 1 (górna):
- Stratyfikacja: STAGE
- Stage I (zielona): 100% survival na 5 lat
- Stage III (czerwona): 40% survival na 5 lat
- Log-rank: p < 0.001
- Wnioski: Stadium = KING of predictors

KRZYWA 2 (dolna):
- Stratyfikacja: miRNA Score (warunkowe na Basal-like)
- Low miRNA (niebieska): 35% survival na 5 lat
- High miRNA (czerwona): 25% survival na 5 lat
- Log-rank: p = 0.042
- Wnioski: miRNA = dodatkowa informacja

**CZĘŚĆ C (Dolna): Interpretacja Kliniczna**
```
Co to OZNACZA dla praktyki:

✓ Stadium nadal decyduje
  (leczenie Stage III ≠ Stage I)

✓ Ale w obrębie jednego Stadium...
  miRNA score może stratyfikować
  pacjentów na wyższe/niższe ryzyko

Przykład:
Dwie pacjentki, oba Stage III.
Jedna: miRNA-HIGH (25% survival)
Druga: miRNA-LOW (35% survival)

To 40% RÓŻNICA w ryzyku!
(Może wpłynąć na decyzję leczenia)

⚠️ LIMITS:
• Test cohort mały (n=365)
• p = 0.042 jest pogranicze
• Wymaga validacji w innym cohort
```

### Narracja (60 sekund):
"No dobrze, teoria. Ale czy to faktycznie przewiduje przeżycie?

Sprawdziliśmy. I musimy być uczciwi.

Forest Plot – to Model Coxa. Włożyliśmy ALL: stadium, wiek, PAM50 subtype, nasz miRNA score.

Rezultat? Stadium wygrywa. HR = 2.31. To znaczy: pacjentka ze Stage III ma dwa razy wyższe ryzyko zgonu niż Stage I. To DOMINANT faktor.

miRNA score? HR = 1.18. To jest mniejszy efekt. Ale nie zero. To jest MARGINALNIE istotne (p = 0.068). Na granicy.

Teraz Kaplan-Meier. Górna krzywa – stratyfikacja po Stadium. DRAMATYCZNA różnica. To jest co wiemy od 20 lat. Stadium działa.

Dolna krzywa – ale to ciekawe. Jeśli patrzmy TYLKO na pacjentki z TNBC i stratyfikujemy po miRNA score? Jest różnica. p = 0.042.

Co to oznacza? Że w raku już wykrytym, miRNA mogą dać dodatkową wskazówkę. Dwie pacjentki o tym samym stadium – ale różny miRNA score – mogą mieć różne wyniki.

To nie rewolucja. Ale to wskazówka."

---

## SLAJD 7: PODSUMOWANIE – ODKRYCIE, LIMITY, PRZYSZŁOŚĆ

### Tytuł slajdu:
"Podsumowanie: Odkrycie, Limity, Przyszłość"

### Wizualnie (3-rama layout + finale):

**RAMA 1 (Górny lewy - ZIELONA): Nasze Odkrycie**
```
✅ WHAT WE FOUND:

1. Basal-like ≠ "passive loss"
   → It's ACTIVE suppression
   by miR-17/20a/210 axis

2. FOXA1 & ESR1 are targets
   3'UTR binding confirmed
   (TargetScan + miRDB consensus)

3. mRNA ≠ Protein
   (70% variance unexplained)
   Multi-omics reveals mechanism

4. Luminal B: high Ki-67 phenotype
   driven by miR-210 + PGR loss

BIG PICTURE:
"Guzy wyłączają hamulce
 nie przypadkowo – aktywnie!"
```

**RAMA 2 (Górny prawy - ŻÓŁTA): Nasze Limity**
```
⚠️ LIMITATIONS WE ACKNOWLEDGE:

1. No experimental validation
   • Need: Luciferase assays
   • Need: CLIP-seq (cells)
   • Need: Therapeutic knockdown
   → Proves causation, not correlation

2. TCGA bias
   • Tertiary centers (2009-2013)
   • May not represent population
   • Need: External validation
     (METABRIC, ICGC-BRCA)

3. Marginal p-values
   • miRNA score p = 0.068
   • Multiple testing concerns

4. Small test cohort (n=365)
   • May lack power for
     subtype-specific findings

HONESTY IS BEST SCIENCE!
```

**RAMA 3 (Dolna - FIOLETOWA): Przyszłość**
```
🚀 NEXT STEPS & THERAPEUTIC PATH:

IMMEDIATE (1-2 lata):
• Experimental validation
  → FOXA1/ESR1 targets in SUM149,
    MDA-MB-231 cell lines
  → CLIP-seq to map real binding

CLINICAL TRANSLATION (3-5 lat):
• Anti-miRNA therapeutics testing
  → antagomiRs (LNA inhibitors)
  → miRNA sponges
  → CRISPR-based approaches

CLINICAL TRIAL (5-10 lat):
• Phase I/II: Anti-miR + Chemo in TNBC
• Combination: Anti-miR
  + endocrine therapy restoration

WHY MATTERS:
• Current TNBC: only chemo + I.T.
• If we can restore ER?
  → Endocrine therapy becomes option
  → Better outcomes
  → Less toxic treatment

WILD HOPE: "Rewiring cancer to be
treatable with less toxic drugs"
```

**FINALE (Dolne – CZARNE / GŁĘBOKIE)**
```
TAKE-HOME MESSAGE (30 sekund):

1️⃣ Rak piersi to cztery choroby
   → różne biologia = różne leczenie

2️⃣ Agresywny Basal-like to nie
   "pech genetyczny"
   → To AKTYWNA supresja przez miRNA

3️⃣ Multi-omics shows HOW:
   → mRNA alone = 30% of variance
   → Proteins = reality
   → miRNA = hidden layer

4️⃣ Therapeutic hope:
   → Anti-miRNA drugs can rewire
      aggressive cancers to be treatable

5️⃣ But: Need validation
   → Experiment + External cohorts
   → THEN clinical trials

🎯 BOTTOM LINE:
"We found a LOCK (miRNA-FOXA1)
 Now we need a KEY (anti-miRNA drugs)
 This could change how we treat
 triple-negative breast cancer"
```

### Narracja (75 sekund):
"Podsumowanie w trzech ramkach.

RAMA 1 – Odkrycie. Udało nam się pokazać, że agresywny rak piersi to nie 'szansa' genetyczna, ale aktywnie utrzymywany fenotyp. Guzy wyłączają swoje hamulce (receptory) poprzez miRNA. To jest mechanizm – nie tylko opis.

RAMA 2 – Ale uczciwości. Zrobiliśmy modelowanie. Nie zrobiliśmy eksperymentu. Nie wiemy na 100%, że miRNA faktycznie tłumią ESR1. To jest korelacja, nie przyczynowość. I nasze badania na TCGA – to tertiarne centra, 10 lat temu. Mogą nie reprezentować populacji. Więc musimy powiedzieć: to potrzebuje validacji.

RAMA 3 – Droga naprzód. Jeśli mamy rację – a myślimy że mamy – to otwiera drogę do nowych leków. Anti-miRNA są już używane w innych chorobach (hep C). Mogą działać tutaj. Mogą 'przywrócić' receptory i sprawić, że TNBC będzie podatny na hormonalną terapię. To jest nadzieja na leczenie, które jest mniej toksyczne niż chemoterapia.

Ale – musimy być realiści. To wymaga lat pracy. Eksperymentów. Badań na pacjentach.

TAKE-HOME: Znaleźliśmy LOCK. Teraz szukamy KEY."

---

## SLAJD 8: PYTANIA I DYSKUSJA (OPCJONALNY)

### Tytuł slajdu:
"Pytania? Dyskusja"

### Wizualnie:
- Duża ikona lub fotografia pytania
- Napis: "Co chcielibyście wiedzieć?"

### Przygotowane odpowiedzi:

**Q1: "Czy to może być leczono anty-miRNA już teraz?"**
A: "Nie. Potrzebujemy validacji eksperymentalnej i validacji w niezależnym cohort klinicznym. Ale droga jest jasna i mamy precedens (miravirsen w hep C)."

**Q2: "Ile czasu wymagałoby takie leczenie na rynku?"**
A: "5-10 lat. FDA wymaga: phase I (safety), phase II (efficacy), phase III (comparative). Każda faza to 1-3 lata + time to regulatory approval."

**Q3: "Czy te wyniki dotyczą tylko TCGA czy też całej populacji?"**
A: "TCGA jest proxy dla tertiarnych centrów zachodu. Chcemy validować w METABRIC (Europa) i ICGC-BRCA (globalne), aby sprawdzić czy efekt się replikuje."

**Q4: "Jak to porównuje się z innymi pracami nad miRNA w raku piersi?"**
A: "Nasza praca skupia się na POST-TRANSCRIPTIONAL regulation – to jest nowa perspektywa. Większość prac patrzy tylko na mRNA. My pokazujemy że białka są inne."

### Czas:
2-3 minuty dyskusji

---

## TECHNICAL GUIDELINES – IMPLEMENTACJA

### Spójność Kolorów (używać na WSZYSTKICH slajdach)

```
PAM50 SUBTYPES:
• Luminal A: #2ecc71 (zielony - spokojny)
• Luminal B: #f39c12 (pomarańczowy - wyżej)
• HER2-enriched: #3498db (niebieski - cel)
• Basal-like: #e74c3c (czerwony - agresywny)

EXPRESSION CHANGES:
• Upregulated: #e74c3c (czerwony)
• Downregulated: #3498db (niebieski)
• Neutral: #95a5a6 (szary)

SURVIVAL CURVES:
• Good (high survival): #2ecc71 (zielony)
• Poor (low survival): #e74c3c (czerwony)
• Reference: #000000 (czarny dashed)

BACKGROUND:
• Slide background: #1c1c1c (ciemny)
• Text: #ffffff (biały) lub #ecf0f1 (jasno szary)
• Accent: #3498db (niebieski)
```

### Czcionki
- Tytuł slajdu: 44-48pt, bold
- Sekcje główne: 32-36pt, bold
- Tekst zawartości: 24-28pt, regular
- Dane labels: 18-22pt
- Legend: 14-16pt (minimum 14pt dla czytelności z 10m)

### Layout
- Białe/jasne tło tekstu na ciemnym tle slajdu
- Nie więcej niż 6 linii tekstu na główny punkt
- Nie więcej niż 6 słów na linię (6x6 rule)
- Wylącz gridlines z wykresów (data-ink ratio)

### Timing
```
Slajd 1 (Title):           20 sec
Slajd 2 (Problem):         70 sec
Slajd 3 (Methods):         45 sec
Slajd 4 (Discovery 1):     75 sec
Slajd 5 (Discovery 2):     60 sec
Slajd 6 (Survival):        60 sec
Slajd 7 (Conclusions):     75 sec
Slajd 8 (Q&A):          2-3 min
─────────────────────────────
RAZEM:                 ~8.5 min
```

---

## CHECKLIST PRZED PREZENTACJĄ

### 1 dzień przed:
- [ ] Wszystkie liczby na slajdach = artykuł
- [ ] Kolory spójne na WSZYSTKICH slajdach
- [ ] Czcionka ≥18pt na wszystkich labels
- [ ] Każdy slajd ma jedno jasne message
- [ ] Narracja jest story-driven (problem → discovery → hope)
- [ ] Dry run 2-3x (zapamiętaj timing)
- [ ] Technika: laptop + projektor testowanie

### Podczas prezentacji:
- [ ] Eye contact z publiczością (nie czytaj ze slajdu)
- [ ] Pauzy po kluczowych odkryciach (daj czas na przyswoienie)
- [ ] Wskaż elementy na slajdzie (pointer)
- [ ] Pytaj retoryczne ("Czy to zbieg? Nie, bo...")
- [ ] Kontroluj tempo (nie szybko przez stres)
- [ ] Mów naturalnie (nie monotonnie)

### Q&A (po prezentacji):
- [ ] Powtórz pytanie zanim odpowiadasz (auditorium słyszy)
- [ ] Dziękuj za pytanie
- [ ] Jeśli nie wiesz: "Świetne pytanie. Nie mam odpowiedzi teraz, ale się tym zajmiemy"
- [ ] Odwracaj pytania do auditorium jeśli to ma sens

---

## KLUCZOWE METRYKI PREZENTACJI

| Element | Target | Status |
|---------|--------|--------|
| Hook (Slide 1) | Retoryczne pytanie | ✓ "Co zabija raka piersi?" |
| Problem (Slide 2) | Emocja + liczby | ✓ 92% vs 28% przeżycia |
| Methods (Slide 3) | Jasna wartość dodana | ✓ 70% variance explained |
| Discovery (Slides 4-5) | Konkretne fold-changes | ✓ miR-17: +2.4, miR-210: +3.8 |
| Validation (Slide 6) | Honesty + implications | ✓ HR=2.31 dominant, HR=1.18 marginal |
| Conclusion (Slide 7) | Tri-frame: Find/Limit/Future | ✓ LOCK & KEY metafora |
| Timing | 8-9 minutes | ✓ 8.5 min core + 2-3 min Q&A |
| Audience | Technical + Clinical | ✓ Mixed level accessibility |

---

## NOTATKI DODATKOWE

### Dla Prezentacji Online:
- Użyj screen sharing, nie full-screen nagrania
- Powiększ czcionkę +2pt (online = gorsza czytelność)
- Możliwy jest longer timing (9-10 min dopuszczalne)

### Dla Konferencji Naukowej:
- Zapamiętaj limit (zwykle 10 min talk + 5 min Q&A)
- Przygotuj 1 backup slajd z dodatkowymi metodami (jeśli pytania)
- Drukuj handout (1-2 strony podsumowania)

### Dla Inwestorów / Pitch:
- Podkreśl RAMA 3 (Przyszłość i therapeutic path)
- Zmień "akademickie" wording na "commercial opportunity"
- Dodaj slide o "Market size TNBC therapeutics"

---

## FINALNE SŁOWA

Ta prezentacja zmienia narrację z **"data dump"** na **"scientific story"**. Każdy slajd ma jedno jasne message, wspierane konkretnymi liczbami i mechanizmem biologicznym.

Kluczowe cechy:
1. ✓ **Hook** na başcie (Slide 1)
2. ✓ **Emocja + liczby** w problemie (Slide 2)
3. ✓ **Trzy perspektywy** dla każdego wyniku (tri-panel)
4. ✓ **Uczciwość** w limitacji (Slide 7)
5. ✓ **Metafora zapamiętywalna** (LOCK & KEY)
6. ✓ **Konkretne timesboxing** (~8.5 min)

**Prezentacja jest gotowa do implementacji w PowerPoint/Keynote.**

---

*Dokument opracowany: 14.12.2025*
*Wersja: 1.0 (Final Ready-to-Use)*
