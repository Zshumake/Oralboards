# Medical Accuracy Review: MSK/Sports, Pain, and Pediatric Cases

Reviewer: Board-certified PM&R physician (AI review)
Date: 2026-03-27
Files reviewed: 10 MSK, 7 Pain, 6 Pediatric (23 total)

---

## MSK / SPORTS MEDICINE CASES

### msk_acl_rehab.dart
**PASS**
- ACL reconstruction rehabilitation timeline is accurate.
- BTB autograft ligamentization biology is correctly described.
- Return-to-sport criteria (LSI >90%, hop tests, ACL-RSI >56) are evidence-based and current.
- Meniscal repair weight-bearing restrictions are appropriate.
- Female athlete triad/RED-S screening is correctly included.
- Re-injury risk statistics (15-25% second ACL injury) are accurate.

### msk_cervical_neurapraxia.dart
**PASS**
- Torg-Pavlov ratio definition and limitations (high sensitivity, low PPV ~12%) are correct.
- Distinction between CCN (bilateral, spinal cord) and stingers (unilateral, brachial plexus) is accurate.
- 56% recurrence rate for CCN with return to contact sports (Torg et al.) is correctly cited.
- Absolute contraindications to return to play are appropriately listed.
- Vitals and physical exam findings are clinically realistic for a 19-year-old D1 athlete.

### msk_cervical_radiculopathy.dart
**ISSUES FOUND**
1. **Opioid conversion calculation error (Domain C, chronic LBP section reference in the opioid discussion)**: The case states oxycodone 10 mg TID = "67.5 MME/day." Actually, oxycodone 10 mg TID = 30 mg/day oxycodone. The conversion factor for oxycodone to MME is 1.5, so 30 x 1.5 = **45 MME/day**, not 67.5. NOTE: This error is actually in pain_chronic_low_back.dart, not this file. This cervical radiculopathy file itself is accurate.

**PASS** (for this file specifically)
- C6 radiculopathy localization table (motor, sensory, reflex) is accurate.
- Spurling test specificity (93%) and sensitivity (30-50%) are correctly cited.
- EMG timing (fibrillation potentials at 2-3 weeks) is accurate.
- Normal sensory NCS in radiculopathy (lesion proximal to DRG) is correctly explained.
- Gabapentin titration schedule and dosing is appropriate.
- Cervical transforaminal ESI with dexamethasone (non-particulate) is correctly recommended.

### msk_crps.dart
**PASS**
- Budapest criteria (2010 IASP revision) are correctly applied with all four criteria enumerated.
- The requirement for symptoms in 3/4 categories and signs in 2/4 categories is accurate.
- Three-phase bone scan sensitivity (50-75%) and specificity (80-90%) are correctly stated.
- Graded motor imagery 3-stage program is accurately described.
- CRPS Type I vs Type II distinction is correct.
- Stellate ganglion block location (C6-7) is accurate.
- SCS/DRG stimulation indications and KEMLER trial reference are appropriate.

### msk_frozen_shoulder.dart
**ISSUES FOUND**
1. **Capsular pattern description**: The file states the capsular pattern is "External rotation most limited, then abduction, then flexion, then internal rotation." The classic Cyriax capsular pattern for the glenohumeral joint is external rotation > abduction > internal rotation (with flexion variably affected). The ordering of "flexion, then internal rotation" is debatable. Some sources place internal rotation as more limited than flexion, others the reverse. This is a minor point of contention among authorities rather than a clear error, but the traditional Cyriax pattern lists ER > Abd > IR.
   - **Content**: "Capsular pattern present: External rotation most limited, then abduction, then flexion, then internal rotation."
   - **Correction**: Consider revising to "External rotation most limited, followed by abduction and internal rotation (classic capsular pattern)" or note that the relative limitation of flexion vs. internal rotation varies.

Otherwise clinically accurate:
- Diabetes prevalence of adhesive capsulitis (10-36%) is correct.
- Stages (Reeves classification) are accurately described.
- Treatment approach including hydrodilatation is appropriate.
- HbA1c impact on outcomes is correctly discussed.

### msk_lateral_epicondylitis.dart
**PASS**
- Histopathology as angiofibroblastic tendinosis (not tendinitis) is correctly noted.
- Corticosteroid injection long-term outcomes worse than placebo is accurately stated per current evidence.
- PRP evidence (Mishra 2014, Gosens 2011 RCTs) is correctly cited.
- Tyler Twist FlexBar protocol (91% improvement) is accurate.
- Radial tunnel syndrome coexistence rate (~5%) is correct.
- DASH score interpretation (>50 = severe) is appropriate.
- Nirschl procedure description is accurate.

### msk_myofascial_pain.dart
**PASS**
- Trigger point diagnostic features (taut band, TrP, referred pain, local twitch response, restricted ROM) are correct.
- Active vs latent trigger point distinction is accurate.
- Differentiation tables (MPS vs fibromyalgia, MPS vs cervical radiculopathy) are accurate.
- Upper trapezius referred pain pattern ("question mark" to temporal/retroorbital region) is correct.
- Trigger point injection technique (25-gauge, fast-in fan-out) is standard.
- Biopsychosocial model application is appropriate.

### msk_plantar_fasciitis.dart
**PASS**
- Biomechanical force calculation (2-3x body weight during walking) is correct.
- Calcaneal spur prevalence in asymptomatic population (15-25%) is accurate.
- Windlass test description is correct.
- Gastrocnemius tightness assessment (dorsiflexion with knee extended vs. flexed) is accurately described.
- Normal dorsiflexion >10 degrees is correct.
- ESWT NNT ~4 for chronic plantar fasciitis is reasonable per literature.
- Baxter neuropathy as a differential is appropriately included.

### msk_rotator_cuff.dart
**PASS**
- Tear size classification (small <1cm, medium 1-3cm, large 3-5cm, massive >5cm) is standard.
- Goutallier classification (grades 0-4) is accurately described.
- Post-surgical rehabilitation phases and timelines are appropriate.
- PROM restrictions after repair (forward flexion to 120, ER to 30 in phase 1) are standard protocol.
- External rotation lag sign interpretation is correct.
- Workers' compensation documentation requirements are accurately described.

### msk_spinal_stenosis.dart
**ISSUES FOUND**
1. **MRI stenosis grading**: The file states "moderate stenosis 10-12 mm, severe <10 mm" for thecal sac AP diameter, then says the patient's diameter is "<10 mm at both levels" and describes this as "moderate-to-severe central canal stenosis." The grading actually varies by source. The commonly cited Schizas classification uses morphologic criteria rather than AP diameter alone. However, the numerical cutoffs used here (moderate 10-12mm, severe <10mm) are within the range reported in various references, so this is acceptable if not perfectly standardized. Minor inconsistency: the MRI is read as "moderate-to-severe" but the measurements show <10mm which by the file's own criteria would be "severe."
   - **Content**: "Thecal sac AP diameter <10 mm at both levels (moderate stenosis 10-12 mm, severe <10 mm)" alongside the MRI description of "moderate-to-severe central canal stenosis."
   - **Correction**: For internal consistency, if AP diameter is <10mm, the description should say "severe central canal stenosis" per the file's own classification, or the initial MRI description should be updated to match.

Otherwise accurate:
- Neurogenic vs vascular claudication differentiation is excellent and correct.
- Stoop test description is accurate and clinically useful.
- Shopping cart sign is correctly described.
- ABI >0.9 as normal is correct.
- SPORT trial reference and outcomes are accurately summarized.
- Flexion-based PT approach (Williams exercises) vs extension-based (McKenzie) distinction is correct.
- Cell saver discussion for Jehovah's Witness patient is medically and ethically appropriate.

---

## PAIN CASES

### pain_cancer_palliative.dart
**ISSUES FOUND**
1. **Fentanyl patch conversion**: The file states "oral morphine 195 mg/day divided by 2 = approximately 100 mcg/hr patch." The standard conversion is oral morphine 60 mg/day = fentanyl 25 mcg/hr. So 195 mg/day oral morphine / 60 x 25 = ~81 mcg/hr, which the file then rounds to "approximately 100 mcg/hr." The division by 2 shortcut the file uses (195/2 = 97.5, rounded to 100) is actually a commonly used rough clinical shorthand (oral morphine in mg/day divided by 2 = approximate fentanyl in mcg/hr), which works reasonably at moderate doses. This is acceptable as a clinical approximation, though the precise calculation yields ~81 mcg/hr. After the 25% reduction, the file arrives at 75 mcg/hr, which is actually close to what you'd get from the precise calculation (81 x 0.75 = ~61 mcg/hr would be the precise reduced dose vs. 75 mcg/hr). The "divide by 2" method slightly overestimates, but is a recognized clinical shortcut.
   - **Content**: "oral morphine 195 mg/day divided by 2 = approximately 100 mcg/hr patch. Apply 25% reduction = 75 mcg/hr."
   - **Suggested clarification**: Note that the "divide by 2" is an approximation. The precise equianalgesic conversion would yield ~81 mcg/hr before reduction (~61 mcg/hr after 25% reduction for cross-tolerance). In practice, 75 mcg/hr is a reasonable and safe starting dose after rotation. Consider noting this is an approximation.

2. **Hydromorphone equianalgesic ratio**: The file states "oral morphine 30 mg = oral hydromorphone 6 mg" giving a ratio of 5:1. The commonly cited equianalgesic ratio is oral morphine 30 mg = oral hydromorphone 4 mg (ratio 7.5:1 in many references) to 6 mg (ratio 5:1 in some older tables). The 5:1 ratio is used in some clinical references. This varies by source, and equianalgesic tables are inherently imprecise, but the more commonly used ratio is approximately 4:1 to 5:1. The file's 5:1 ratio is within accepted range.

Otherwise excellent:
- WHO analgesic ladder with modern Step 4 addition is accurate.
- ECOG and Karnofsky scales are correctly applied.
- Celiac plexus neurolysis indications, efficacy (70-90%), and complications are accurately described.
- Palliative rehabilitation principles and goal-setting framework are appropriate.
- Hospice vs palliative care distinction is accurately described.

### pain_chronic_low_back.dart
**ISSUES FOUND**
1. **Opioid MME calculation error**: The file states "oxycodone 10 mg TID = 45 mg/day oxycodone = 67.5 MME/day." Oxycodone 10 mg TID = 30 mg/day (not 45 mg). Using the standard conversion factor of 1.5, this equals 45 MME/day (not 67.5). Later the file says "His current dose is 90 MME/day" which is also incorrect based on the stated regimen.
   - **Content**: "oxycodone 10 mg TID = 45 mg/day oxycodone = 67.5 MME/day" and later "His current dose is 90 MME/day"
   - **Correction**: Oxycodone 10 mg TID = 30 mg/day oxycodone = 45 MME/day. The text should be corrected throughout. If the intent was for the patient to be on 90 MME, the dose should be changed to oxycodone 20 mg TID (= 60 mg/day = 90 MME) or oxycodone 10 mg QID with an extra dose (matching the "occasionally taking an extra dose" narrative).

Otherwise accurate:
- Central sensitization description is correct.
- Brinjikji et al. MRI findings in asymptomatic individuals reference is accurate.
- Nociplastic pain terminology (IASP 2017) is correctly applied.
- Yellow flags assessment and screening tools are appropriate.
- Opioid taper strategy (10% every 1-2 weeks) is evidence-based.
- IPRP program description is accurate.
- AMA Guides 6th Edition reference for impairment rating is correct.

### pain_failed_back.dart
**PASS**
- FBSS diagnostic framework (pseudoarthrosis, adjacent segment disease, epidural fibrosis, arachnoiditis) is comprehensive and accurate.
- Pseudoarthrosis incidence (5-35%) is correct.
- Adjacent segment disease rate (30% within 10 years) is accurate.
- MRI with gadolinium to differentiate recurrent disc from fibrosis is correct.
- OIH vs tolerance differentiation is accurately described.
- NMDA receptor mechanism for OIH is correct.
- Opioid-benzodiazepine risk correctly flagged.
- SCS indications and PROCESS trial reference are accurate.
- DRG stimulation and high-frequency stimulation options are current.
- SSDI 5-step evaluation process is correctly described.
- Listing 1.04 criteria are accurately referenced.

### pain_fibromyalgia.dart
**PASS**
- ACR 2010/2016 criteria (WPI >= 7 AND SSS >= 5) are correctly applied.
- WPI 14/19 and SSS 11/12 scores are realistic.
- Differential diagnosis workup (TSH, ANA, ESR, CRP, vitamin D, etc.) is appropriate and complete.
- Pathophysiology (central sensitization, substance P elevation 3x in CSF, small fiber neuropathy in ~40-50%) is accurately described.
- Alpha-delta sleep intrusion is correctly mentioned.
- FDA-approved medications (duloxetine, pregabalin, milnacipran) are accurately listed with appropriate dosing.
- Strong recommendation against opioids and corticosteroids in fibromyalgia is correct.
- Exercise prescription (start low, go slow, aquatic therapy 33-34C) is evidence-based.
- SSA Ruling 12-2p acknowledging fibromyalgia is correctly cited.

### pain_pediatric_fnd.dart
**PASS**
- DSM-5 criteria for FND/Conversion Disorder are correctly stated.
- Positive clinical signs are accurately described:
  - Hoover sign (sensitivity 63%, specificity 100%) is correctly cited.
  - Tremor entrainment is correctly explained.
  - Midline splitting is correctly identified as inconsistent with organic pathology.
  - Drift without pronation is correctly described.
- "Rule-in" vs "rule-out" diagnostic framework is accurately and importantly stated.
- Pediatric FND prognosis (60-80% significant improvement within 12 months) is accurate.
- Graded motor retraining and distraction-based PT techniques are appropriate.
- School reintegration as therapeutic intervention is evidence-based.
- 504 plan vs IEP distinction is correctly explained.

### pain_phantom_limb.dart
**PASS**
- PLP prevalence (50-80%) is correct.
- Peripheral, spinal, and cortical mechanisms are all accurately described.
- Ramachandran cortical reorganization theory and Melzack neuromatrix theory are correctly cited.
- Neuroma pathophysiology (sodium channel upregulation Nav1.3, Nav1.8) is accurate.
- Tinel sign at fibular transection site is clinically realistic.
- Mirror therapy protocol (15-20 minutes daily, minimum 4 weeks) is evidence-based.
- Graded motor imagery 3-stage approach is correctly described.
- TMR (Targeted Muscle Reinnervation) is accurately described as emerging evidence for PLP treatment/prevention.
- K-level classification system is accurately described (K0-K4).
- Medicare Part B coverage (80% of approved device) is correct.
- Peak cough flow threshold of 270 L/min is NOT relevant here (that's for DMD/neuromuscular) - but this is not stated in this file, so no error.

### pain_sickle_cell.dart
**PASS**
- SCD pain pathophysiology (nociceptive, neuropathic, inflammatory, central sensitization) is accurately and comprehensively described.
- AVN prevalence in HbSS (50-70% by age 35) is correct.
- Ficat classification of AVN (Stages I-IV) is accurate.
- Baseline hemoglobin 7.0-7.5 g/dL is realistic for HbSS.
- Opioid dose calculation: oxycodone 15 mg QID = 60 mg/day = 90 MME/day is correct (60 x 1.5 = 90 MME).
- Crizanlizumab (anti-P-selectin), L-glutamine (Endari) as FDA-approved SCD therapies are current.
- Haywood et al. study (69% of SCD patients reported drug-seeking labeling) is correctly cited.
- NHLBI guideline for opioids within 30 minutes of ED arrival is accurate.
- Racial bias in pain management discussion is evidence-based and appropriate.

---

## PEDIATRIC CASES

### peds_brachial_plexus.dart
**PASS**
- Classification (Erb C5-C6, Extended Erb C5-C7, Klumpke C8-T1, Total C5-T1) is accurate.
- Erb palsy prevalence (~70-80% of NBPP) is correct.
- Prognosis for Erb palsy (70-90% recover if recovery begins by 2-3 months) is accurate.
- Active Movement Scale scoring system is correctly applied.
- "Waiter's tip" posture description is classic and accurate.
- Cookie test (Tassin test) at 3 months is correctly described.
- Surgical window (3-9 months) and motor endplate degeneration timeline (12-18 months) are accurate.
- Oberlin transfer description is correct.
- IDEA Part C early intervention services are correctly referenced.
- IFSP development within 45 days is accurately stated.

### peds_cp_spasticity.dart
**PASS**
- GMFCS Level III classification is accurately applied.
- Modified Ashworth Scale and Modified Tardieu Scale (R1, R2, dynamic component) are correctly described.
- Spasticity vs dystonia differentiation is thorough and accurate.
- SDR candidacy criteria are correctly listed.
- BoNT-A dosing (maximum 16-20 units/kg per session for onabotulinumtoxinA) is within accepted guidelines.
- Serial casting protocol (10-14 days post-BoNT, weekly changes for 4-6 weeks) is standard.
- GMFCS III hip displacement risk (40%) is accurate.
- SEMLS concept is correctly described.
- Intrathecal baclofen risks (catheter malfunction, withdrawal as medical emergency) are correctly noted.
- Hip surveillance (migration percentage >33%) is standard per CPUP protocols.
- "Birthday syndrome" (growth-related functional decline) is correctly referenced.

### peds_duchenne.dart
**ISSUES FOUND**
1. **Exon-skipping therapy eligibility**: The file states "This patient has an exon 45-50 deletion — check eligibility for exon-skipping agents (exon 51 skipping would be needed for a 45-50 deletion to restore reading frame)." For a deletion of exons 45-50, skipping exon 51 would restore the reading frame (creating an in-frame deletion of exons 45-51), which is correct. The patient would be eligible for eteplirsen (exon 51 skipping). This is accurately stated.

Actually, on re-review, this is correct. No issue.

**PASS**
- DMD disease trajectory (early ambulatory, late ambulatory, early non-ambulatory, late non-ambulatory) is accurate.
- Deflazacort dosing (0.9 mg/kg/day) is standard.
- Cardiac monitoring: LVEF 58% as lower-normal, prophylactic ACE inhibitor by age 10, are per current care guidelines.
- FVC thresholds: <80% for more frequent monitoring, <50% for nocturnal BiPAP, are accurate.
- Peak cough flow <270 L/min threshold for CoughAssist is correct.
- CoughAssist settings (+40/-40 cmH2O) are standard.
- Eccentric exercise contraindicated in DMD is correctly stated.
- Scoliosis bracing not effective in neuromuscular scoliosis is correct.
- Spinal fusion timing (Cobb >20-30 degrees, before FVC <30-40%) is per guidelines.
- Power wheelchair specifications (tilt-in-space, recline, seat elevator) are comprehensive and appropriate.
- Exon-skipping agents and gene therapy (delandistrogene moxeparvovec/Elevidys) are current.

### peds_jia.dart
**PASS**
- ILAR classification of JIA subtypes is accurate and complete.
- Oligoarticular as most common (~50%) is correct.
- ANA-positive uveitis risk and slit-lamp screening requirement are accurately emphasized.
- Lab workup (including LDH and peripheral smear to rule out leukemia) is appropriate.
- Methotrexate dosing (10-15 mg/m2/week) is standard for polyarticular JIA.
- TNF inhibitor dosing (etanercept 0.8 mg/kg/week, adalimumab 24 mg/m2 q2 weeks) is correct.
- Triamcinolone hexacetonide (preferred over acetonide in JIA for longer duration) is accurately noted.
- Naproxen dosing (10-15 mg/kg/day divided BID, max 1000 mg/day) is correct.
- Uveitis screening frequency for ANA-positive patients is appropriate.
- Methotrexate teratogenicity and pre-conception counseling are correctly addressed.
- Got Transition program reference is appropriate.

### peds_spina_bifida_transition.dart
**ISSUES FOUND**
1. **Latex allergy prevalence**: The file states latex allergy is "Present in up to 50-70% of spina bifida patients." More current estimates suggest latex sensitization (positive IgE) in approximately 30-65% and clinical latex allergy in approximately 20-40%. The 50-70% figure likely represents sensitization rather than clinical allergy, though some older sources do cite these higher numbers. Later in the file, the tethered cord case also discusses latex and says "up to 50-70%." This is a common citation in older literature but may overestimate true clinical allergy rates.
   - **Content**: "Latex allergy: Present in up to 50-70% of spina bifida patients"
   - **Suggested clarification**: Consider specifying "latex sensitization in up to 50-70%; clinically significant allergy in 20-40%" to be more precise, or keeping "up to 50-70%" with a note that this includes sensitization. Given that clinical practice is to treat ALL myelomeningocele patients as latex-sensitive regardless of testing, this does not change management.

Otherwise highly accurate:
- Tethered cord risk (20-50% of repaired myelomeningocele) is correct.
- Detrusor pressure threshold >40 cmH2O for upper tract risk is correct.
- L3 motor function (hip flexion/adduction preserved, knee extension partial) is accurately described.
- VP shunt malfunction presentation in adults is correctly described.
- Chiari II malformation being universal in myelomeningocele is correct.
- IDEA Part C, Section 504, SSI/SSDI age-18 redetermination are accurately described.
- Sexual/reproductive health counseling (folic acid 4 mg/day for neural tube defect history) is correct.
- Vocational rehabilitation services are accurately described.
- Medical passport concept is excellent practice.

### peds_tethered_cord.dart
**PASS**
- Tethered cord incidence in repaired myelomeningocele (20-50%) is correct.
- Clinical diagnosis emphasized over MRI alone (MRI always looks tethered after repair) is an important and accurate point.
- Ascending sensory level as a red flag is correctly emphasized.
- Cavovarus deformity progression as a sign of tethered cord is accurate.
- Differential diagnosis (shunt malfunction mimicking tethered cord) is correctly included.
- Latex-free surgical protocol is correctly mandated.
- Intraoperative monitoring (SSEP, MEP, EMG) is standard for untethering.
- Post-operative flat bed rest for 48-72 hours is standard.
- Oxybutynin dosing (0.2 mg/kg/dose BID-TID) is correct for pediatric neurogenic bladder.
- Detrusor leak point pressure <40 cmH2O for renal protection is accurate.
- MACE procedure for bowel management is appropriately mentioned.
- School accommodation discussion (IEP under "Orthopedic Impairment" or "Other Health Impairment") is correct.

---

## SUMMARY

| Category | Files | PASS | Issues Found |
|----------|-------|------|-------------|
| MSK/Sports | 10 | 8 | 2 (frozen shoulder, spinal stenosis - minor) |
| Pain | 7 | 5 | 2 (cancer palliative - minor, chronic LBP - moderate) |
| Pediatric | 6 | 5 | 1 (spina bifida transition - minor) |
| **TOTAL** | **23** | **18** | **5** |

### Issues Requiring Correction (by priority):

**MODERATE PRIORITY:**
1. **pain_chronic_low_back.dart** - MME calculation error: oxycodone 10 mg TID = 30 mg/day = 45 MME (not 67.5 MME or 90 MME as stated). This is a factual math error that a board examiner would catch.

**LOW PRIORITY (minor clarifications):**
2. **msk_spinal_stenosis.dart** - Internal inconsistency: MRI described as "moderate-to-severe" but measurements show <10mm which by the file's own criteria is "severe."
3. **pain_cancer_palliative.dart** - Fentanyl conversion "divide by 2" shortcut slightly overestimates; consider noting this is an approximation.
4. **msk_frozen_shoulder.dart** - Capsular pattern ordering is debatable; traditional Cyriax pattern places IR before flexion.
5. **peds_spina_bifida_transition.dart** - Latex allergy prevalence (50-70%) may overestimate clinical allergy vs. sensitization; does not change management.

### Overall Assessment:
The case files are of exceptionally high quality. The medical content is thorough, evidence-based, and appropriate for PM&R oral board examination preparation. The one moderate-priority error (MME calculation) should be corrected as it involves a straightforward arithmetic mistake. The remaining issues are minor clarifications or debatable points where reasonable clinicians might differ.
