import '../../models/case_model.dart';

const caseWorkaccident = CaseModel(
  id: 'workaccident',
  title: 'Prosthetics (Upper Limb Amputation)',
  url: 'https://www.pmrrecap.com/workaccident',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 35-year-old construction worker presents to clinic. 4 weeks ago, he suffered a traumatic crushing injury to his right forearm, requiring a Transradial Amputation. He is right-hand dominant and desperate to get back to work.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In upper limb amputation, the **Vocational Goals** drive the prescription.\n- **Job Demands**: Heavy lifting? Dust/dirt exposure? Fine motor?\n- **Dominance**: Was it the dominant hand? (transfer of dominance takes time).\n- **ADLs**: Can he feed/dress himself with the left hand?\n- **Pain**: Screen for Phantom Limb Pain vs. Neuroma.\n- **Golden Window**: It has been 4 weeks. We must fit him **NOW**.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Residual Limb**: Well-healed, cylindrical shape. Length is mid-forearm (ideal). No bony prominence.\n- **ROM**: Full Elbow flexion/extension.\n- **Strength**: Good pronation/supination intact.\n- **Contralateral Limb**: Check for signs of overuse (Carpal tunnel, rotator cuff tenderness) as he is one-handed.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'He requests a \'Robotic Hand\' (Myoelectric) because it looks real. However, he works in a dusty environment lifting heavy beams.',
    ),
    const Section(
      title: '+ Compare Body-Powered vs. Myoelectric for this specific patient.',
      content: 'For a **Heavy Duty Construction Worker**, a **Body-Powered** system is superior:\n1.  **Body-Powered (Cable)**: **Durable** (can take a beating), **Proprioception** (can feel tension on the cable), **Lighter**, and field-repairable.\n2.  **Myoelectric**: **Fragile** (dust/dirt can damage motors), **Heavy**, and requires charging. Battery usually lasts 1 day. Better for office work/cosmesis.',
    ),
    const Section(
      title: '+ Prescribe the specific components.',
      content: '1.  **Socket**: Supracondylar suspension (self-suspending).\n2.  **Control**: Figure-of-8 Harness (Cable control).\n3.  **Terminal Device**: **Voluntary Opening (VO) Split Hook**.\n    - *Why a Hook?* It allows fine precision (holding a nail) and visualizing the object, which a prosthetic hand blocks. It is also durable for tools.\n    - *Compromise*: Prescribe a **Myoelectric Hand** as a secondary device for social events (Church/Dinner).',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'He is fitted within 30 days (\'Golden Window\'). 3 months later, he complains of Left Shoulder pain (the uninjured side).',
    ),
    const Section(
      title: '+ Diagnosis and Pathophysiology?',
      content: '**Overuse Syndrome** of the Intact Limb.\n- **Mechanism**: The sound limb performs 100% of ADLs plus assists the prosthetic limb. \n- **Management**: This is arguably MORE important than the amputation rehab. If his \'good\' arm fails, he is totally dependent.\n- **Rx**: OT for joint conservation, and ensure the prosthesis is actually functional (so he uses it).',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: He looks at the Hook device and says: \'I look like Captain Hook. I can\'t wear this in public. People will stare.\'',
    ),
    const Section(
      title: '+ Address this Body Image conflict.',
      content: '1.  **Acknowledge**: \'I hear you. The hook is amazing for work, but it stands out socially.\'\n2.  **The \'Tool\' Metaphor**: \'Think of the hook like a specialized tool, a wrench or a hammer. You use it to get the job done. But you don\'t wear your toolbelt to dinner.\'\n3.  **Solution**: \'That is why we will try to get you a **Passive Cosmetic Hand** or a Myoelectric hand for social situations, so you feel confident in public, while staying safe at work.\'',
    ),
  ],
);
