import '../../models/case_model.dart';

const caseHeadaches = CaseModel(
  id: 'headaches',
  title: 'Intracranial Mass Lesion and Cancer Rehabilitation',
  url: 'https://www.pmrrecap.com/headaches',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 50-year-old female presents to your outpatient clinic evaluating a 6-month history of progressive, daily headaches. She describes the pain as bilateral and dull, but notes it is distinctly worse in the mornings and wakes her from sleep.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating chronic daily headaches, your history should screen for **Secondary Headache Red Flags (SNOOP10)**:\n- **Systemic Symptoms**: Fever, weight loss (suggesting malignancy or infection).\n- **Neurologic Signs**: Confusion, impaired alertness, or focal deficits.\n- **Onset**: Sudden onset (\'Thunderclap\') vs. progressive.\n- **Older Age**: New onset >50 years old.\n- **Pattern Change**: Significant change in existing headache phenotype or **Positional** worsening (e.g., worse when lying flat/sleeping, suggestive of increased intracranial pressure).\n- **Precipitating Factors**: Worsening with Valsalva (coughing, sneezing).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vital Signs**: Stable. BP 138/84.\n- **Cervical Spine**: Mild tenderness to palpation of the cervical paraspinals; however, ROM is preserved.\n- **Neurologic (Cranial Nerves)**: \n    - **Hearing**: The patient consistently turns her head to the left to hear you; she admits to subjective hearing loss in the right ear.\n    - **Facial Sensation**: Mildly diminished sensation to light touch in the right V1/V2 distribution (Trigeminal nerve).\n- **Balance**: Check for cerebellar signs (e.g., dysdiadochokinesia) or gait ataxia, given the hearing loss (CN VIII) involvement.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The patient returns 2 months after a trial of conservative therapy for \'cervicogenic headaches.\' Her symptoms have worsened. The clinical constellation of morning headaches, right-sided hearing loss (CN VIII), and facial numbness (CN V) localizes to the **Cerebellopontine Angle (CPA)**.',
    ),
    const Section(
      title: '+ Based on this progression and the \'SNOOP10\' criteria, what is your next diagnostic step?',
      content: 'I would order a **Gadolinium-enhanced MRI of the Brain and Internal Auditory Canals**. The presence of \'Red Flags\' (Age 50, progressive pattern, morning worsening) and focal cranial nerve deficits (CN V, VIII) necessitates neuroimaging to rule out an occupying mass lesion such as a Meningioma or Vestibular Schwannoma.',
    ),
    const Section(
      title: '+ The MRI reveals an enhancing extra-axial mass in the right CPA consistent with a Meningioma. Describe your immediate management.',
      content: '1.  **Disclosure**: Frame the diagnosis carefully, emphasizing that many meningiomas are benign (WHO Grade I) but require intervention due to their location.\n2.  **Referral**: Urgent consultation with **Neurosurgery** and **Radiation Oncology**.\n3.  **Steroids**: Initiation of **Dexamethasone** (with PPI prophylaxis) to reduce peritumoral edema if significant mass effect is present.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'Following resection, the patient has moderate ataxia and requires assistance for ADLs. You recommend Acute Inpatient Rehabilitation (ARU), but the Medical Director denies admission, citing \'Lack of Medical Complexity\'.',
    ),
    const Section(
      title: '+ Construct an argument for why a Skilled Nursing Facility (SNF) may be the appropriate level of care under CMS guidelines.',
      content: 'Under CMS guidelines, Inpatient Rehabilitation Facilities (IRF/ARU) are reserved for patients requiring:\n1.  **Intensive Therapy**: Tolerance of 3 hours/day of therapy.\n2.  **Close Medical Supervision**: Daily face-to-face physician management for complex medical issues (e.g., unstable vitals, complex wound care, active titration of multiple medications).\n\nIf this patient is medically stable (post-operative, afebrile, stable meds) and her primary barrier is functional (ataxia), she may not meet the \'Medical Necessity\' criteria for an ARU. A SNF can provide the necessary physical and occupational therapy at a lower intensity without the requirement for daily physician intervention.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: During a Telehealth follow-up at the SNF, you observe the patient in a soiled gown with a cluttered, dirty room. She states: \'I haven\'t seen a nurse in 6 hours. I can\'t get to the bathroom.\'',
    ),
    const Section(
      title: '+ Describe your obligations and actions as a Mandated Reporter.',
      content: 'As a physician, I am a **Mandated Reporter** for vulnerable adult abuse and neglect. My response would be:\n1.  **Immediate Safety**: Ask: \'Do you feel safe right now? Can you reach your call light?\' If there is imminent danger, I would call 911.\n2.  **Facility Escalation**: Immediately contact the **Director of Nursing** and the **Facility Administrator** to report the specific conditions (soiled gown, lack of response) and demand an immediate welfare check.\n3.  **External Reporting**: I would file a formal report with the state\'s **Department of Public Health (DPH)** and contact the **Long-Term Care Ombudsman** to investigate the facility\'s failure to provide standard care. Neglect is not a \'customer service\' issue; it is a reportable safety violation.',
    ),
  ],
);
