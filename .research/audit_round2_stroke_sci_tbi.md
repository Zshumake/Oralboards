# Medical Accuracy Audit — Round 2: Stroke, SCI, TBI Cases

Auditor: PM&R content review
Scope: 27 Dart case files in `lib/data/cases/` (8 stroke, 11 SCI, 7 TBI)
Methodology: File-by-file review against 9 criteria (diagnosis/presentation match, vitals/labs realism, exam consistency, med dosing, neuroanatomy, scoring scales, evidence-based management, Domain E appropriateness, safety).

Legend: PASS = no substantive issues. ISSUE = substantive (clinically meaningful error) or minor (imprecision, debatable, editorial).

---

## STROKE CASES

### 1. `stroke_mca_right_hemiplegia.dart`
Status: **PASS (with 1 minor)**
- NIHSS itemization (est. 12-14) is internally consistent and clinically plausible for a dominant-hemisphere MCA with global aphasia features. Right arm motor 1/5 flaccid is scored "3 (some effort against gravity)" in the NIHSS breakdown — minor internal inconsistency. NIHSS motor item 3 = "some effort against gravity"; a flaccid 1/5 arm should be item score 4 (no movement). Net NIHSS should be ~13-15. **Minor.**
- DOAC restart timing (4-14 days; closer to 14 for large MCA) aligns with current AHA/ASA practice.
- Domain E counseling is appropriate.
- CIMT note (requires ~10-20° wrist extension) is accurate.

### 2. `stroke_ich_spasticity.dart`
Status: **PASS**
- Tardieu explanation (R1/R2), MAS limitations, and tiered spasticity management are accurate.
- Botulinum toxin dosing (ona 375-400 units; FDA ceiling; incoA note) is correct.
- ITB screening dose 50-100 mcg, response criteria valid.
- Minor note: G24.02 code listed as "drug-induced acute dystonia if applicable" — flagged as "if applicable," so acceptable context.

### 3. `stroke_dysphagia.dart`
Status: **PASS**
- VFSS vs FEES comparison accurate.
- PAS (Rosenbek) 1-8 and silent aspiration rate (40-70%) in stroke — cited range is on the higher end but within reported literature.
- IDDSI levels accurate. Chlorhexidine oral care recommendation evidence-based.
- Domain D/E appropriate.

### 4. `stroke_neglect.dart`
Status: **PASS**
- Extinction, line bisection, BIT, CBS, and neuroanatomy (right TPJ, IPL, ventral attention network) accurate.
- Prism adaptation and anosognosia management evidence-based.
- Driving/CDRS guidance appropriate.
- Domain E handling of anosognosia correct.

### 5. `stroke_depression_pba.dart`
Status: **PASS**
- PSD vs PBA distinction accurate; CNS-LS cutoff ≥13 correct.
- FLAME trial reference appropriate (note: FLAME studied fluoxetine for motor recovery; text appropriately clarifies "FLAME trial supported fluoxetine; sertraline has favorable side-effect profile").
- Dextromethorphan/quinidine (Nuedexta) 20/10 mg dosing correct.
- Avoids TCAs and benzos appropriately.

### 6. `stroke_wallenberg.dart`
Status: **PASS (with 1 minor)**
- Lateral medullary anatomy (spinal trigeminal, spinothalamic, sympathetic, ICP, nucleus ambiguus, vestibular) correct.
- Crossed sensory pattern correctly described.
- **Minor**: Lateropulsion and head-turn to weaker side. Text says head turn to LEFT (affected) — this is the standard compensatory strategy for unilateral pharyngeal weakness (rotates bolus toward the stronger side) and is correct.
- CADISS and amitriptyline/pregabalin for CPSP accurate.
- Lamotrigine for CPSP — evidence is modest; text correctly frames it as second-line.

### 7. `stroke_shoulder_subluxation.dart`
Status: **PASS**
- Sulcus sign, Brunnstrom staging, NMES parameters (30-35 Hz, 200-300 μs) match published protocols.
- "Acromiohumeral distance normal >10 mm; subluxation <7 mm" — note that strict cut-offs vary, but the numbers are within published ranges.
- Cautions against overhead pulleys appropriately.
- Domain E honest prognostic communication appropriate.

### 8. `stroke_young_adult_pfo.dart`
Status: **PASS (with 1 minor)**
- RoPE score, CLOSE, REDUCE, RESPECT trials accurately summarized.
- **Minor**: "Left-handed female" with right MCA stroke — language is described as "fluent without dysarthria" with mild left face droop. Right MCA in a left-handed person may or may not spare language; the presentation shown (no aphasia, left neglect) is consistent with right hemisphere dominance for spatial attention. Acceptable.
- Age range 18-60 for PFO closure correct.
- PFO closure + dual antiplatelet then aspirin monotherapy: reasonable.

---

## SCI CASES

### 9. `sci_autonomic_dysreflexia.dart`
Status: **PASS**
- Pathophysiology, BP thresholds, and stepwise management (sit up, check bladder, lidocaine jelly before catheterization, nitropaste, nifedipine "bite and swallow" NOT sublingual) all accurate and evidence-based.
- Correctly warns about beta-blockers worsening bradycardia.
- Captopril 25 mg sublingual is correctly listed as an alternative.
- Trigger frequency (urologic 80-85%) consistent with published data.

### 10. `sci_brown_sequard.dart`
Status: **PASS**
- Neuroanatomy (lateral corticospinal decussation at medullary pyramids; spinothalamic decussation at anterior white commissure within 1-2 segments; dorsal columns ipsilateral) accurate.
- Prognosis statement "75-90% regain functional ambulation" consistent with literature for Brown-Sequard.
- ASIA C classification criteria correctly applied.
- DN4/LANSS, pregabalin/gabapentin titration correct.
- Domestic violence handling and PC-PTSD-5 appropriate.

### 11. `sci_cauda_equina.dart`
Status: **PASS**
- LMN pattern (areflexic, absent BCR), surgical timing (<24-48 hr), and CES-R prognosis discussion accurate.
- Bladder recovery rates (40-70% overall; worse with CES-R) consistent with literature.
- Pelvic floor PT and sex therapist referrals appropriate.
- Domain E counseling sensitive and medically accurate.

### 12. `sci_central_cord.dart`
Status: **PASS**
- Somatotopic organization of lateral corticospinal tract (medial UE, lateral LE) — this is the **classic teaching** used on boards, though more recent studies question strict somatotopy. Text presents the standard board teaching, which is appropriate for this context.
- STASCIS, AO Spine 2017 guidelines, recovery sequence (LE → bladder → proximal UE → hand) accurate.
- Combined UMN + LMN pattern at lesion level correctly explained.
- Domain E response to caregiver crisis exemplary.

### 13. `sci_domestic_violence.dart`
Status: **PASS**
- IPV clinical indicators, HIPAA/confidentiality handling, and partner call management all ethically sound.
- Disability + IPV epidemiology (2-3x risk) consistent with published data.
- Trauma-informed care language appropriate.
- Domain E phone-call handling is exactly the right HIPAA posture.

### 14. `sci_heterotopic_ossification.dart`
Status: **PASS**
- Triple-phase bone scan as early gold standard, ALP as activity marker, hip as most common site (70-80%) all correct.
- Indomethacin 75 mg daily × 6 weeks with GI prophylaxis standard practice.
- Etidronate historical context accurate (rarely used now).
- Radiation (700-800 cGy single fraction) and mature HO excision timing (12-18 months) correct.
- **Minor**: 24-hour pre-op radiation is more typical in hip arthroplasty HO prophylaxis; for SCI-related excision, timing varies. Not misleading.

### 15. `sci_high_cervical_vent.dart`
Status: **PASS**
- Diaphragm innervation (C3-5), accessory muscle contribution, pneumonia as leading cause of death accurate.
- Phrenic pacing candidacy: correctly notes need to distinguish neurapraxia vs. axonotmesis and to wait 3-6 months for repeat phrenic nerve studies.
- NeuRx intramuscular diaphragm pacing system (which does NOT require intact phrenic conduction at the nerve level but does require intact phrenic motor neurons in the cord) — text phrasing is reasonable.
- Home ventilator discharge requirements comprehensive and accurate.
- Ethical handling of patient autonomy vs. family wishes in a young SCI patient is thoughtful and appropriate; acknowledges high rate of adjustment over time.

### 16. `sci_neurogenic_bowel.dart`
Status: **PASS**
- UMN vs LMN bowel distinction correct; BCR, anal tone, and program differences accurate.
- Oxybutynin → mirabegron switch for anticholinergic burden is evidence-based reasoning.
- AD prevention with rectal lidocaine before digital stim appropriate.
- MACE/ACE and transanal irrigation as rescue options correct.
- C7 injury: AD risk noted, appropriate caution.

### 17. `sci_pregnancy.dart`
Status: **PASS**
- T6 and above = classic AD threshold; text correctly notes T7-T8 may still experience AD. Uterine contractions as potent AD trigger accurate.
- Early epidural for AD prevention is standard of care.
- Breastfeeding possible in SCI accurate.
- Adaptive parenting equipment descriptions accurate.
- Domain E handling of ableist mother-in-law is strong, ADA-informed, respectful.

### 18. `sci_pressure_injury.dart`
Status: **PASS**
- NPUAP staging accurate. Stage 4 with exposed bone correct.
- Probe-to-bone PPV ~89% accurate; MRI sensitivity/specificity ranges reasonable.
- Nafcillin/cefazolin for MSSA osteo × 6 weeks IV = standard.
- Calories 30-35 kcal/kg and protein 1.5-2.0 g/kg/day for wound healing are standard recommendations.
- Flap timing and 6-8 week post-flap bed rest accurate.
- Motivational interviewing response appropriate.

### 19. `sci_t6_complete.dart`
Status: **PASS**
- ASIA A criteria (no VAC, no DAP, no S4-5 LT/PP) correctly stated.
- Neurogenic vs spinal shock distinction correct.
- Thoracic ASIA A conversion rate (~2-5%) matches literature.
- Zone of partial preservation defined correctly.
- Enoxaparin 40 mg SQ daily × 8-12 weeks aligns with CSCM guidelines.
- CMS-13 diagnoses, 3-hour rule, FIM efficiency accurate.
- Domain E honest prognostic communication appropriate.

---

## TBI CASES

### 20. `tbi_abusive_head_trauma.dart`
Status: **PASS**
- Classic AHT triad (SDH, retinal hemorrhages, encephalopathy) and biomechanical implausibility of 2-foot couch fall correctly emphasized.
- Metaphyseal corner fractures and posterior rib fractures as highly specific for abuse — accurate.
- Glutaric aciduria type I and OI in the differential — excellent teaching points.
- Mandated reporter guidance, IDEA Part C (45-day evaluation timeline), IFSP, infantile spasm vigilance all accurate.
- **Minor**: Vitamin K / coag panel implied under "bleeding diathesis" workup — not explicitly listed but coag panel is mentioned. Minor.
- Domain E navigation of possibly-unaware mother is appropriately balanced.

### 21. `tbi_concussion_return_play.dart`
Status: **PASS**
- Berlin Consensus 6-stage RTP protocol accurate.
- VOMS components (smooth pursuits, saccades, NPC, VOR) correct; NPC abnormal >5 cm is the standard cutoff.
- Rationale against NSAIDs in first 48 hours (theoretical) is conservative but commonly taught.
- Second impact syndrome as rationale for conservative return appropriate for teen.
- Section 504 vs IEP appropriately framed.
- SCAT6 is current (2023 Berlin Consensus).

### 22. `tbi_moderate_return_work.dart`
Status: **PASS**
- GCS 9-12 = moderate TBI correctly classified.
- Endocrine screening at 3-6 months appropriate.
- Methylphenidate for post-TBI attention first-line with evidence base.
- Correctly avoids benzos, typical antipsychotics, anticholinergics.
- AMA Guides 6th edition for impairment rating correct.
- HIPAA handling of employer call appropriate.

### 23. `tbi_penetrating.dart`
Status: **PASS (with 1 minor)**
- Penetrating TBI seizure risk 30-50% lifetime, infection risk 5-23% — consistent with published data.
- Orbitofrontal syndrome localization accurate.
- Propranolol first-line for TBI agitation with evidence base (Fleminger); avoidance of haloperidol as maintenance correct.
- Amantadine dosing and dual benefit correct.
- **Minor**: "Cranioplasty 3-6 months" — varies institutionally; some wait longer. Acceptable.
- Syndrome of the trephined correctly described.
- Domain E staff support and behavioral contextualization appropriate.

### 24. `tbi_pituitary_dysfunction.dart`
Status: **PASS**
- Post-traumatic hypopituitarism prevalence (25-50% moderate-severe TBI) consistent with literature.
- Axis vulnerability hierarchy (GH > gonadotropins > ACTH > TSH) correct.
- Replacement order (cortisol FIRST before thyroid to avoid precipitating adrenal crisis) is critical and correctly emphasized.
- Central hypothyroidism: monitor free T4, not TSH — correct.
- Cosyntropin stim peak cortisol >18 as normal cutoff correct.
- Stress dosing and emergency Solu-Cortef 100 mg IM appropriate.
- Lab interpretation internally consistent with the presented case.

### 25. `tbi_post_traumatic_seizures.dart`
Status: **PASS**
- Early vs late PTS distinction and epileptogenesis mechanism accurate.
- Single unprovoked late seizure >7 days = PTE diagnosis (ILAE 2014) correct.
- Levetiracetam first-line; avoidance of phenytoin, phenobarbital, topiramate in TBI rehab evidence-based.
- ILAE 2017 seizure classification correctly applied (focal onset, impaired awareness, evolving to bilateral tonic-clonic).
- State driving law variability and mandatory-reporting state list correct.
- ADA protection against epilepsy employment discrimination accurate.
- Domain E ethical handling of confidentiality + safety is well-balanced.

### 26. `tbi_substance_abuse.dart`
Status: **PASS**
- CAGE, AUDIT, AUDIT-C, DSM-5 AUD criteria correctly presented.
- BAL 0.28 as >3x legal limit correct.
- Wernicke-Korsakoff distinction, thiamine replacement, GGT/MCV/hepatomegaly signs of chronic use all accurate.
- Naltrexone 50 mg PO (or Vivitrol 380 mg IM monthly), acamprosate 666 mg TID, cautions about disulfiram in TBI all appropriate.
- Avoidance of confrontational approach in pre-contemplation stage is MI-consistent.
- Domain E handling of enabling family member is respectful and evidence-based.

---

## SUMMARY

**Files reviewed: 26** (8 stroke + 11 SCI + 7 TBI)

Wait — recount: Stroke = 8, SCI = 11, TBI = 7. Total = **26 files reviewed.**

- **PASS: 26**
- **Substantive issues: 0**
- **Minor issues: 5**
  1. `stroke_mca_right_hemiplegia.dart` — NIHSS item 5b motor score for flaccid 1/5 arm should be 4 (no movement) rather than 3; total NIHSS slightly underestimated.
  2. `stroke_wallenberg.dart` — minor: lamotrigine evidence for CPSP is modest (framed as second-line — acceptable).
  3. `stroke_young_adult_pfo.dart` — minor: left-handed patient with right MCA and no aphasia is internally consistent but worth noting.
  4. `sci_heterotopic_ossification.dart` — minor: 24h pre-op radiation timing reference is more typical in arthroplasty; SCI HO excision protocol less standardized.
  5. `tbi_penetrating.dart` — minor: cranioplasty 3-6 months is on the earlier end; often delayed longer depending on infection/edema.

**Overall assessment**: These cases are clinically accurate, appropriately evidence-based, and pedagogically strong. Domain E scenarios consistently model trauma-informed, ADA-aware, HIPAA-compliant, and ethically sound communication. No dangerous or misleading statements were identified. Medication dosing, scoring scales, and neuroanatomy are correct throughout. The five minor items above are nuance-level and do not compromise educational validity.
