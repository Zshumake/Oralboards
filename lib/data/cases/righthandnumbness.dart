import '../../models/case_model.dart';

const caseRighthandnumbness = CaseModel(
  id: 'righthandnumbness',
  title: 'Carpal Tunnel Syndrome (CTS)',
  url: 'https://www.pmrrecap.com/righthandnumbness',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 58-year-old female presents with 4 months of nocturnal right hand numbness. She reports waking up shaking her hand out (\'Flick Sign\') and dropping her coffee cup in the mornings.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating hand paresthesias, define the **Anatomic Distribution**:\n- **Median**: Thumb, Index, Middle, and lateral Ring finger. (Palmar cutaneous branch spares the palm).\n- **Ulnar**: Little finger and medial Ring finger.\n- **Radial**: Dorsum of the hand/thumb.\n- **C6 Radiculopathy**: Thumb/Index finger + Neck pain + Biceps weakness.\n- **Proximal Mimics**: Pronator Syndrome (forearm pain + palmar numbness).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Mild atrophy of the Right Thenar Eminence (Abductor Pollicis Brevis).\n- **Sensation**: Decreased light touch in digits 1-3. **Palm sensation is intact** (Palmar cutaneous branch passes *over* the tunnel).\n- **Provocative Tests**: \n    - **Phalen\'s**: Positive at 30 seconds.\n    - **Durkan\'s Compression**: Positive at 15 seconds (Most sensitive).\n    - **Tinel\'s**: Positive at the wrist.\n- **Motor**: Weakness (4/5) in Resisted Thumb Abduction (APB).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The classic splitting of the ring finger (lateral half numb), nocturnal symptoms, and preserved palmar sensation is diagnostic of **Carpal Tunnel Syndrome (CTS)**.',
    ),
    const Section(
      title: '+ You order an Ultrasound of the wrist. What findings support the diagnosis?',
      content: 'In CTS, the Median Nerve becomes swollen proximal to the compression.\n- **Cross-Sectional Area (CSA)**: Measurement > **12 mm²** (at the proximal carpal tunnel inlet) is highly sensitive and specific.',
    ),
    const Section(
      title: '+ You proceed to Electrodiagnostics (EMG/NCS) to grade the severity. Define the grades.',
      content: '1.  **Mild**: Sensory slowing only (Prolonged DSL / Decreased SNAP amplitude).\n2.  **Moderate**: Motor slowing (Prolonged Distal Motor Latency > 4.2ms).\n3.  **Severe**: Axonal loss (Fibrillations on EMG / Absent SNAPs / Low CMAP amplitude).',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'NCS confirms **Severe CTS** with active denervation (fibrillations) in the APB muscle.',
    ),
    const Section(
      title: '+ How does the finding of \'Severe\' disease change your management compared to Mild/Moderate?',
      content: 'For **Severe CTS** with axonal loss/thenar atrophy, conservative care (splinting/injections) is insufficient. \n- **Recommendation**: Early surgical referral for **Carpal Tunnel Release** is indicated to prevent permanent motor loss. Injections may provide temporary relief but delaying decompression risks irreversible atrophy.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The patient asks: \'Doc, I\'ve been a secretary typing on a keyboard for 30 years. My job definitely caused this. Can you sign these Workers Comp papers saying my typing caused my CTS?\'',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Address the patient\'s request regarding Causation.',
    ),
    const Section(
      title: '+ Your response:',
      content: 'I would answer based on Epidemiological Evidence, not assumption.\nResponse: \'I understand you feel your work is the cause, but I have to follow the medical evidence to be accurate on these legal forms. Large scale studies (like NIOSH) have consistently shown that **computer typing is NOT a strong risk factor** for Carpal Tunnel Syndrome. The strong risk factors are **forceful gripping, vibration, and high-repetition wrist deviation** (like meatpacking or assembly line work), as well as personal factors like diabetes or thyroid issues. I can state that you have CTS, but I cannot medically certify that typing *caused* it, as the science doesn\'t support that link.\'',
    ),
  ],
);
