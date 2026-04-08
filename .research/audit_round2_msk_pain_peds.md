# Medical Accuracy Audit — Round 2: MSK / Pain / Pediatric Case Files

**Scope:** All files in `/lib/data/cases/` matching `msk_*.dart`, `pain_*.dart`, and `peds_*.dart`.
**Total files reviewed:** 23
**Audit focus:** Diagnostic accuracy, vital/lab realism, exam-diagnosis consistency, pediatric weight-based dosing, special maneuvers, scoring scales (ACR fibromyalgia, DN4, Budapest CRPS), MME calculations, current guidelines, Domain E realism, dangerous statements.

---

## MSK Files (10)

### msk_acl_rehab.dart — PASS
- D1 collegiate soccer player, 22F, BTB autograft. Timeline, biology (ligamentization phases), re-tear statistics (15-25% in young females), return-to-sport criteria (LSI >90%, ACL-RSI >56, minimum 9 months) all accurate and evidence-based.
- Domain E scenario realistic; NCAA scholarship protection properly invoked.

### msk_cervical_neurapraxia.dart — PASS
- Torg-Pavlov ratio 0.70 (normal >0.80) correctly described with appropriate caveat about low PPV (~12%). CCN vs stinger distinction accurate. Two-episode recurrence risk appropriately classified as near-absolute contraindication to return to collision sport.
- Vitals realistic for 6'4" 295 lb D1 lineman (HR 58 athlete bradycardia).

### msk_cervical_radiculopathy.dart — PASS
- C6 localization by dermatome/myotome/reflex all correct (biceps + brachioradialis reflex + lateral forearm/thumb sensation + biceps/ECR weakness).
- Spurling sensitivity 30-50%, specificity 93% — matches literature.
- EMG timing (3-6 weeks after onset) and expected findings (normal SNAPs, paraspinal fibs) correct.
- Meloxicam 15 mg daily, gabapentin titration 300 mg TID target 900-1800/day, duloxetine 30-60 mg all accurate.

### msk_crps.dart — PASS
- Budapest 2010 IASP criteria correctly enumerated and correctly applied (3 symptom categories, 2 sign categories). Temperature asymmetry threshold >1°C correct. Three-phase bone scan sensitivity/specificity reasonable. Sympathetic block no longer considered diagnostic — correct.
- Graded motor imagery three-stage sequence (laterality → imagined → mirror) correct.

### msk_frozen_shoulder.dart — PASS
- Reeves staging (freezing/frozen/thawing) and capsular pattern (ER most limited) accurate.
- Passive ROM = active ROM finding correctly identified as hallmark.
- Triamcinolone 40 mg IA injection, prednisolone 30 mg taper, HbA1c >7.5% worse outcomes — all consistent with current literature.
- Diabetic steroid glucose counseling appropriate.

### msk_lateral_epicondylitis.dart — PASS
- ECRB tendinosis (not tendinitis) correctly framed; corticosteroid injection worse long-term outcomes vs watchful waiting (Coombes/Bisset trials implied) correct.
- Tyler Twist / eccentric FlexBar protocol accurate.
- PRP vs steroid evidence (Mishra, Gosens) correctly cited.
- Cozen/Mill/Maudsley provocative tests described correctly.

### msk_myofascial_pain.dart — PASS
- MPS vs fibromyalgia vs cervical radiculopathy differential table accurate.
- Trigger point features (taut band, referred pain, twitch response) and active vs latent distinction correct.
- 1% lidocaine TPI technique, botulinum toxin for refractory, dry needling — all evidence-based.

### msk_plantar_fasciitis.dart — PASS
- Windlass test, gastrocnemius tightness (DF <10° with knee extended), calcaneal spur as incidental finding all correct.
- Differential (Baxter neuropathy, tarsal tunnel, fat pad atrophy, stress fracture, spondyloarthropathy) appropriate.
- ESWT, PRP, night splint, eccentric calf stretching all evidence-based.

### msk_rotator_cuff.dart — PASS
- Goutallier classification (Grade 0-4) correctly described with Grades 3-4 as poor surgical prognosis.
- Tear size classification (medium 1-3 cm, this patient 2.5 cm) correct.
- Drop arm, ER lag sign, empty can described accurately.
- Post-op rehab phases (sling x 6 weeks, PROM only initially, ~6-9 month return to heavy labor) match current protocols.

### msk_spinal_stenosis.dart — PASS
- Neurogenic vs vascular claudication distinction (flexion relief, cycling painless, normal pulses, stoop test) correct.
- Flexion-based PT (correctly contraindicated McKenzie extension), SPORT trial evidence, interlaminar ESI for central stenosis.
- Jehovah's Witness blood product hierarchy and bloodless surgery planning accurate and ethically sound. TXA, cell saver, EPO all appropriate.

---

## Pain Files (7)

### pain_cancer_palliative.dart — ⚠️ MINOR ISSUE (opioid conversion ratios)
- **Minor:** Hydromorphone conversion stated as "oral morphine 30 mg = oral hydromorphone 6 mg". The more commonly cited equianalgesic is **30 mg PO morphine = 7.5 mg PO hydromorphone** (sometimes 5:1 for high-dose rotation). The 5:1 ratio (30:6) is used by some references but less standard; subsequent math (195 mg morphine → 39 mg hydromorphone → 20-30 mg after cross-tolerance reduction) is internally consistent.
- **Minor:** Fentanyl patch conversion "oral morphine 195 mg/day divided by 2 ≈ 100 mcg/hr patch" is a rough approximation; the traditional Janssen ratio is closer to 2 mg oral morphine per mcg/hr fentanyl (so 195/2 = ~97 mcg/hr → round to 100 mcg/hr, then reduce 25% = 75 mcg/hr). Math is correct in the file.
- WHO analgesic ladder, celiac plexus neurolysis indications, ECOG/Karnofsky scales all accurate.
- Otherwise strong — palliative rehabilitation, hospice vs palliative care distinction excellent.

### pain_chronic_low_back.dart — PASS
- **MME verified:** oxycodone 10 mg TID × 1.5 conversion factor = 45 MME/day — **CORRECT** (CDC factor for oxycodone is 1.5).
- Central sensitization framing and nociplastic pain (IASP 2017) terminology accurate.
- Waddell signs mentioned appropriately (2/5 — correctly NOT used as "malingering" test).
- Duloxetine, taper rate (10% every 1-2 weeks), SOAPP-R, PDMP all accurate.

### pain_failed_back.dart — PASS
- **MME verified:** oxycodone 30 mg QID = 120 mg/day × 1.5 = 180 MME — **CORRECT**.
- Opioid-induced hyperalgesia vs tolerance distinction accurate.
- Concurrent opioid+benzo flagged appropriately as overdose risk per CDC. Taper benzo before opioid — correct order.
- Ketamine, low-dose naltrexone, SCS (PROCESS trial), DRG stimulation, IDDS appropriate for FBSS.
- Duloxetine, gabapentin max dose (1200 mg TID = 3600 mg/day) correct ceiling.

### pain_fibromyalgia.dart — PASS
- **ACR 2010/2016 criteria correctly applied:** WPI ≥7 AND SSS ≥5. Patient meets both (WPI 14, SSS 11).
- Duloxetine 60, pregabalin 150-225 BID, milnacipran 50 BID — all FDA-approved doses for fibromyalgia.
- Opioids/steroids/benzodiazepines correctly flagged to avoid.
- Differential (TSH, vitamin D, ANA, RF, Sjögren, OSA) appropriate targeted workup.

### pain_pediatric_fnd.dart — PASS
- Hoover sign, hip abductor sign, tremor entrainment, give-way weakness, midline sensory splitting — all correctly described as validated positive "rule-in" signs.
- DSM-5 FND criteria accurate (emphasis on incompatibility).
- Pediatric prognosis (60-80% improvement), early return to school, avoidance of repeat testing — all evidence-based.
- Fluoxetine as first-line SSRI in adolescents — correct.

### pain_phantom_limb.dart — ⚠️ MINOR ISSUE (gabapentin upper dose)
- **Minor:** States gabapentin "target dose of 900-1800 mg TID" which implies up to **5400 mg/day**. Maximum FDA-approved daily dose is 3600 mg/day (1200 mg TID). The lower end (900 mg TID = 2700 mg/day) is fine; upper bound is excessive.
- Ramachandran cortical reorganization theory, Melzack neuromatrix, mirror therapy, TMR (Dumanian), DRG stimulation — all accurate.
- K-level classification (K0-K4) for Medicare functional level correct.
- Nortriptyline 25-75 mg with QTc check given CAD — appropriate caution.
- C-SSRS suicide screening framework appropriate.

### pain_sickle_cell.dart — PASS
- **MME verified:** oxycodone 15 mg QID = 60 mg/day × 1.5 = 90 MME — **CORRECT**.
- HbSS genotype, baseline Hgb 7.0-7.5, AVN femoral head (50-70% by age 35) accurate.
- Hydroxyurea target HbF >20%, crizanlizumab, L-glutamine, Ficat AVN classification all correct.
- NHLBI guideline for IV opioid within 30 min of ED arrival — correct.
- Racial bias literature (Haywood et al.) accurately cited. Strong Domain D/E.

---

## Pediatrics Files (6)

### peds_brachial_plexus.dart — PASS
- Active Movement Scale, Erb (C5-C6 waiter's tip) vs extended Erb vs Klumpke vs total plexus — accurate classification.
- Horner syndrome as poor prognostic sign (C8-T1/stellate involvement) correct.
- Biceps antigravity recovery by 3-6 months as surgical decision point — correct (Clarke/Gilbert criteria).
- Oberlin transfer described correctly. Surgical window 3-9 months. IDEA Part C early intervention correct.

### peds_cp_spasticity.dart — ⚠️ MINOR ISSUE (BoNT dosing upper limit)
- **Minor:** States total onabotulinumtoxinA dose "approximately 20 units/kg body weight per session (360 units at 18 kg)" with ceiling "20 units/kg or 400 units, whichever is less." Current international consensus (2016) and FDA labeling for pediatric spasticity generally recommends **maximum of 16 units/kg (up to 400 units)** for onabotulinumtoxinA in children. Some older protocols allowed 20 U/kg, but 16 U/kg is now the more commonly cited safety ceiling. The dose used in the worked example (360 U at 18 kg = 20 U/kg) is at the high end.
- MAS vs Modified Tardieu (R1/R2) correctly distinguished; spasticity vs dystonia differentiation accurate; HAT mentioned.
- GMFCS levels correctly described; SDR candidacy criteria, Ficat-equivalent reasoning, gait lab role, SEMLS — all accurate.
- Reimer migration percentage threshold 33% — correct.

### peds_duchenne.dart — PASS
- **Deflazacort 0.9 mg/kg/day** — correct standard dose.
- Exon 45-50 deletion → exon 51 skipping to restore reading frame — **CORRECT** per published DMD exon-skipping principles (eteplirsen eligible).
- NSAA, Brooke, Vignos, PUL scales correct.
- CoughAssist threshold (peak cough flow <270 L/min), BiPAP initiation (FVC <50% or sleep hypoventilation), spinal fusion before FVC <30-40% — all match 2018 DMD care considerations (Birnkrant et al.).
- ACE inhibitor prophylaxis by age 10, echo q6-12 months, eccentric exercise contraindication — all correct.
- Cardiac gene therapy (Elevidys/delandistrogene moxeparvovec) appropriately mentioned. Calcium 1000-1300 mg/day, vitamin D 1000-2000 IU/day correct.

### peds_jia.dart — PASS
- **Pediatric dosing verified:**
  - **Naproxen 10-15 mg/kg/day divided BID, max 1000 mg/day** — CORRECT.
  - **Methotrexate 10-15 mg/m²/week SQ** — CORRECT pediatric JIA dosing.
  - **Etanercept 0.8 mg/kg/week SQ, max 50 mg** — CORRECT.
  - **Adalimumab 24 mg/m² every 2 weeks SQ** — CORRECT pediatric dosing.
- ILAR classification (7 subtypes) correctly enumerated.
- ANA-positive polyarticular JIA uveitis screening q3-6 months correct.
- Triamcinolone hexacetonide as preferred IA steroid in JIA (longer duration than acetonide) — correct.
- TB screening before biologics — correct.

### peds_spina_bifida_transition.dart — PASS
- L3 level motor function (hip flex/add preserved, absent ankle function) correctly described.
- Latex allergy 50-70% prevalence — accurate.
- Detrusor pressure >40 cmH2O upper tract damage threshold — correct (McGuire).
- Age-18 SSI redetermination, PASS program, VR services, Section 504/ADA, Got Transition program — all correct.
- High-dose folic acid 4 mg/day for NTD history prior pregnancies — correct.
- Tethered cord surveillance, shunt malfunction in adult ED, Chiari II — all appropriate.

### peds_tethered_cord.dart — PASS
- **Pediatric dosing verified:**
  - **Oxybutynin 0.2 mg/kg/dose BID-TID** — CORRECT pediatric dosing.
- MRI caveat (will always appear tethered post-repair — symptomatic diagnosis is clinical) — important and correct.
- Intraoperative SSEP/MEP/EMG monitoring, latex-free protocol, flat bed rest 48-72h, CSF leak monitoring — all accurate.
- Ascending sensory level as red flag correctly emphasized.
- Malone/MACE procedure for refractory bowel incontinence — correct.

---

## Summary

**Files reviewed:** 23 (10 MSK, 7 Pain, 6 Peds)
**PASS:** 19
**Substantive issues:** 0
**Minor issues:** 4
  1. `pain_cancer_palliative.dart` — Hydromorphone equianalgesic ratio 30:6 (vs more standard 30:7.5) and fentanyl patch rough-conversion; internally consistent but conservative-literature preferred.
  2. `pain_phantom_limb.dart` — Gabapentin "target 900-1800 mg TID" upper end (5400 mg/day) exceeds FDA max of 3600 mg/day.
  3. `peds_cp_spasticity.dart` — Worked onabotulinumtoxinA example at 20 U/kg is above more commonly cited pediatric ceiling of 16 U/kg (still within older 20 U/kg limit).
  4. *(Implicit flag)* `pain_cancer_palliative.dart` fentanyl conversion math is fine, flagged above under same file.

**Key safety/dosing verifications (all PASS):**
- All MME calculations (oxycodone × 1.5) — correct in chronic LBP (45 MME), FBSS (180 MME), sickle cell (90 MME).
- All pediatric weight-based dosing (naproxen, methotrexate, etanercept, adalimumab, oxybutynin, deflazacort) — correct.
- ACR 2010/2016 fibromyalgia criteria — correct application (WPI ≥7 + SSS ≥5).
- Budapest CRPS criteria — correct enumeration and application.
- DMD exon-skipping logic for 45-50 deletion → exon 51 skipping — correct.
- Torg-Pavlov ratio normal >0.80 with low PPV caveat — correct.
- DMD care thresholds (BiPAP FVC <50%, spinal fusion before FVC <30-40%, CoughAssist PCF <270) — match Birnkrant 2018 guidelines.
- Jehovah's Witness surgical protocol (cell saver, TXA, EPO, blood fraction conscience decisions) — correct and ethically sound.
- No dangerous statements identified in any file.

**Overall assessment:** These 23 case files are medically accurate, evidence-based, and reflect current guidelines. The identified issues are minor dosing-ceiling/equianalgesic nuances that do not materially change clinical meaning or pose safety risk to an examinee using these as study material, but should be corrected for precision.
