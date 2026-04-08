# Audit Round 2 — Cancer, Cardiopulm, Burn, Special, Polytrauma

**Scope:** 26 case files reviewed for medical accuracy (dosing, staging, formulas, ethics, Domain E care).

---

## CANCER CASES

### cancer_cipn.dart — PASS
- CTCAE grading accurate (Grade 2 with concerning features). EDX findings (sensory axonal, reduced SNAPs, normal CMAPs) correct for taxane CIPN.
- Duloxetine 60 mg (with 30 mg step-up) is Level 1 evidence per ASCO — correct.
- 30-40% persistent CIPN at 6 months is accurate.
- Differentials and workup appropriate.

### cancer_head_neck.dart — PASS (minor)
- Staging T3N2aM0 = Stage IVA — correct per AJCC 8th edition for larynx.
- Post-laryngectomy anatomy (closed neopharynx, no aspiration risk) correctly described.
- Pharyngocutaneous fistula as feared early complication — accurate.
- TEP as gold standard alaryngeal speech with ~80-90% intelligibility — correct.
- PENTOCLO protocol (pentoxifylline 400 mg TID + vitamin E) — accurate regimen.
- Spinal accessory nerve palsy management (Eden-Lange transfer) — appropriate.
- **Minor:** The case cites duloxetine avoidance "given hepatic concerns given alcohol history" — this is reasonable caution though not an absolute contraindication; acceptable clinical judgment framing.
- Head/neck cancer suicide risk correctly flagged.

### cancer_lymphedema.dart — PASS
- ISL staging accurate. Stage II Late description matches presentation.
- BIS/L-Dex interpretation correct (>10 subclinical, >20 established). PREVENT trial reference accurate.
- CDT phases correctly described (short-stretch bandages, MLD starting proximally).
- Compression garment pressures (30-40 mmHg Class II, 40-50 Class III) accurate.
- Lymphedema Treatment Act (2022, effective 2024) — correct.
- ACOSOG Z0011 cited incorrectly for PAL trial context — ACOSOG Z0011 is a sentinel node study, not resistance training. **Minor error.** The PAL trial (Physical Activity and Lymphedema, Schmitz) is the correct citation for resistance training safety.

**ISSUE (minor):** ACOSOG Z0011 misattribution. PAL trial alone supports the claim.

### cancer_prehab_fatigue.dart — PASS
- CRF differential comprehensive and accurate.
- Iron deficiency anemia workup appropriate. IV ferric carboxymaltose 750 mg x2 — correct dosing.
- Prehabilitation evidence (30-50% reduction in complications, shorter LOS) — consistent with literature.
- Vitamin D 50,000 IU weekly x8 — standard repletion.
- Immunonutrition (arginine/omega-3) evidence for colorectal surgery — accurate.
- Domain E handling of existential distress outstanding.

### cancer_spinal_cord_compression.dart — PASS
- MESCC as oncologic emergency, whole-spine MRI within 24h — correct.
- Bilsky grading accurate.
- Tokuhashi scoring appropriately demonstrated.
- **Dexamethasone dosing:** 10 mg IV load then 4 mg Q6H — this is the "standard" dose regimen. Note: high-dose protocol (96-100 mg load) is historically described but current practice varies; the moderate-dose regimen cited is widely accepted and appropriate.
- Patchell trial (2005) — surgery + RT superior to RT alone — correct. Ambulation rates (84% vs 57%) accurate.
- ASIA D classification applied appropriately.
- Hospice vs rehab framework good.

---

## CARDIOPULM CASES

### cardiopulm_cardiac_rehab.dart — PASS (minor)
- AHA risk stratification correct. HF-ACTION trial cited accurately.
- GDMT review appropriate — correctly mentions ARNI, SGLT2i, MRA, ICD evaluation at 3 months on GDMT if EF≤35%.
- Karvonen HRR calculation shown correctly.
- Sternal precautions appropriate.
- **Minor:** "Metoprolol succinate 200 mg daily" cited as target dose — this is the MERIT-HF max dose, accurate. OK.
- Cardiac rehab event rate (~1/117,000 patient-hours) — consistent with literature.

### cardiopulm_copd_rehab.dart — PASS
- GOLD staging accurate. MRC dyspnea scale correctly used.
- Oxygen criteria per CMS — accurate (PaO2≤55 or SpO2≤88 at rest; or 56-59/89 with cor pulmonale/polycythemia).
- Pulmonary rehab Medicare 36 sessions (up to 72) — correct.
- Pharmacotherapy for cessation (varenicline, bupropion, combination NRT) — accurate dosing.
- FEV1 decline differential (60 mL/yr continued smoking vs 30 mL/yr quitters) — consistent with Lung Health Study.

### cardiopulm_post_covid.dart — PASS
- WHO post-COVID definition (Oct 2021) accurately cited.
- POTS criteria correctly applied (HR rise ≥30 in 10 min without OH).
- PEM as contraindication to traditional GET — **critical correct teaching** per current NICE and CDC guidance.
- Pacing/energy envelope approach appropriate.
- Fludrocortisone, midodrine, ivabradine dosing accurate.
- U09.9 ICD-10 code correct.

### cardiopulm_post_pe.dart — PASS
- CTEPH prevalence (2-4%) and workup accurate. V/Q scan sensitivity appropriately emphasized over CTA.
- CPET interpretation accurate (VE/VCO2 slope >36 suggestive of pulmonary vascular disease).
- Rivaroxaban + exercise considerations reasonable. NSAID interaction correctly flagged.
- Factor V Leiden inheritance correctly described.
- Rivaroxaban teratogenicity — actually **rivaroxaban is Category C; not definitively teratogenic but avoided in pregnancy due to placental crossing and bleeding risk**. The case states "rivaroxaban is teratogenic" which is an overstatement. **Minor issue.**

**ISSUE (minor):** Overstatement that "rivaroxaban is teratogenic." More accurately: avoided in pregnancy due to placental transfer and fetal bleeding risk; teratogenicity not definitively established.

### cardiopulm_transplant.dart — PASS
- Denervated heart physiology accurately described. Resting HR 90-110, blunted chronotropic response, catecholamine-mediated, prolonged recovery — all correct.
- Tacrolimus trough 10-15 ng/mL — correct for early post-transplant period.
- ACR grading (0R-3R) per ISHLT 2004 — correct.
- CAV surveillance (annual cath/IVUS) — correct.
- **UNOS status:** Case states patient was "Status 4" on waitlist as stable LVAD bridge-to-transplant. Under the **2018 6-tier UNOS heart status system**, stable LVAD BTT is appropriately **Status 4**. CORRECT for the updated system.
- Live vaccines contraindicated, Shingrix acceptable — correct.
- VO2 peak 60-70% of predicted in transplant — accurate literature value.

---

## BURN CASES

### burn_electrical.dart — PASS
- Electrical injury pathophysiology (Joule heating, electroporation, delayed vascular thrombosis) accurate.
- Compartment syndrome timing (within 6h) accurate.
- Rhabdomyolysis management appropriate.
- Nerve injury (axonotmesis, regeneration 1mm/day) correct.
- Tendon transfer indications (opponensplasty, anti-claw) appropriate.
- AMA Guides 6th Ed for impairment — correct.
- Cataract surveillance post-electrical injury — correct.
- Domain E suicide screening explicit — appropriate.

### burn_facial_psychosocial.dart — PASS
- Scar grading (Vancouver Scale components) accurate.
- Microstomia functional thresholds (35-40 mm) correct.
- Ectropion management progression appropriate; eyelid reconstruction as functional priority — correct.
- TFO (transparent face orthosis) at 25 mmHg, 23 hours/day — accurate.
- PTSD/suicide risk screening handled carefully.
- Crime Victims Compensation resource accurate.
- Domain E handling outstanding.

### burn_major_rehab.dart — ⚠️ ISSUE (substantive — flagged per audit criteria)
- Burn depth classification accurate.
- Anti-deformity positioning accurate (MCPs in 70-90° flexion, intrinsic-plus position).
- Escharotomy vs fasciotomy correctly differentiated.
- Pressure garments 25 mmHg 23h/day — correct.
- **⚠️ CURRERI FORMULA used for caloric needs calculation:** Case cites "25 kcal/kg/day + 40 kcal/%TBSA/day = ~3450 kcal/day." Math is correct (25×74 + 40×40 = 1850+1600 = 3450). **However, the audit specifically flagged Curreri as outdated**. Modern preference is **indirect calorimetry** as gold standard, or **Toronto formula** (adults) which accounts for time post-burn, minute ventilation, and actual vs ideal weight. Curreri tends to overestimate caloric needs (by 25-50%) and can contribute to overfeeding complications (hepatic steatosis, hyperglycemia, increased CO2 production).
- Protein 1.5-2.0 g/kg/day accurate.
- Parkland formula not discussed since patient is post-acute at 3 weeks — appropriate omission.

**ISSUE (substantive):** Curreri formula used without mention of preferred modern alternatives (indirect calorimetry, Toronto formula). For a teaching case intended for current PM&R board preparation, the updated standard should at minimum be acknowledged.

---

## POLYTRAUMA

### polytrauma_blast_injury.dart — PASS
- mTBI classification (LOC <30 min, GCS 13-15, PTA <24h) accurate.
- VA Polytrauma System of Care (PRC/PNS/PSCT/PPOC 4-tier) — correct.
- Amitriptyline 25 mg QHS for post-traumatic headache — appropriate.
- Prazosin for PTSD nightmares — correct.
- Blast-related vestibular injury appropriately mentioned.
- K-level anticipation (K4 for young active military) accurate.
- TSGLI amounts (~$100,000 for amputation) — consistent with current benefit structure.
- Suicide screening handled appropriately.

---

## SPECIAL CASES

### special_adaptive_sports.dart — PASS
- IWBF 1.0-4.5 classification system correct.
- L1 ASIA A → 1.0 classification reasonable.
- Rotator cuff prevalence in SCI (~70% on MRI) — accurate.
- Power-assist (SmartDrive) as shoulder preservation strategy — evidence-supported (PVA CPG on upper limb preservation).
- Pressure injury management during tournament — appropriate.
- Thermoregulation in T6+ not directly applicable at L1 — correctly framed.
- Parental counseling handled well.

### special_bilateral_tfa.dart — PASS
- Microprocessor knee indication for bilateral TFA — correct standard of care.
- Energy expenditure >200% for bilateral TFA — accurate.
- Wheelchair + prosthetic as not either/or — correct.
- Mirror therapy not applicable bilateral — correct, virtual/motor imagery alternative mentioned.
- PTSD/depression screening handled appropriately.
- Domain E on intimacy/relationships after amputation handled sensitively.

### special_capacity_determination.dart — PASS
- **Appelbaum four-component capacity model** accurately applied (Understanding, Appreciation, Reasoning, Expression of Choice).
- Correct legal distinction: capacity (clinical, physician) vs competence (legal, court).
- Severity-proportional capacity threshold correctly described.
- Depression as reversible cause of apparent capacity impairment — correct framing.
- ASIA C incomplete prognosis correctly emphasized.
- Ethics committee vs guardianship pathways accurately described.
- Domain E/suicide screen handled with care.
- AMA discharge protocol accurate (insurance does NOT automatically void).

### special_dysvascular_amputation.dart — PASS
- ABI interpretation correct. TcPO2 thresholds accurate (>40 good healing, <30 poor).
- Monckeberg sclerosis caveat for diabetics correctly noted.
- 5-year contralateral amputation rate 30-50% — accurate.
- IWGDF risk categorization correct.
- K-level assignment reasonable (K2 dysvascular).
- SACH/single-axis foot for K2 — appropriate prescription.
- Medicare Therapeutic Shoe Program details (1 pair + 3 inserts/year) — correct.
- Perioperative glucose target 140-180 — per current guidelines.

### special_ime.dart — PASS
- Waddell signs correctly described as behavioral, **not proof of malingering**. Excellent nuance.
- Malingering vs symptom magnification vs factitious — correct DSM-5 framing.
- FCE coefficient of variation >15% as effort indicator — accurate.
- MMI definition correct.
- AMA Guides 5th/6th Ed DRE categories appropriate.
- MME calculation: oxycodone 10 mg QID = 40 mg/day oxycodone × 1.5 conversion = **60 MME/day** — CORRECT.
- Ethical obligations of IME physician handled well (independence, no treating relationship).
- Domain E de-escalation appropriate.

### special_itb_pump.dart — PASS
- ITB trial protocol (50 mcg bolus, escalate to 75/100) — accurate.
- Pump starting dose = 2x effective trial dose/day — correct.
- ITB withdrawal as life-threatening emergency — correctly emphasized. Emergency management (high-dose oral baclofen, IV benzodiazepines, cyproheptadine, dantrolene) — correct.
- MAS and Penn Spasm Frequency Scale correctly distinguished.
- MRI conditional (1.5T) for SynchroMed II — correct.
- Flex dosing rationale to preserve functional tone — excellent teaching.
- Oral baclofen max of 80 mg/day cited as patient's current dose (correct, standard max is 80 mg).

### special_limb_length.dart — PASS
- Scanogram as gold standard accurate.
- Block test appropriate for functional LLD.
- Cobb angle threshold (>10°) for monitoring correct.
- Paley multiplier method / Anderson-Green charts — correct growth prediction methods.
- Ilizarov vs PRECICE nail comparison accurate.
- Distraction rate 1 mm/day — correct.
- Shoe lift approach (full correction for >2 cm with scoliosis) — standard.
- Parental conflict mediation handled well.

### special_medical_error.dart — PASS
- Never Event classification (NQF Serious Reportable Event, Joint Commission) correct.
- Just culture framework (human error vs at-risk vs reckless) accurately described.
- Michigan Model / CRICO data on disclosure reducing litigation — accurate.
- AMA Code of Medical Ethics Opinion 8.6 on disclosure — correct citation.
- Apology laws discussed accurately.
- PSO reporting (Patient Safety and Quality Improvement Act 2005) — correct.
- Domain E disclosure handled exemplarily; language to avoid list is excellent teaching.

### special_opioid_taper.dart — PASS
- OIH vs tolerance distinction accurate.
- **MME calculation verified:** Morphine ER 60 mg BID + IR 15 mg QID PRN. Morphine is the reference opioid (1:1). 120-180 mg morphine = 120-180 MME/day. CORRECT.
- Taper rate 5-10% every 2-4 weeks for long-term users — per CDC 2022 updated guidance (less aggressive than 2016 version).
- Naloxone co-prescription at ≥50 MME — matches CDC threshold.
- Buprenorphine X-waiver elimination (Jan 2023 Consolidated Appropriations Act) — CORRECT.
- Withdrawal symptom management (clonidine, loperamide, hydroxyzine) — standard.
- Duloxetine, gabapentin, topical agents as adjuvants — appropriate.
- Domain E crisis management: "pause, don't reverse" is excellent teaching point.

### special_oud_rehab.dart — PASS
- Buprenorphine pharmacology (partial mu agonist, ceiling effect, kappa antagonist) — correct.
- Dose splitting (8 mg BID) for analgesia vs once-daily for OUD — accurate clinical pearl.
- Tramadol contraindication on buprenorphine — correct.
- X-waiver elimination (Jan 2023) — correct.
- ADA/Section 504 protection for MOUD patients — accurate legal framework; DOJ settlements precedent correct.
- MOUD reduces mortality >50% — accurate.
- Hydromorphone/fentanyl for procedural pain overcoming buprenorphine — correct approach per current ASAM/APA guidance; **notably correct that buprenorphine should NOT be stopped pre-procedure** (outdated practice).
- Domain E staff education handled firmly and appropriately.

### special_post_suicide_rehab.dart — PASS
- C-SSRS as gold standard — correct.
- Beck Hopelessness Scale as strongest predictor — accurate.
- Fluoxetine black box warning for young adults <25 — correct (age 22 within range).
- Acetaminophen restriction given prior overdose — appropriate.
- NSSI vs suicidal behavior distinction — correct.
- Stanley-Brown Safety Planning Intervention — correct reference.
- DBT for BPD traits — evidence-based.
- Lethal means restriction counseling — correct.
- 72-hour post-discharge psych follow-up (highest risk period) — accurate.
- ~10% of traumatic SCI from self-harm — reasonable epidemiology.
- Domain E scenarios handled exemplarily — therapist response protocol excellent.

### special_transgender_care.dart — PASS
- Estrogen + SCI DVT synergistic risk — correctly emphasized.
- Recommendation to continue estrogen with enhanced prophylaxis (not stop) — consistent with WPATH guidance and trauma-informed care.
- **NOT stopping MOUD/hormones as a knee-jerk response** — correct approach.
- Section 1557 ACA protection — accurate.
- Organ inventory vs legal name vs chosen name documentation — appropriate.
- Catheterization dysphoria handling with alternatives (closed-system, suprapubic, Mitrofanoff) — thoughtful.
- Roommate scenario handled correctly (transgender patient not displaced).
- Domain E handled sensitively.

### special_wheelchair_seating.dart — PASS
- C6 ASIA A with tenodesis grasp preserved — correct.
- PVA/CSCM Upper Extremity Preservation CPG referenced appropriately.
- Semicircular propulsion pattern as preferred — correct evidence-based teaching.
- ROHO Quadtro Select for pressure redistribution — appropriate.
- Peak pressure goal <60 mmHg — standard.
- RESNA ATP certification requirement for CRT — correct CMS requirement.
- PDAC (replacing SADMERC) for HCPCS verification — accurate current terminology.
- Letter of medical necessity approach (prescribe by features not brand) — correct ethical and practical approach.

---

## SUMMARY

**Files reviewed:** 26
**PASS:** 23
**⚠️ Substantive issues:** 1
**⚠️ Minor issues:** 2

### Substantive
1. **burn_major_rehab.dart** — Uses Curreri formula for caloric needs calculation without acknowledging modern preference for indirect calorimetry (gold standard) or Toronto formula. Curreri tends to overestimate; current PM&R/burn teaching should reference the more accurate methods.

### Minor
1. **cancer_lymphedema.dart** — ACOSOG Z0011 cited alongside PAL trial for resistance training safety. ACOSOG Z0011 is a sentinel node dissection trial, not a lymphedema/exercise study. PAL trial alone is the correct citation.
2. **cardiopulm_post_pe.dart** — States "rivaroxaban is teratogenic" which overstates the evidence. Rivaroxaban is avoided in pregnancy due to placental transfer and fetal bleeding risk, but teratogenicity is not definitively established. Suggested rewording: "contraindicated in pregnancy due to fetal bleeding risk and inadequate safety data."

### Notable Strengths
- All Domain E (interpersonal/communication) scenarios handled with appropriate care, especially suicide screening, capacity determination, medical error disclosure, trauma-informed approaches.
- MME calculations verified accurate (IME case: 60 MME; opioid taper case: 120-180 MME).
- Cancer staging (TNM, AJCC 8th) accurate throughout.
- Heart transplant case correctly uses 2018 6-tier UNOS status system (Status 4 for stable LVAD BTT).
- X-waiver elimination (Jan 2023) correctly reflected in two separate cases.
- Capacity determination case uses correct Appelbaum 4-component model with appropriate legal/ethical distinctions.
- Medical error disclosure case exemplary — correctly teaches disclosure obligation regardless of clinical outcome.
- Post-COVID case correctly teaches PEM as contraindication to traditional GET (a frequently-missed modern pearl).
- Buprenorphine pharmacology and peri-procedural management accurate and up-to-date.
- No dangerous statements identified.
