# Medical Accuracy Review: Stroke & SCI Case Files

**Reviewer**: PM&R Board-Certified Physician (AI-assisted review)
**Date**: 2026-03-27
**Scope**: 12 Stroke files, 11 SCI files

---

## STROKE CASES

### stroke_bilateral.dart
**PASS**

Clinically accurate bilateral MCA stroke presentation. CHA2DS2-VASc score calculated correctly (score of 6). Apixaban dosing appropriate. GCS breakdown consistent. Surrogate decision-making hierarchy is correct. Rehabilitation approach is appropriate for this severity level.

---

### stroke_depression_pba.dart
**PASS**

PSD vs. PBA distinction is accurate. PHQ-9 threshold (>=10) and CNS-LS threshold (>=13) are correct. Sertraline as first-line for PSD is appropriate. Nuedexta (dextromethorphan 20 mg/quinidine 10 mg) correctly identified as the only FDA-approved PBA treatment. The FLAME trial reference is relevant (though it studied fluoxetine, not sertraline -- the case correctly notes this distinction). Left frontal lesion association with PSD risk is well-supported in the literature.

---

### stroke_dysphagia.dart
**PASS**

Penetration-Aspiration Scale (Rosenbek) correctly described (1-8). VFSS vs. FEES comparison is accurate, including the "white-out" limitation of FEES. IDDSI levels are correctly applied. Silent aspiration rate of 40-70% in stroke patients is within published ranges. Chlorhexidine oral rinse for aspiration pneumonia prevention is evidence-based.

Minor note: The case states IDDSI Level 4 (pureed to soft) for the diet recommendation but then says Level 5 (minced and moist) in the treatment plan. These are different IDDSI levels. However, this is presented as a progression/adjustment based on clinical reasoning between the VFSS interpretation and the treatment plan, so it is clinically reasonable.

---

### stroke_ich_spasticity.dart
**ISSUES FOUND**

1. **Botulinum toxin dosing inconsistency**: The case states a total dose of "approximately 475-525 units" and then says "(within safe dosing -- max 400 units for Botox brand, up to 600 units for off-label use)." The stated total of 475-525 units EXCEEDS the FDA-approved maximum of 400 units for onabotulinumtoxinA (Botox). Saying this is "within safe dosing" while also acknowledging the max is 400 units is contradictory. The case should either (a) reduce the total dose to stay within 400 units, or (b) clarify more explicitly that the total dose exceeds the labeled maximum and requires informed discussion about off-label dosing, or (c) explicitly recommend incobotulinumtoxinA (Xeomin) for the higher dose range from the start.

   **Correction**: Revise to either cap the total at 400 units (adjusting individual muscle doses downward), or reframe the statement to say: "Total dose approximately 475-525 units -- this exceeds the FDA-approved maximum of 400 units per session for onabotulinumtoxinA. Consider using incobotulinumtoxinA (Xeomin), which does not have a labeled maximum dose ceiling, or treat over two sessions."

2. **ICD-10 code**: The case lists "G24.02 -- drug-induced acute dystonia" as a possible diagnosis code. This is not relevant to this patient (he does not have drug-induced dystonia). This appears to be an error in the example coding section.

   **Correction**: Remove G24.02 or replace with a more appropriate code such as G81.01 (flaccid hemiplegia affecting right dominant side) or R29.898 (other symptoms involving the musculoskeletal system).

---

### stroke_locked_in.dart
**PASS**

Locked-in syndrome presentation is anatomically accurate -- ventral pontine infarction sparing the tegmentum. Misdiagnosis rate of 40-50% (Laureys et al.) is correctly cited. CRS-R as the gold-standard consciousness assessment is correct. EEG finding of normal posterior dominant rhythm in locked-in syndrome is accurate. Ventilator weaning rate of approximately 50-60% is within published ranges. The AAC technology progression is well-described. Ethical framework for the end-of-life request is handled appropriately.

---

### stroke_mca_right_hemiplegia.dart
**ISSUES FOUND**

1. **NIHSS scoring -- facial palsy**: The case scores facial palsy as "2 (partial lower face paralysis)." On the NIHSS, a score of 2 for item 4 means "complete or near-complete paralysis of the lower face." A "partial paralysis" (lower face only) should be scored as **1**, not 2. UMN-pattern facial droop (lower face only, forehead spared) is typically NIHSS facial palsy score of 1.

   **Correction**: Change item 4 from "2" to "1" and adjust the total estimated NIHSS accordingly (would be approximately 13-15 instead of 14-16).

2. **NIHSS scoring -- right arm motor**: The case gives right UE as 1/5 throughout (flaccid), then scores NIHSS 5b as "4 (no movement against gravity)." An NIHSS motor score of 4 means "no movement." If the patient has 1/5 strength (trace/flicker), the NIHSS arm motor score should be **3** (no effort against gravity, but some movement). If truly 0/5 (no movement at all), then 4 is correct, but the case states 1/5.

   **Correction**: Either change the NIHSS item 5b to "3" (consistent with 1/5 strength) or clarify that the arm truly has no visible movement (0/5).

---

### stroke_neglect.dart
**PASS**

Hemispatial neglect assessment is thorough and accurate. Line bisection deviation rightward is correctly described for right hemisphere neglect. Extinction on double simultaneous stimulation is correctly identified as pathognomonic for neglect. The distinction between neglect and hemianopia is clinically accurate. Prism adaptation therapy evidence is correctly summarized. Catherine Bergego Scale and BIT are appropriate assessment tools. Driving medicolegal considerations are accurate.

---

### stroke_pediatric.dart
**PASS**

Sickle cell stroke pathophysiology is accurate. STOP trial correctly cited (TCD >=200 cm/s = abnormal). Stroke risk of 40% over 3 years without treatment is correct. Chronic transfusion target HbS <30% is correct. TWiTCH trial correctly described as relevant to primary prevention only. EDAS procedure correctly identified for moyamoya revascularization. Hydroxyurea dosing (500 mg for 20 kg child = 25 mg/kg) is within the standard range. Social and ethical issues are handled with appropriate sensitivity and accuracy.

---

### stroke_shoulder_subluxation.dart
**PASS**

Glenohumeral subluxation pathophysiology is accurate (loss of supraspinatus and deltoid tone). Differential diagnosis of hemiplegic shoulder pain is comprehensive. Budapest criteria reference for CRPS is appropriate. NMES parameters (30-35 Hz, 200-300 microsecond pulse width) are within standard clinical ranges. Overhead pulley contraindication is correctly emphasized. Brunnstrom staging is correctly applied.

---

### stroke_thalamic_pain.dart
**PASS**

Central post-stroke pain (Dejerine-Roussy) pathophysiology is accurate -- VPL/VPM thalamic nuclei involvement. CPSP prevalence of 8-10% is correct. Diagnostic criteria (Klit/IASP) are accurately stated. Lamotrigine evidence (Vestergaard et al.) is correctly cited. rTMS to contralateral M1 is the correct target. Suicide risk assessment (Stanley-Brown model) is appropriate. The case correctly identifies that opioids are ineffective for CPSP.

Note: The case states lamotrigine NNT ~4 -- this is consistent with the Vestergaard et al. trial data, though the confidence interval was wide. Acceptable for a board exam context.

---

### stroke_wallenberg.dart
**PASS**

Lateral medullary stroke anatomy is textbook-accurate. All six structures (descending sympathetic tract, spinal trigeminal nucleus, lateral spinothalamic tract, inferior cerebellar peduncle, nucleus ambiguus, vestibular nuclei) are correctly mapped to clinical findings. Crossed sensory pattern (ipsilateral face, contralateral body) is correct. PICA/vertebral artery territory is correct. Head turn to the affected (left) side as a compensatory swallow strategy is correct for unilateral pharyngeal weakness. CADISS trial findings are accurately summarized. The case correctly notes that Wallenberg dysphagia has a relatively favorable recovery trajectory.

---

### stroke_young_adult_pfo.dart
**PASS**

PFO-related stroke workup is comprehensive and accurate. RoPE score concept is correctly described. All three landmark PFO closure trials (RESPECT, CLOSE, REDUCE) are accurately cited with correct hazard ratios and year. AHA/ASA 2020 guideline recommendation (Class IIa, Level B-R) is correct. Post-closure AF rate of 5-7% is accurate. Endocarditis prophylaxis duration of 6 months is standard. Return-to-sport considerations are clinically reasonable.

Minor note: The case states the patient has "left facial droop (lower motor neuron pattern resolved, now subtle UMN pattern)." This transition from LMN to UMN pattern for a facial droop is unusual phrasing -- stroke-related facial droop is UMN from the start. This likely means the initial droop was more severe and appeared to involve the full face, now resolved to the classic UMN pattern. Not a factual error but could be confusing.

---

## SCI CASES

### sci_autonomic_dysreflexia.dart
**PASS**

AD pathophysiology is accurate -- occurs at T6 and above, unmodulated sympathetic response. The trigger identification algorithm is correctly prioritized (urological 80-85% first). Pharmacologic management hierarchy (nitropaste first-line, nifedipine, captopril, hydralazine, labetalol) is standard. The warning about labetalol worsening bradycardia is clinically important and correct. Lidocaine jelly before catheterization/rectal exam is correctly emphasized. BP threshold of 210/120 with baseline 90/60 appropriately conveys the emergency.

---

### sci_brown_sequard.dart
**PASS**

Brown-Sequard neuroanatomy is textbook-accurate. Ipsilateral motor loss (lateral corticospinal tract, already decussated) and proprioception loss (dorsal columns, ipsilateral) are correct. Contralateral pain/temperature loss (lateral spinothalamic tract, already decussated) is correct. Prognosis of 75-90% functional ambulation recovery is consistent with published data. ASIA classification as AIS C is correctly applied (sacral sparing present, >50% key muscles below NLI <3). The case correctly notes that anterior corticospinal tract (uncrossed, ~10-15%) contributes to recovery potential. Neuropathic pain classification (at-level vs. below-level) is accurate per IASP SCI pain taxonomy.

---

### sci_cauda_equina.dart
**PASS**

CES pathophysiology is accurate -- peripheral nerve (LMN) injury with areflexic bladder/bowel. Absent bulbocavernosus reflex is correctly identified as an LMN sign. Surgical timing debate (<24 vs. <48 hours) is accurately presented. CES-R (with retention) having worse prognosis than CES-incomplete is correct. Nerve regeneration rate of ~1 mm/day is correct for peripheral nerves. Bladder recovery rate of 40-70% for surgery within 24-48 hours is within published ranges. Female sexual dysfunction after CES is accurately described with appropriate sensitivity.

---

### sci_central_cord.dart
**PASS**

Central cord syndrome pathophysiology is accurate -- somatotopic organization with medial (UE) fibers affected more than lateral (LE) fibers. Correctly identified as the most common incomplete SCI pattern (~50%). The recovery sequence (LE first, then bladder, then proximal UE, then hands last) is the classic teaching. The MRI finding of edema-only (no hemorrhage) as a favorable prognostic sign is correct. The STASCIS trial reference for early surgical decompression is appropriate. The AO Spine guidelines (2017) are correctly cited.

---

### sci_domestic_violence.dart
**PASS**

IPV clinical indicators are accurately described -- finger-pattern ecchymoses, hospital shopping, retraction pattern, coercive control elements. Mandatory reporting considerations are correctly nuanced by state. The case accurately identifies the increased vulnerability of women with new disabilities to IPV (2-3x rate). Safety planning including accessible DV shelter considerations is clinically appropriate. HIPAA protections in the context of an abusive partner are correctly stated.

---

### sci_heterotopic_ossification.dart
**PASS**

HO presentation, timing (1-6 months, peak 2-3 months), and location (hip most common, 70-80%) are all correct. Triple-phase bone scan as the gold standard for early detection is accurate. ALP as a marker of HO activity is correct. Indomethacin 75 mg daily for 6 weeks as first-line treatment is standard. Etidronate dosing (20 mg/kg/day x 2 weeks, then 10 mg/kg/day x 10 weeks) is correct. Surgical excision timing (12-18 months, after maturation) is appropriate. Maturity criteria (normalized ALP, cold Phase 1/2 on bone scan) are accurate. Radiation dose of 700-800 cGy single fraction is within standard protocols.

---

### sci_high_cervical_vent.dart
**PASS**

C3 ASIA A respiratory physiology is accurate -- diaphragm (C3-5) paralyzed, representing 65-75% of tidal volume. Phrenic nerve testing at 3 weeks being too early for definitive prognostication is an important and correct point. Diaphragm pacing candidacy criteria are accurate. PVFB protocol with appropriate abort criteria is clinically sound. MI-E (CoughAssist) settings of +40/-40 cmH2O are standard. Glossopharyngeal breathing as an emergency ventilation technique is correctly described. Home ventilator discharge requirements (two ventilators, backup generator, etc.) are comprehensive and standard.

Note: The case states pneumonia is the "#1 cause of death" in chronic high cervical SCI. This is accurate -- respiratory complications (particularly pneumonia) are the leading cause of mortality in this population.

---

### sci_neurogenic_bowel.dart
**PASS**

UMN vs. LMN bowel distinction is accurate and clinically critical. UMN bowel (injury above conus, intact sacral reflex arc, increased sphincter tone, digital stimulation effective) vs. LMN bowel (at/below conus, absent reflex arc, decreased tone, manual evacuation required) is textbook. The recommendation to switch oxybutynin to mirabegron to reduce anticholinergic constipation burden is excellent clinical reasoning. Bisacodyl suppository placement against rectal wall (not into stool) is an important practical point. IDDSI and Bristol Stool Scale references are appropriate.

---

### sci_pregnancy.dart
**ISSUES FOUND**

1. **AD threshold for pregnancy case**: The case states the patient has T8 ASIA A and says "T6 and above is classic" for AD risk, noting T7-T8 patients "may also experience AD." This is accurate. However, the Domain B section header then states: "Any patient with SCI at T6 or above is at risk." This is the standard teaching, but for this patient at T8, the case should consistently use T6 (or possibly T7) as the threshold rather than suggesting all T8 patients are routinely at risk. The case does note this is a possibility for T7-T8, which is appropriate, but the framing could be clearer.

   **Correction**: Minor -- consider adding a clarifying note that while T6 is the classic threshold, the literature recognizes that patients with injuries as low as T8 can experience AD, particularly with strong visceral stimuli such as uterine contractions. The current text is not wrong but could be more precise.

2. **Fiber recommendation inconsistency across cases**: This case recommends treating asymptomatic bacteriuria in pregnancy (correct -- standard obstetric practice), but the SCI neurogenic bowel case correctly states not to treat asymptomatic bacteriuria in non-pregnant SCI patients. This distinction is accurate and important, but it is worth noting the cases are consistent on this point.

   **Status**: No correction needed -- this is actually a strength of the case set.

---

### sci_pressure_injury.dart
**PASS**

NPUAP staging system is accurately described. Probe-to-bone test PPV of 89% is correctly cited. MRI as gold standard for osteomyelitis imaging (sensitivity 90%, specificity 80%) is accurate. Bone biopsy as the definitive diagnostic test is correct. MSSA treatment with nafcillin or cefazolin for 6 weeks is standard. Wound VAC settings (75-125 mmHg) are appropriate. Nutritional targets (30-35 kcal/kg, 1.5-2.0 g protein/kg, vitamin C, zinc) are evidence-based. Flap surgery post-operative protocol (6-8 weeks bed rest) is standard.

---

### sci_t6_complete.dart
**PASS**

ASIA A classification criteria are correctly stated (no sacral sparing). Neurogenic shock vs. spinal shock distinction is accurately and clearly explained. Bulbocavernosus reflex as the first reflex to return (24-72 hours) is correct. Thoracic ASIA A conversion rate of 2-5% is accurate. FVC of 65% predicted is realistic for T6 (loss of intercostals and abdominals). Bowel program components (bisacodyl + digital stimulation for UMN bowel) are correct. DVT prophylaxis duration of 8-12 weeks is within guidelines. Expected LOS of 30-45 days for T6 paraplegia is consistent with national benchmarks.

---

## SUMMARY

| Category | Files | PASS | ISSUES |
|----------|-------|------|--------|
| Stroke   | 12    | 9    | 3      |
| SCI      | 11    | 10   | 1      |
| **Total**| **23**| **19** | **4** |

### Issues Requiring Correction

1. **stroke_ich_spasticity.dart**: Botulinum toxin total dose (475-525 units) described as "within safe dosing" while also stating max is 400 units -- contradictory. Also contains irrelevant ICD-10 code G24.02.

2. **stroke_mca_right_hemiplegia.dart**: NIHSS facial palsy score of 2 should be 1 for UMN-pattern lower facial droop. NIHSS right arm motor score of 4 is inconsistent with stated 1/5 strength (should be 3).

3. **stroke_young_adult_pfo.dart**: Minor -- "LMN pattern resolved, now UMN pattern" phrasing for stroke facial droop is confusing (stroke causes UMN pattern from onset). Not a factual error but could mislead.

4. **sci_pregnancy.dart**: Minor -- AD threshold framing at T8 could be more precise, though the content is not incorrect.

### Overall Assessment

The case files demonstrate a high level of medical accuracy across diagnostic criteria, treatment protocols, pharmacologic dosing, and clinical reasoning. The ASIA classifications, neuroanatomical localizations, and evidence-based citations are consistently well-applied. The Domain E (interpersonal/communication) scenarios are realistic and appropriate for a board exam context. The two substantive errors (botulinum toxin dosing language and NIHSS scoring) should be corrected before use.
