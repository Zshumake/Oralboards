import '../../models/case_model.dart';

const caseHandclumsiness = CaseModel(
  id: 'handclumsiness',
  title: 'Central Cord Syndrome (SCI)',
  url: 'https://www.pmrrecap.com/handclumsiness',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 68-year-old male presents with \'clumsy hands\' and difficulty walking after a hyperextension injury (fall forward striking his chin). He has a history of Cervical Stenosis.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In an elderly patient with a fall, this is **Central Cord Syndrome (CCS)** until proven otherwise.\n- **Mechanism**: Hyperextension in a stenotic canal -> pinches the cord centrally.\n- **Symptoms**: **\'Man in a Barrel\'** presentation.\n    - **Upper Extremities**: Severe weakness (LMN signs at level, UMN below).\n    - **Lower Extremities**: Mild weakness or spasticity (often can walk).\n    - **Sensory**: Variable sensory loss below the level.\n    - **Bladder**: Urinary retention is common initially.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Motor**: \n    - Deltoids/Biceps: 4/5.\n    - **Hands (Intrinsics)**: 1/5 (Corticospinal tracts to hands are medial/central -> Most affected).\n    - Legs (Quads/PF): 4+/5 (Lumbar tracts are lateral -> Spared).\n- **Sensory**: Decreased pinprick in hands (\'Cape-like\' distribution if syrinx, but here it\'s edema).\n- **Reflexes**: Hyperreflexic in legs (Babinski +), Hyporeflexic in arms (at level).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical picture of **Hands > Legs weakness** following hyperextension confirms **Central Cord Syndrome**.',
    ),
    const Section(
      title: '+ An MRI shows C3-C4 cord edema and stenosis but no fracture. Neurosurgery declines surgery initially. 24 hours later, his hand strength drops to 0/5. What is the management?',
      content: '**Urgent Surgical Decompression**.\n- **Guideline**: While CCS was historically treated conservatively, modern evidence (STASCIS trial rationale) supports **Early Decompression (<24 hours)** for patients with *progressive* neurologic deficit or continuing compression.\n- **Goal**: Prevent secondary ischemia and permanent hand paralysis.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'He undergoes C3-C4 ACDF. He is now in rehab.',
    ),
    const Section(
      title: '+ Describe the expected Pattern of Recovery for Central Cord Syndrome.',
      content: '**\'Legs -> Bladder -> Hands\'**.\n1.  **Lower Extremities**: Recover first. Prognosis for ambulation is **Good** (>75% will walk).\n2.  **Bladder**: Control usually returns.\n3.  **Upper Extremities (Hands)**: Recover **LAST** and often **Incompletely**. Fine motor dexterity is the major long-term deficit.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You are prescribing a power wheelchair. Medicare denies it because he can walk 10 feet with a walker.',
    ),
    const Section(
      title: '+ How do you advocate for the chair based on \'MRADL\' criteria?',
      content: 'Medicare covers mobility devices for **Mobility-Related Activities of Daily Living (MRADLs)** (Toileting, Feeding, Dressing) *in the home*.\n- **Argument**: While he can *physically* walk 10 feet (Ambulation), his **Central Cord hands** prevent him from safely using a walker (Grip strength 1/5) or performing MRADLs safely. The chair is for **Safety** and acts as a platform for his ADLs, not just transport. Walking 10 feet is not \'functional household ambulation\'.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: He is frustrated. \'I can walk to the bathroom, but I can\'t unzip my pants or wipe myself. I feel useless. Why can\'t I just use my hands?\'',
    ),
    const Section(
      title: '+ Manage this frustration regarding the specific \'Hand\' deficit.',
      content: '1.  **Validate**: \'It is incredibly frustrating. In Central Cord injury, the hands are the last to wake up because those nerve fibers are right in the center of the swelling.\'\n2.  **Adaptive Strategy**: \'While we wait for the nerves to heal, we have tools to give you dignity back today. I will have OT give you a **zipper pull**, **elastic waistbands**, and a **toilet aid**. We don\'t stop rehab; we adapt so you can be independent *now* while we work on the cure.\'',
    ),
  ],
);
