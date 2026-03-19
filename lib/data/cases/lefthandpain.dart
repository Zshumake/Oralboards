import '../../models/case_model.dart';

const caseLefthandpain = CaseModel(
  id: 'lefthandpain',
  title: 'Complex Regional Pain Syndrome (CRPS) Type I',
  url: 'https://www.pmrrecap.com/lefthandpain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 27-year-old female presents with chronic, intractable left hand pain. Two years ago, she sustained a left scaphoid fracture (treated with ORIF) after dropping a weight. Although the fracture has healed, she reports progressive burning pain, swelling, and extreme sensitivity to touch that has prevented her from returning to work as a chef.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating suspected neuropathic pain syndromes, your history should screen for the four symptom categories of the **Budapest Criteria**:\n- **Sensory**: Hyperesthesia (increased sensitivity) and Allodynia (pain to non-painful stimuli).\n- **Vasomotor**: Temperature asymmetry (hot/cold) and skin color changes.\n- **Sudomotor/Edema**: Asymmetric sweating or edema.\n- **Motor/Trophic**: Decreased range of motion, weakness, or trophic changes (hair/nail growth abnormalities).\n- **Etiology**: Differentiating Type I (no nerve lesion) vs. Type II (known nerve lesion).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: The left hand is erythematous and edematous compared to the right. There is glossy skin texture and coarse hair growth on the dorsum of the hand.\n- **Palpation**: Significant **mechanical allodynia**; the patient withdraws from light touch (cotton swab).\n- **Temperature**: The left hand is palpably cooler than the right (Vasomotor instability).\n- **Range of Motion**: Global restriction in finger flexion/extension due to pain and edema.\n- **Neurologic**: No specific dermatomal sensory deficit (ruling out radiculopathy or peripheral nerve entrapment).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical presentation meets the **Budapest Clinical Criteria** for Complex Regional Pain Syndrome (CRPS) Type I (formerly RSD).',
    ),
    const Section(
      title: '+ What diagnostic studies would support this diagnosis and rule out mimics?',
      content: '1.  **Triple Phase Bone Scan**: May show diffuse uptake in the delayed (mineralization) phase in the affected carpal bones.\n2.  **Plain Radiographs**: Evaluation for patchy osteopenia (**Sudeck\'s Atrophy**).\n3.  **Electrodiagnostic Studies (EMG/NCS)**: To rule out CRPS Type II (e.g., Median or Radial neuropathy) or cervical radiculopathy.\n4.  **Inflammatory Markers (ESR/CRP)**: To rule out infectious or rheumatologic processes.',
    ),
    const Section(
      title: '+ Describe your comprehensive management plan for this patient.',
      content: '1.  **Pharmacologic**: \'Neuropathic Ladder\' including Gabapentin/Pregabalin, TCAs (Amitriptyline), or SNRIs (Duloxetine). Topical Lidocaine/Capsaicin for allodynia.\n2.  **Rehabilitation (The Cornerstone)**: \n    - **Desensitization**: Texture rubbing protocols.\n    - **Graded Motor Imagery (GMI)**: A sequential program of (1) Laterality Reconstruction (Left/Right discrimination), (2) Motor Imagery, and (3) Mirror Therapy to re-map the cortical representation.\n    - **Edema Control**: Compression garments and active ROM.\n3.  **Psychological**: CBT for coping mechanisms and pain catastrophizing.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'The patient fails conservative management and pharmacotherapy. Her pain remains 8/10.',
    ),
    const Section(
      title: '+ What is the next step in the \'Interventional Ladder\'?',
      content: 'I would refer for a **Sympathetic Nerve Block** (Stellate Ganglion Block for the upper extremity). This serves both diagnostic (is the pain sympathetically maintained?) and therapeutic purposes. \n\n*Clinical Clue*: If she responds well but pain returns, she may be a candidate for **Neuromodulation** (Spinal Cord Stimulation or Dorsal Root Ganglion Stimulation).',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The patient returns, frustrated. She states: \'I can\'t work. I\'m chef and I can\'t even hold a knife. I need you to sign this form declaring me **permanently disabled** so I can get my payout.\'',
    ),
    const Section(
      title: '+ How do you manage this request for permanent disability?',
      content: 'I would explain the concept of **Maximum Medical Improvement (MMI)**. \nresponse: \'I completely agree that *currently* you are unable to work as a chef due to your pain capability. I am happy to write for **temporary total disability** to support you while we treat this. However, we have not yet exhausted our treatment options (e.g., Neuromodulation). Declaring \'permanent\' disability means we imply you will *never* get better, and I still have hope for your recovery. Let\'s focus on the next treatment step to get function back, rather than closing the door on your career today.\'',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: The patient becomes enraged at your refusal to sign for permanent disability. She screams: \'You\'re useless! You\'re just trying to save the insurance company money! I\'m not leaving until you sign this!\'',
    ),
    const Section(
      title: '+ Demonstrate how to de-escalate this hostile encounter.',
      content: 'I would maintain a calm, non-confrontational posture and sit down (if safe) to lower the energy. \nResponse: \'I can see how angry and desperate you are, and I want you to know I am on your team, not the insurance company\'s. My refusal isn\'t about money; it\'s about my medical belief that you still have potential to heal. Non-maleficence means I cannot sign a document I believe is medically inaccurate. \n\nHowever, if you feel our relationship is fractured, I respect your right to a second opinion. I cannot sign this form today. If you are refusing to leave, I will have to ask security to escort you out for the safety of the clinic, but I would prefer we end this visit calmly. I will provide you with a referral to a colleague for a fresh perspective.\'',
    ),
  ],
);
