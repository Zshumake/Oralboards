import '../../models/case_model.dart';

const caseShortnessofbreath = CaseModel(
  id: 'shortnessofbreath',
  title: 'Autonomic Dysreflexia (AD)',
  url: 'https://www.pmrrecap.com/shortnessofbreath',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 24-year-old female with T4 ASIA B Paraplegia (1 month post-injury) complains of sudden onset shortness of breath and a \'pounding\' headache. She appears flushed and anxious.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In a high-level SCI patient (T6 or above), acute symptoms require ruling out **Autonomic Dysreflexia** vs. **Pulmonary Embolism**:\n- **AD Signs**: Pounding headache, diaphoresis/flushing *above* the level of injury, nasal congestion, anxiety (\'Sense of Impending Doom\').\n- **PE Signs**: Pleuritic chest pain, tachycardia, hypoxia.\n- **Triggers**: \n    - **Bladder** (Most common): Kinked catheter, retention, UTI.\n    - **Bowel**: Constipation, impaction.\n    - **Skin**: Pressure ulcer, ingrown toenail, tight clothing.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vitals**: BP 150/90 (Baseline 90/60). HR 52 (Bradycardia). SpO2 96% RA.\n- **Neuro**: Flushing of the face/neck. Pale/cool skin below T4.\n- **Abdomen**: Palpable bladder distension.\n- **Lungs**: Clear to auscultation (Lower likelihood of PE/Pneumonia).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The combination of **Relative Hypertension** (SBP > 20-40mmHg above baseline), **Bradycardia**, and **Headache** in a T4 SCI patient is diagnostic of **Autonomic Dysreflexia (AD)**.',
    ),
    const Section(
      title: '+ Explain the Pathophysiology of the Bradycardia in this syndrome.',
      content: 'A noxious stimulus below the lesion triggers a massive **Sympathetic Surge** (Vasoconstriction -> Hypertension). \n- The Baroreceptors in the carotid/aortic arch detect the high BP and signal the Vagus Nerve to increase parasympathetic output to the heart.\n- Result: **Parasympathetic Bradycardia** attempts to compensate for the Sympathetic Hypertension.',
    ),
    const Section(
      title: '+ Outline your Stepwise Management Algorithm.',
      content: '1.  **Immediate Actions**: Sit the patient **UP** (induce orthostatic hypotension). Loosen tight clothing/abdominal binder.\n2.  **Source Control**: Check urinary drainage (unkink foley / straight cath). If negative, check for fecal impaction (with lidocaine jelly to avoid worsening stimulus).\n3.  **Pharmacology**: If SBP remains >150 after mechanical measures:\n    - **Nitropaste 1 inch** (topical - can be wiped off if BP crashes).\n    - **Nifedipine 10mg** (Immediate Release - \'Bite and Swallow\') or **Captopril 25mg**.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You order the nurse to check for fecal impaction. The nurse refuses: \'That is not my job. I\'m not doing a rectal exam. You can wait for the aide.\'',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The patient\'s BP is now 170/100 and she is complaining of blurred vision (Risk of Retinal Hemorrhage/Stroke).',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Manage this refusal of care in a hypertensive emergency.',
    ),
    const Section(
      title: '+ Your response:',
      content: 'I would prioritize **Patient Safety** over hierarchy.\nResponse: \'I understand this is an unpleasant task, but this patient is in a Hypertensive Emergency. Delaying care puts her at risk for Stroke or Seizure *right now*. \n- **Step 1 (Direct Order)**: I am giving a direct medical order to perform this safety check immediately.\n- **Step 2 (Escalation)**: If you refuse, I will call the Charge Nurse/House Supervisor to document this refusal of emergency care.\n- **Step 3 (Physician Action)**: **I will perform the exam myself immediately**. The patient\'s life comes first. We will discuss the chain of command and professional responsibilities after she is safe.\'',
    ),
  ],
);
