import '../../models/case_model.dart';

const caseCalfdiscomfort = CaseModel(
  id: 'calfdiscomfort',
  title: 'VTE Management in Acute Intracranial Hemorrhage',
  url: 'https://www.pmrrecap.com/calfdiscomfort',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 48-year-old female is currently undergoing inpatient rehabilitation following a moderate traumatic brain injury (TBI) and a right-sided subdural hematoma (SDH). On hospital day 12, she reports new-onset, progressively worsening left calf discomfort.',
    ),
    const Section(
      title: 'Clinical Assessment & Risk Stratification:',
      content: 'Your initial evaluation of suspected Venous Thromboembolism (VTE) should address:\n- **Symptom Profile**: Onset, location, and the presence of associated pleuritic chest pain or dyspnea.\n- **Risk Factors**: Current mobilization status, adherence to chemical and mechanical thromboprophylaxis, and premorbid risk factors (e.g., smoking, oral contraceptives, or malignancy).\n- **Diagnostic Scoring**: Application of the **Wells Criteria** to determine pre-test probability of Deep Vein Thrombosis (DVT).\n- **Physiological Review**: Screening for Systemic Inflammatory Response Syndrome (SIRS) or signs of hemodynamic compromise (tachycardia, tachypnea, hypoxia).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vital Signs**: T 99.4°F, HR 108 bpm (tachycardia), BP 118/72 mmHg, SpO2 94% on room air.\n- **Integumentary**: The left lower extremity demonstrates non-pitting edema from the foot to the mid-calf. There is a 3cm increase in calf circumference compared to the contralateral limb. No localized erythema or warmth is noted.\n- **Neuromusculoskeletal**: Strength is 4/5 in the left L4-S1 distribution (baseline per TBI). Passive ankle dorsiflexion eliciting calf pain (Homan\'s sign is non-specific but noted). Sensation is diminished in a stocking-like distribution bilaterally.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The patient\'s Wells Score is 3 (1 point for swelling of the entire leg, 1 point for calf swelling >3cm, 1 point for paralysis/immobilization), indicating a high pre-test probability for DVT.',
    ),
    const Section(
      title: '+ Formulate the appropriate diagnostic workup for this patient.',
      content: '1.  **Lower Extremity Imaging**: **Lower Extremity Venous Duplex Ultrasonography** (Compression ultrasound) to evaluate for proximal DVT.\n2.  **Pulmonary Evaluation**: Given the borderline hypoxia (94%) and tachycardia, order a **CTA Chest (PE Protocol)** or V/Q scan to exclude Pulmonary Embolism (PE).\n3.  **Laboratory Studies**: CBC with differential, BMP, and Coagulation profile (PT/INR, PTT).\n4.  **Neurological Monitoring**: STAT **non-contrast CT Head** to evaluate the stability of the known subdural hematoma before initiating anticoagulation.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'Duplex ultrasonography confirms a left common femoral DVT. The CTA Chest is negative for PE. The CT Head reveals a stable right-sided SDH with a slight reduction in size compared to the scan 10 days prior. Neurosurgery has been consulted.',
    ),
    const Section(
      title: '+ Discuss the clinical decision-making process for initiating anticoagulation in this patient.',
      content: 'This represents a high-stakes management dilemma. Per **ACCP/AANS guidelines**:\n1.  **Risk vs. Benefit**: The risk of VTE propagation/PE must be balanced against the risk of intracranial hemorrhage (ICH) expansion. \n2.  **Timing**: In patients with stable ICH (no expansion on 24-48 hour follow-up), therapeutic anticoagulation can typically be initiated 7–10 days post-injury. \n3.  **Agent Selection**: I would prefer a **Continuous Heparin Infusion (unfractionated)**. Its short half-life and rapid reversibility with protamine make it safer if acute neurological decline occurs compared to long-acting oral anticoagulants or LMWH.\n4.  **Alternative**: If the neurosurgical team deems the bleeding risk too high, or if the SDH remains unstable, I would proceed with the placement of an **IVC Filter** as a bridge until anticoagulation is safe.',
    ),
    const Section(
      title: '+ Challenge: Provide the pros and cons of IV Unfractionated Heparin vs. Low Molecular Weight Heparin (Enoxaparin) in this subacute TBI patient.',
      content: '- **Unfractionated Heparin (IVH)**: \n    - *Pros*: Rapid onset/offset; easily reversible; predictable in renal failure.\n    - *Cons*: Requires frequent monitoring (aPTT/Anti-Xa) and bedside titration; higher risk of Heparin-Induced Thrombocytopenia (HIT).\n- **Enoxaparin (LMWH)**:\n    - *Pros*: High bioavailability; no routine monitoring required; lower risk of HIT.\n    - *Cons*: Prolonged half-life (making it \'less ideal\' if an emergency surgery is needed); more difficult to reverse partially with protamine.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'Your hospital\'s Quality Improvement (QI) committee identifies a cluster of new-onset VTE cases originating from one specific referring acute care facility.',
    ),
    const Section(
      title: '+ Describe how you would conduct a \'Root Cause Analysis\' (RCA) to investigate this disparity.',
      content: 'I would lead a multidisciplinary investigation following these steps:\n1.  **Data Verification**: Perform a formal audit to confirm the statistical significance of the VTE cluster compared to other referring centers.\n2.  **Process Mapping**: Investigate the transition of care. Were DVT prophylaxis orders (chemical and mechanical) being discontinued during transfer or never initiated at the referring site?\n3.  **Clinical Audit**: Review the incidence of VTE prophylaxis contraindications in that specific patient cohort.\n4.  **Stakeholder Collaboration**: Facilitate a \'Plan-Do-Study-Act\' (PDSA) cycle with the acute site\'s Trauma/Neurosurgery leads to standardize \'VTE prophylaxis bundles\' during the transfer process.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: The patient\'s father is irate: \'The other hospital missed this DVT! This is negligence and it could have killed her. I\'m calling my lawyer to sue everyone involved in her care before she got to you.\'',
    ),
    const Section(
      title: '+ Provide a professional response that addresses the father\'s anger while maintaining professional standards and patient confidentiality.',
      content: 'I would respond: \'I completely recognize how frightening this news is, especially given everything your daughter has already endured. First, I do need to ensure that I have her formal permission to discuss these details with you. [Assume permission is granted]. Regarding your concerns about the previous hospital, it\'s important to understand that a DVT can develop even with perfect medical care, and it is a known complication of decreased mobility after a brain injury. Our primary focus now is that we have identified it, she is stable, and we are initiating the standard of care for her treatment. I would encourage you to maintain an open dialogue with her previous team if you have questions about their specific protocols, but my priority here is ensuring her safe recovery and transition into active rehabilitation.\'',
    ),
  ],
);
