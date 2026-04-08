# Medical Accuracy Audit — Round 2
## Geriatric, Neurodegenerative, and Neuromuscular Cases

**Date:** 2026-04-07
**Scope:** `lib/data/cases/` — `geriatric_*.dart`, `neuro_*.dart`, `nm_*.dart`
**Files reviewed:** 20
**Reviewer focus:** Beers criteria, EDX findings, DMT/immunosuppressant dosing, neurodegenerative scoring, DVT guideline attribution, dangerous statements.

---

## Geriatric cases (8)

### 1. `geriatric_deconditioning.dart` — ⚠️ MINOR
- Clinically sound overall. Fall risk stratification, multifactorial orthostatic workup, and Beers-flagged meds (lorazepam, tramadol, glipizide, tamsulosin) are appropriate.
- **Minor:** The BP target citation is slightly dated — stated "≤150/90 per JNC-8 for age >60". JNC-8 recommendation is technically correct but superseded in many PM&R/geriatric settings by 2017 ACC/AHA (≤130/80 with individualization) and ACP/AAFP (≤150/90 for ≥60). Acceptable to retain JNC-8 citation but consider noting the competing guidelines.
- **Minor:** Tramadol is included in Beers 2023 under "use with caution" (hyponatremia, seizures) rather than a categorical "avoid." Labeling it simply "Beers — avoid" is slightly oversimplified.
- No dangerous statements.

### 2. `geriatric_dementia_caregiver.dart` — ✅ PASS
- Zarit Burden Interview max 88 is correct; score >24 for high burden is reasonable (some scales use different cutoffs, but range is defensible).
- GDS/Reisberg and FAST staging accurately described (FAST 6d-6e for toileting/continence issues).
- Quetiapine 25 mg QHS with titration to 50 mg is reasonable though off-label; appropriate acknowledgment of black-box warning would strengthen it (minor omission, not an error).
- Capacity assessment (understanding/appreciation/reasoning/communication) correct.
- Communication skills section is strong and realistic.

### 3. `geriatric_elder_abuse.dart` — ✅ PASS
- Abuse indicators (grab-pattern bruising, stocking distribution in non-bony trunk/back, concealment, caregiver dependence) clinically accurate.
- Mandatory reporting discussion, APS process, and reporter immunity correct.
- Cyclobenzaprine NOT recommended in this case (unlike the VCF case below) — appropriately avoided.
- Communication plan for separating suspected abuser from patient is safe and well-structured.

### 4. `geriatric_frailty_surgical.dart` — ⚠️ MINOR
- Fried Frailty Phenotype correctly described but the grip-strength cutoff listed as "26 kg threshold for males of his BMI" is imprecise. Fried thresholds are BMI-stratified for men: BMI ≤24 → ≤29; 24.1–26 → ≤30; 26.1–28 → ≤30; >28 → ≤32. At BMI 19.8 the cutoff is ≤29, not 26. This does not change the positive classification but the threshold value is wrong. **Minor**.
- CFS classification, ACS-NSQIP use, and prehabilitation framework are accurate and evidence-based.
- Albumin target "3.0 g/dL pre-surgery" and protein 1.2–1.5 g/kg/day consistent with ERAS/ESPEN guidance.
- Domain E handling of family-driven surgery pressure is excellent.

### 5. `geriatric_hip_fracture.dart` — ⚠️ SUBSTANTIVE (guideline attribution)
- Clinical content, CAM/delirium workup, rhabdomyolysis recognition, and osteoporosis workup are solid.
- Zoledronic acid initiation 2 weeks post-op with vitamin D repletion is appropriate.
- **Substantive (attribution):** Text states "Enoxaparin 40 mg SQ daily for 28–35 days post-operatively **per AAOS guidelines**." The **AAOS** Clinical Practice Guideline on VTE in hip/knee arthroplasty does NOT endorse a specific agent or exact duration; the 28–35 day (or up to 35-day) recommendation for hip fracture/THA is from the **ACCP (American College of Chest Physicians)** CHEST guideline. Attribution should be corrected to ACCP (or cite both, noting AAOS is less prescriptive). This is a flagged item in the audit brief (DVT guideline attribution).
- WBAT after sliding hip screw for stable intertroch fracture is appropriate.

### 6. `geriatric_polypharmacy.dart` — ⚠️ SUBSTANTIVE (benzodiazepine equivalence dosing)
- Overall deprescribing plan is thoughtful, Beers criteria mapping accurate, prescribing cascade analysis is strong.
- **Substantive dosing error:** "Convert 5 mg diazepam nightly to equivalent lorazepam dose (more predictable metabolism in elderly). **Start lorazepam 1 mg nightly**." The accepted equivalence is ~10 mg diazepam ≈ 1 mg lorazepam (some sources 1 mg loraz ≈ 5 mg diaz, but most comprehensive benzodiazepine equivalence tables give 0.5 mg lorazepam ≈ 5 mg diazepam). Using 1 mg lorazepam for a 5 mg diazepam substitution is likely **double-dosing** at the switch-over point for a frail elderly patient, which defeats the deprescribing goal and could worsen her falls. Recommend: start lorazepam 0.5 mg nightly (or taper diazepam directly in small decrements rather than switching, since the switch itself is controversial — long-acting diazepam can be tapered more smoothly than converting to short-acting lorazepam).
- Mirabegron 25 mg daily as oxybutynin replacement is appropriate.
- ACB score arithmetic (3+3+2=8) and implication correct.
- Discontinuing ASA 81 mg primary prevention per USPSTF 2022 correct for age ≥60.

### 7. `geriatric_tka_rehab.dart` — ✅ PASS
- Rivaroxaban 10 mg daily post-TKA is correct dosing.
- Acetaminophen 1 g TID (3 g/day max in elderly) is conservative-appropriate.
- Celecoxib hold if GFR <30 is correct.
- CPM evidence review accurate (AAOS moderate recommendation against routine use).
- Driving clearance for right TKA at 4–6 weeks with opioid cessation is standard.
- Patient-expectation counseling is realistic (golf 8–12 weeks, no high-impact).

### 8. `geriatric_vertebral_fracture.dart` — ⚠️ SUBSTANTIVE (inappropriate medication in elderly)
- DEXA interpretation, FRAX, secondary-causes workup, kyphoplasty criteria, and bisphosphonate/anabolic therapy all accurate.
- Calcitonin nasal spray for acute VCF pain is evidence-based (modest effect, FDA-labeled; worth noting calcitonin NDA carries a cancer risk warning and EMA has restricted chronic use — reasonable to acknowledge).
- **Substantive:** Recommends **"Cyclobenzaprine 5 mg TID PRN for paravertebral spasm"** in a 72-year-old with documented osteoporosis and high fall risk. Cyclobenzaprine is on the **AGS Beers criteria AVOID list in older adults** due to anticholinergic effects, sedation, and fall/fracture risk — directly contradicting the falls-prevention emphasis elsewhere in the case and the explicit Beers counseling in `geriatric_polypharmacy.dart`. This is internally inconsistent and potentially dangerous. Recommend removing cyclobenzaprine and relying on scheduled acetaminophen, lidocaine patch, short-course low-dose tramadol (with cautions), and TLSO for spasm relief.
- TLSO (Jewett/CASH) selection and 6–8 week duration accurate.
- Communication discussion of ONJ (~1:10,000 to 1:100,000) and AFF (~3–5 per 100,000 patient-years) risks cites reasonable ranges.

---

## Neuro / neurodegenerative cases (6)

### 9. `neuro_als.dart` — ✅ PASS
- El Escorial / Awaji criteria, diagnostic certainty levels, and mimic list (MMN, Kennedy, IBM, cervical myelopathy, PLS) accurate.
- EMG/NCS description correct (preserved SNAPs, reduced CMAPs, fibs/positive sharps in ≥3 regions, polyphasic chronic reinnervation MUPs).
- Riluzole 50 mg BID and LFT monitoring correct.
- Edaravone cycles (14 on / 14 off) and oral formulation accurate.
- Tofersen for SOD1 "~2% of all ALS" is defensible (SOD1 ~20% of familial, ~1–2% overall).
- PEG timing before FVC <50% is current multidisciplinary clinic standard.
- Nocturnal NIV initiation (FVC <80% or orthopnea) and survival benefit (~7–11 months) accurate.
- SPIKES framework applied appropriately.

### 10. `neuro_huntingtons.dart` — ✅ PASS
- CAG repeat interpretation ranges correct (<27 normal; 27–35 intermediate; 36–39 reduced penetrance; ≥40 full penetrance).
- Anticipation via paternal transmission correct.
- Shoulson-Fahn staging and TFC 10 → Stage II classification correct.
- Tetrabenazine CYP2D6 genotyping requirement before >50 mg/day correct; black-box suicidality warning correctly highlighted as relative contraindication.
- Deutetrabenazine 6 mg start, 48 mg max BID correct.
- GINA protections (Title I health insurance, Title II employment ≥15 employees; life/disability/LTC not protected) accurate and actionable advice.
- Predictive-testing protocol for adult daughter and recommendation against minor testing aligns with HDSA/ASHG guidance.

### 11. `neuro_ms_relapsing.dart` — ✅ PASS
- True vs pseudo-relapse framework accurate (>24h, >30d from last, absence of infection/fever).
- IV methylprednisolone 1 g × 3–5 days standard of care.
- Amantadine 100 mg BID first-line for MS fatigue — historically first-line; 2021 **TRIUMPHANT-MS** randomized trial showed no benefit over placebo for amantadine, modafinil, or methylphenidate, but all remain in clinical use. Defensible; could be slightly updated.
- JCV index >1.5 threshold for PML risk stratification with natalizumab correct.
- Dimethyl fumarate washout "at least 1 month" pre-conception is conservative; ocrelizumab 6-month washout correct.
- Pregnancy counseling (reduced relapses 2nd/3rd trimester, increased postpartum relapse risk first 3–6 months) accurate.
- EDSS 4.0 description correct (limited walking but fully ambulatory).

### 12. `neuro_parkinsons.dart` — ✅ PASS
- H&Y 3 description accurate (bilateral disease with postural instability, functionally independent).
- Motor fluctuation types (wearing off, on-off, dose failure, peak-dose vs diphasic dyskinesias) correctly characterized.
- DBS candidacy: idiopathic PD, robust levodopa response (>30% UPDRS-III improvement on challenge), duration >4y, absence of dementia/untreated psychiatric disease — correct.
- Correctly notes axial symptoms (FOG in "on" state, postural instability) and cognitive impairment as limiting DBS benefit.
- Pimavanserin as PD psychosis first-line, quetiapine as alternative, AVOID haloperidol/olanzapine/risperidone — accurate.
- Rivastigmine as only FDA-approved cholinesterase inhibitor for PDD correct.
- REM sleep behavior disorder → melatonin first-line, low-dose clonazepam second-line correct.
- LSVT BIG/LOUD protocols (16 sessions, 4 days/week, 4 weeks) correct.
- Orthostatic hypotension management including midodrine/droxidopa correct.

### 13. `neuro_post_polio.dart` — ✅ PASS
- March of Dimes PPS diagnostic criteria correctly stated (≥15-year stable period, diagnosis of exclusion).
- Pathophysiology (dropout of enlarged reinnervated motor units from collateral sprouting) accurate.
- EMG findings (chronic neurogenic MUPs, scattered fibs/PSWs in prior-polio-distribution, stable fasciculations) correct.
- "Less is more" exercise philosophy and 50% rule appropriate.
- Differentiation from ALS (no UMN signs, very slow progression, spared sensory) correct.
- Stance-control KAFO and orthotic considerations reasonable.

### 14. `neuro_progressive_ms.dart` — ✅ PASS
- SPMS vs PPMS distinctions accurate.
- Siponimod (Mayzent) FDA-approved for SPMS with active disease correct.
- Ocrelizumab as only FDA-approved DMT for PPMS correct.
- EDSS 7.0 description (restricted to wheelchair but self-transfers/propels) correct.
- Power wheelchair justification, ATP involvement, Medicare face-to-face exam / 7-element order / home-use focus all accurate to Medicare PMD policy.
- Tilt-in-space/recline rationale for pressure injury and fatigue correct.
- Intrathecal baclofen pump appropriate mention for refractory spasticity.

---

## Neuromuscular cases (6)

### 15. `nm_carpal_tunnel.dart` — ✅ PASS
- EDX severity grading consistent with AANEM classification (absent/severely prolonged median sensory latency, prolonged distal motor latency, reduced CMAP from APB, fibs/PSWs in APB with chronic neurogenic MUPs = severe).
- Correctly flags superimposed diabetic polyneuropathy (reduced sural SNAP) and its prognostic implications.
- Injection discussion accurately cites Cochrane short-term benefit without sustained effect, and correctly advises AGAINST delaying surgery with thenar atrophy and axonal loss.
- Workers' comp causation letter structure is legally sound.
- Medical interpreter section (Title VI, Section 1557 ACA) correctly identifies that a minor daughter should not serve as interpreter for complex consent.

### 16. `nm_cmt.dart` — ✅ PASS
- CMT1 demyelinating pattern: uniform slowing, median motor CV <38 m/s, reduced SNAPs, absent conduction block/temporal dispersion — **this is the key distinguishing feature from CIDP**, correctly stated.
- PMP22 duplication as most common cause of CMT1A (70–80%) correct.
- Inheritance (autosomal dominant, 50% to each child) and life expectancy (normal) correct.
- Failed vitamin C trial (PREMIER) correctly noted as negative.
- PLS carbon-fiber AFO recommendation appropriate for this active young patient.

### 17. `nm_cubital_tunnel.dart` — ✅ PASS
- Excellent EDX localization framework — dorsal ulnar cutaneous SNAP differentiates elbow from Guyon lesion; MABC and paraspinal EMG help exclude C8/medial cord/lower trunk.
- McGowan grading (I mild intermittent; II constant with weakness/early atrophy; III severe atrophy/claw) correct.
- "Across-elbow CV <50 m/s or >10 m/s drop vs. forearm" and ">20% CMAP amplitude drop" thresholds are consistent with AANEM guidance.
- Conservative management protocol (night elbow extension splinting, activity modification, ergonomics) and surgical indication criteria (failure of 3–6 months conservative Rx, progressive axonal loss, McGowan III at presentation) appropriate.
- Avoidance of steroid injection at cubital tunnel is consistent with evidence.

### 18. `nm_gbs_recovery.dart` — ✅ PASS
- CSF albuminocytologic dissociation, Campylobacter antecedent, IVIg 0.4 g/kg × 5 days, PLEX as alternative — all correct.
- Prognostic EDX features accurate (preserved CMAP amplitudes favor demyelinating-only course; inexcitable nerves or very low CMAPs at 3 months predict axonal loss and slower recovery).
- Treatment-related fluctuation (TRF) vs CIDP reclassification criteria correct.
- Neuropathic pain ladder (gabapentin → add duloxetine → topical lidocaine, avoid opioids) appropriate.
- Cautions about over-exercise and eccentric overload in partially reinnervated muscles correct.
- Identity-loss communication and depression screening handled appropriately.

### 19. `nm_icu_weakness.dart` — ✅ PASS
- CIM vs CIP distinction based on SNAPs correct (preserved SNAPs in CIM, reduced SNAPs in CIP).
- Direct muscle stimulation with reduced muscle-to-nerve CMAP ratio = hallmark for CIM (reduced muscle membrane excitability).
- Risk factors (corticosteroids + NMBA synergy, hyperglycemia, sepsis) accurate.
- LTAC vs acute rehab vs ventilator-capable SNF triage framework is sound.
- Avoiding dexamethasone specifically due to higher myopathic potential is accurate.
- Nutritional targets (protein 1.5–2.0 g/kg/day, 25–30 kcal/kg/day, glycemic 140–180) consistent with ASPEN/SCCM.
- Diaphragm ultrasound thickening fraction thresholds (normal >30%, <20% predicts weaning failure) correct.

### 20. `nm_myasthenia_gravis.dart` — ✅ PASS
- Serologic workup ordering (AChR → MuSK → LRP4; striational antibodies for thymoma) correct.
- AChR sensitivity ~85% generalized, ~50% ocular; MuSK ~40–50% of AChR-negative — correct.
- Decremental RNS ≥10% cutoff correct; SFEMG jitter/blocking described correctly.
- Thymoma association (~10–15% of MG; 30–50% of thymomas develop MG) correct.
- Ice pack test positive finding correctly described.
- Pyridostigmine dosing (30 mg TID start, up to 120 mg q4h max), steroid cautious initiation (avoid rapid high-dose due to transient worsening), and steroid-sparing agents (MMF, azathioprine with TPMT) correct.
- IVIg 2 g/kg over 2–5 days / PLEX 5 exchanges for crisis correct.
- Medications-to-avoid list accurate (aminoglycosides, fluoroquinolones, macrolides, beta-blockers, CCBs, procainamide, quinidine, magnesium sulfate, D-penicillamine, neuromuscular blockers, checkpoint inhibitors).
- "20/30/40 rule" for respiratory monitoring (FVC <20 mL/kg, NIF weaker than -30, FVC drop >30%) is reasonable ICU teaching rule.
- Succinylcholine cautions and reduced-dose non-depolarizing blocker guidance correct.

---

## Summary

| Severity | Count | Files |
|---|---|---|
| ✅ PASS | 15 | geriatric_dementia_caregiver, geriatric_elder_abuse, geriatric_tka_rehab, neuro_als, neuro_huntingtons, neuro_ms_relapsing, neuro_parkinsons, neuro_post_polio, neuro_progressive_ms, nm_carpal_tunnel, nm_cmt, nm_cubital_tunnel, nm_gbs_recovery, nm_icu_weakness, nm_myasthenia_gravis |
| ⚠️ SUBSTANTIVE | 3 | geriatric_hip_fracture (AAOS→ACCP DVT attribution), geriatric_polypharmacy (diazepam→lorazepam dosing error), geriatric_vertebral_fracture (cyclobenzaprine in elderly — Beers violation) |
| ⚠️ MINOR | 2 | geriatric_deconditioning (JNC-8 sole BP citation, tramadol Beers characterization), geriatric_frailty_surgical (Fried grip BMI-stratified cutoff value) |

**Totals: 20 files reviewed — 15 PASS, 3 substantive issues, 2 minor issues.**

### Priority fix list
1. **`geriatric_polypharmacy.dart`** — Change lorazepam bridging dose from 1 mg to 0.5 mg, or preferably drop the switch entirely and taper diazepam in place (e.g., decrease by 10–25% every 1–2 weeks).
2. **`geriatric_vertebral_fracture.dart`** — Remove cyclobenzaprine recommendation; substitute acetaminophen + lidocaine patch + TLSO + short-course low-dose tramadol (with falls caveat).
3. **`geriatric_hip_fracture.dart`** — Change DVT prophylaxis citation from "per AAOS guidelines" to "per ACCP CHEST guidelines" (or cite AAOS + ACCP jointly with correct attribution).
4. **`geriatric_frailty_surgical.dart`** — Correct Fried grip cutoff: at BMI 19.8, cutoff is ≤29 kg for men (not 26).
5. **`geriatric_deconditioning.dart`** — Consider adding 2017 ACC/AHA BP alternative; soften tramadol to "Beers — use with caution."

No dangerous statements identified in any file. Domain E communication scenarios are uniformly strong and realistic across all 20 cases.
