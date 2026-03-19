import '../../models/case_model.dart';

const caseLeftlowerextremitypain = CaseModel(
  id: 'leftlowerextremitypain',
  title: 'Subacute Lumbar Radiculopathy',
  url: 'https://www.pmrrecap.com/leftlowerextremitypain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 42-year-old male presents with a 4-week history of subacute low back pain radiating into the left lateral thigh and calf. He denies any inciting trauma.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating lumbar radicular pain, your history should focus on:\n- **Dermatomal Distribution**: Does the pain radiate past the knee? (L5 radiating to the dorsum of the foot vs. L4 to the medial malleolus).\n- **Red Flag Screening (Cauda Equina)**: Bowel/bladder incontinence, saddle anesthesia, or progressive bilateral weakness.\n- **Positional Factors**: Flexion intolerance (Discogenic) vs. Extension intolerance (Stenosis/Facet).\n- **Systemic Signs**: History of cancer, unremitting night pain, or fever.\n- **Functional Impact**: Difficulty with heel walking (L5) vs. toe walking (S1).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Gait**: Antalgic. Unable to perform left heel-walk.\n- **Neurologic (Motor)**: \n    - **L5**: Tibialis Anterior (Dorsiflexion) 4/5; Extensor Hallucis Longus (Gt Toe Ext) 4/5.\n    - **Localization Key**: **Gluteus Medius (Hip Abduction)** is 4-/5. Posterior Tibialis (Inversion) is 5/5.\n- **Neurologic (Sensory)**: Diminished sensation in the L5 dermatome (lateral calf and first dorsal webspace).\n- **Provocative Maneuvers**: \n    - **Straight Leg Raise**: Positive on the left at 45 degrees.\n    - **FABER/FADIR**: Negative for hip pathology.\n- **Non-Organic Signs**: Negative Waddell\'s signs.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical picture of dermatomal pain radiating below the knee with myotomal weakness in L5-innervated muscles (Tibialis Anterior, EHL, Gluteus Medius) is consistent with an **L5 Radiculopathy**.',
    ),
    const Section(
      title: '+ Explain the significance of the Gluteus Medius weakness in your differential diagnosis.',
      content: 'Gluteus Medius weakness (Trendelenburg sign) is the **key differentiator** between an **L5 Radiculopathy** and a **Common Peroneal Neuropathy**. \n- The Gluteus Medius is innervated by the **Superior Gluteal Nerve**, which arises from the L5/S1 nerve roots *proximal* to the sciatic/peroneal division. \n- A peroneal nerve injury at the knee would cause foot drop but would *spare* the hip abductors. Its involvement here confirms the lesion is at the root/plexus level.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'The patient has 4-/5 weakness (not paralyzed) and manageable pain. He asks for an MRI.',
    ),
    const Section(
      title: '+ Describe your management strategy regarding imaging and treatment.',
      content: '1.  **Imaging (The 6-Week Rule)**: In the absence of \'Red Flags\' (Cauda Equina, profound/progressive weakness, infection), MRI is **not indicated** in the first 6 weeks. The natural history of lumbar disc herniation is favorable, with 90% resolving with conservative care.\n2.  **Conservative Care**: Initiate a 6-week course of physical therapy (directional preference/McKenzie method), NSAIDs, and activity modification.\n3.  **Progression**: If symptoms persist beyond 6 weeks or neurologic deficits worsen, MRI and/or Epidural Steroid Injections (ESI) become indicated.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'Six weeks later, the patient has not improved. You order an EMG/NCS before the MRI. The patient is upset: \'Why am I paying for a nerve test? Just scan my back!\'',
    ),
    const Section(
      title: '+ Justify the medical necessity of Electrodiagnostics (EMG) prior to or alongside MRI.',
      content: 'I would explain: \'MRI is an **anatomic** test—it shows us what the spine *looks* like. However, many people have disc bulges that are completely painless (false positives). The EMG is a **physiologic** test—it tells us how the nerves are *function*. \n- By doing the EMG, we confirm that the disc bulge we see on MRI is actually the one causing your weakness.\n- Furthermore, it rules out mimic conditions (like a pinched nerve at the knee) that an MRI of the back would miss completely. This ensures we don\'t operate on the wrong level.\'',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'The EMG confirms active L5 denervation. The patient demands surgery immediately. \'I\'m done with therapy. Cut it out.\' However, the surgeon deems him a poor candidate due to morbid obesity and uncontrolled diabetes (A1c 11.0).',
    ),
    const Section(
      title: '+ How do you counsel the patient regarding surgical risk optimization?',
      content: 'I would respond: \'I completely understand your desire for a quick fix, but surgery right now carries extreme risks. With an A1c of 11.0, your risk of a **post-operative wound infection** or failed fusion is exceptionally high. No ethical surgeon will operate until your body is safe to heal. This isn\'t a \'no\' forever; it\'s a \'not yet.\' We need to use this time to aggressively manage your diabetes and continue non-operative pain management (like injections) so that if you *do* eventually need surgery, you will survive it and have a successful outcome.\'',
    ),
  ],
);
