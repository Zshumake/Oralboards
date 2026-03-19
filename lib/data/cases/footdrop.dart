import '../../models/case_model.dart';

const caseFootdrop = CaseModel(
  id: 'footdrop',
  title: 'Common Fibular Neuropathy secondary to Intraneural Ganglion Cyst',
  url: 'https://www.pmrrecap.com/footdrop',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 45-year-old male presents for evaluation of a 1-week history of right-sided foot drop and lateral calf pain. He reports that the symptoms developed gradually after a week-long hiking and camping excursion in rugged terrain.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In assessing acute foot drop, your evaluation should prioritize the following:\n- **Temporal Evolution**: Onset (sudden vs. gradual) and progression of motor deficit.\n- **Pain Characterization**: Localization of pain (e.g., lumbar spine, hip, or fibular head) and presence of neuropathic qualities (burning, tingling).\n- **Neurological Review**: Changes in bowel/bladder function, saddle anesthesia, or systemic symptoms (fever, weight loss).\n- **Vocational/Avocational Activity**: Recent high-mileage ambulation, kneeling, or weight loss (which may predispose to compression at the fibular head).\n- **Etiological Screening**: History of peripheral vascular disease, diabetes, or previous nerve injuries.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Neurological (Motor)**: \n    - **Strength**: Right ankle dorsiflexion (Tibialis Anterior) 3/5; Great toe extension (EHL) 3/5; Foot eversion (Peroneals) 4/5.\n    - **Localization Check**: **Tibialis Posterior (Inversion)** strength is 5/5 bilaterally. Hamstring strength (specifically common peroneal-innervated Biceps Femoris short head) is 5/5.\n- **Neurological (Sensory)**: Diminished light touch and pinprick sensation over the lateral leg and the dorsal aspect of the right foot. Sensation in the first dorsal webspace is significantly impaired.\n- **Reflexes**: Patellar and Achilles reflexes are 2+ and symmetric bilaterally. No Upper Motor Neuron (UMN) signs noted.\n- **MSK/Palpation**: Positive Tinel’s sign at the right fibular head. A firm, minimally mobile mass is palpated posterior to the fibular neck.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical finding of foot drop with preserved inversion (Tibialis Posterior) and symmetric reflexes effectively localizes the lesion distal to the L5 nerve root and the lumbosacral plexus, pointing toward a common fibular (peroneal) neuropathy.',
    ),
    const Section(
      title: '+ Provide a structured differential diagnosis for this presentation.',
      content: '1.  **Common Fibular Neuropathy at the Fibular Head**: Likely secondary to external compression or an internal mass (e.g., ganglion cyst).\n2.  **L5 Radiculopathy**: Though less likely given the preserved inversion and normal reflexes.\n3.  **Lumbosacral Plexopathy**: Specifically involving the lateral cord.\n4.  **Sciatic Neuropathy**: Involving the common fibular division (e.g., at the level of the sciatic notch or piriformis).\n5.  **Anterior Compartment Syndrome**: Although usually associated with severe pain and metabolic compromise.',
    ),
    const Section(
      title: '+ Formulate the appropriate diagnostic workup for this acute presentation.',
      content: '1.  **Imaging**: **Duplex Ultrasound of the Fibular Head** to evaluate for structural compression. MRI of the right knee/leg may be indicated for surgical planning.\n2.  **Electrodiagnostic (EDX) Studies**: Though performable now to establish a baseline, the definitive utility for axonal loss (fibrillations) requires waiting **21 days post-injury**. Early NCS may show **conduction block** or slowed velocity across the fibular head.\n3.  **Radiography**: AP/Lateral X-rays of the knee to rule out bony exostosis or fractures.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'Ultrasound reveals a 2.5cm anechoic, multiloculated mass communicating with the superior tibiofibular joint, effacing the common fibular nerve. This is consistent with an intraneural ganglion cyst.',
    ),
    const Section(
      title: '+ Describe the definitive management and prognostic counseling for this condition.',
      content: '1.  **Decompression**: Prompt **ultrasound-guided aspiration** or surgical excision is indicated to relieve mechanical pressure. Many clinicians advocate for corticosteroid injection into the cyst cavity post-aspiration to reduce recurrence.\n2.  **Functional Support**: Provision of a **Solid or Leaf-Spring Ankle-Foot Orthosis (AFO)** to stabilize the gait and prevent falls secondary to foot-clearance deficits.\n3.  **Prognostic Counseling**: If the mechanism is purely compressive (**Neuropraxia**), recovery is often rapid (weeks). However, if axonal damage has occurred, recovery depends on regeneration at a rate of approximately **1 inch (1-2mm) per month**. Comprehensive recovery may take 6–12 months.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You are paged on a Friday afternoon. Your clinic\'s ultrasound machine is undergoing maintenance, and the local interventional radiology suite is closed for the weekend.',
    ),
    const Section(
      title: '+ How do you demonstrate a \'Duty of Care\' in coordinating this time-sensitive neurological emergency?',
      content: 'I would facilitate an immediate higher-level referral:\n1.  **Urgent Referral**: Coordinate with the on-call Neurosurgery or Orthopedic Surgery team at the nearest tertiary trauma center for emergency evaluation/decompression.\n2.  **Care Coordination**: Personally contact the receiving attending to relay the clinical urgency (\'Time is Nerve\') and the ultrasound findings of nerve effacement.\n3.  **Patient Safety**: Ensure the patient is provided with a temporary \'off-the-shelf\' AFO or bracing to ensure safe ambulation until the procedure is performed.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: Two weeks after the procedure, the patient calls, sounding distressed: \'My foot is still weak and I have a huge bill from the ER. You said you\'d fix me, but I\'m no better and I\'m out \$2,000.\'',
    ),
    const Section(
      title: '+ Provide a professional response that manages expectations while validating the patient\'s experience.',
      content: 'I would respond: \'I hear your frustration, and I understand how discouraging it is to still be experiencing weakness after the procedure. To address the healing process: while we have successfully removed the \'source\' of the pressure (the cyst), the nerve itself requires time to biologicaly recover from the injury it sustained. Think of it like a kink in a hose—even after you straighten the hose, it takes time for the water to reach the end. Biological nerve regrowth is a slow process, moving at only about one inch per month. Our immediate priority is to ensure you can walk safely using the AFO we provided while we monitor for signals of nerve recovery. I want to see you in 2 weeks for a repeat physical exam and potentially schedule a detailed nerve test (EMG) to track that progress objectively.\'',
    ),
  ],
);
