import '../../models/case_model.dart';

const caseRightkneepain = CaseModel(
  id: 'rightkneepain',
  title: 'Knee Osteoarthritis & Meniscal Pathology',
  url: 'https://www.pmrrecap.com/rightkneepain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 60-year-old male presents with 3 months of worsening right knee pain, particularly when walking down stairs. He reports intermittent swelling and a \'grinding\' sensation.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating the older adult knee, distinguish **Mechanical** vs. **Inflammatory** pain:\n- **Mechanical**: Worsens with activity, \'locking\' or \'catching\' (Meniscal tear), \'giving way\' (Instability/Weakness).\n- **Inflammatory**: Morning stiffness > 30 mins, warmth, redness (Rheumatoid/Gout).\n- **Location**: Medial (common OA), Anterior (Patellofemoral), Lateral.\n- **Risk Factors**: Previous trauma, obesity, occupation (kneeling/squatting).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Mild varus deformity (Bow-legged) and small effusion.\n- **Palpation**: Medial Joint Line tenderness. Crepitus with localized flexion/extension.\n- **ROM**: 0-120 degrees, painful at end-range flexion.\n- **Special Tests**:\n    - **Thessaly\'s**: Positive for medial pain (Meniscal provocation).\n    - **McMurray\'s**: Positive click/pain medial joint line.\n    - **Ligaments**: Lachman/Varus/Valgus are stable.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The combination of age, mechanical symptoms, measuring joint line tenderness, and crepitus suggests **Medial Compartment Osteoarthritis** with a likely **Degenerative Meniscus Tear**.',
    ),
    const Section(
      title: '+ You order X-rays. Describe the Kellgren-Lawrence (K-L) Grading System.',
      content: '- **Grade 1**: Doubtful narrowing, possible osteophytes.\n- **Grade 2**: **Definite osteophytes**, possible narrowing. (This is the diagnostic threshold for OA).\n- **Grade 3**: Moderate narrowing, multiple osteophytes, sclerosis.\n- **Grade 4**: Large osteophytes, **severe narrowing (bone-on-bone)**, deformity.',
    ),
    const Section(
      title: '+ MRI confirms a \'Horizontal Cleavage Tear\' of the Medial Meniscus. The patient asks for a \'clean out\' surgery (Arthroscopy). How do you counsel him?',
      content: 'I would advise **AGAINST** arthroscopy.\n- **Evidence**: The **METEOR Trial** (and others) showed that for *Degenerative* Meniscal Tears in the setting of OA, Arthroscopy with Partial Meniscectomy provides **NO long-term benefit** over Physical Therapy alone and may accelerate OA progression. \n- **Indication for Surgery**: True \'Mechanical Block\' (Locked knee) from a displaced bucket-handle tear.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You proceed with conservative management. He asks about injections.',
    ),
    const Section(
      title: '+ Compare Corticosteroid vs. Hyaluronic Acid (Viscosupplementation) injections.',
      content: '- **Corticosteroids**: Rapid onset (days), short duration (weeks). Best for acute inflammatory flares/effusions. Risk of cartilage toxicity with frequent use.\n- **Hyaluronic Acid**: Slower onset (weeks), longer duration (months). Acts as a lubricant/shock absorber. Best for mild-moderate OA (K-L 2-3) without acute inflammation.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The patient is scheduled for a Partial Colectomy next month. He asks: \'Can I just get my Knee Replacement done the same week since I\'ll be off work anyway?\'',
    ),
    const Section(
      title: '+ Recommmendation:',
      content: '**ABSOLUTELY NOT**. \n- **Perioperative Risk**: Elective Arthroplasty (TKA) is contraindicated in the setting of recent or concurrent abdominal surgery due to the high risk of **hematogenous seeding** (translocation of gut bacteria) causing a Periprosthetic Joint Infection (PJI). \n- **Timeline**: He must wait until fully recovered from the colectomy (typically 3-6 months) before elective orthopedic surgery.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'The patient is frustrated with his pain. \'PT is a waste of time. My wife has Oxycodone for her back, and I took one and it helped. Just write me a script for like 30 of those so I can function.\'',
    ),
    const Section(
      title: '+ Manage this request for Opioids.',
      content: 'I would firmly adhere to Opioid Stewardship guidelines.\nResponse: \'I\'m glad you found relief, but I cannot prescribe Oxycodone for this. \n1.  **Safety**: Taking medication prescribed to others is unsafe and illegal.\n2.  **Standards**: Guidelines are clear that **Opioids are NOT indicated** for Osteoarthritis as they actually worsen pain over time (Hyperalgesia) and carry addiction risk. \n3.  **Plan**: We will use safer, effective options: Topical NSAIDs (Voltaren), Cymbalta (blocks nerve pain), or injections. I want to treat your pain, but I must do it safely.\'',
    ),
  ],
);
