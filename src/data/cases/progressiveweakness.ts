import type { Case } from '../../types/case';

export const case_progressiveweakness: Case = {
  "id": "progressiveweakness",
  "title": "Dermatomyositis & Inflammatory Myopathy",
  "url": "https://www.pmrrecap.com/progressiveweakness",
  "sections": [
    {
      "title": "Initial Presentation",
      "content": "A 46-year-old female presents with subacute, progressive proximal weakness over 3 months. She reports difficulty rising from a chair, combing her hair, and carrying groceries. She denies fevers, but notes a 'sunburn-like' rash on her eyelids and knuckles."
    },
    {
      "title": "History & Systems Review:",
      "content": "In assessing proximal weakness, differentiate **Myopathy** (Muscle) from **Neuropathy** (Nerve):\n- **Distribution**: Proximal > Distal suggests Myopathy. (Distal > Proximal suggests Neuropathy).\n- **Sensation**: Myopathies are strictly motor (no numbness/tingling).\n- **Pain**: Polymyositis/DM are often *painless* or have mild soreness. Severe pain suggests Polymyalgia Rheumatica (PMR) or Viral Myositis.\n- **Cutaneous**: Heliotrope rash (violaceous eyelids), Gottron's Papules (knuckles), or Shawl Sign (V-neck rash).\n- **Systemic**: Dysphagia (esophageal muscle), Dyspnea (Interstitial Lung Disease), or Raynaud's phenomenon."
    },
    {
      "title": "Physical Examination Findings:",
      "content": "- **Skin**: Faint violet discoloration of the upper eyelids and scaly erythematous papules over the MCP joints.\n- **Motor**: \n    - Deltoids/Biceps: 4/5.\n    - Hip Flexors/Quads: 3+/5.\n    - Distal strength (Grip, Ankle): 5/5.\n- **Functional**: Positive Gower's Sign (uses hands to push off thighs when standing).\n- **Reflexes**: 2+ and symmetric (Preserved in myopathy, lost in neuropathy)."
    },
    {
      "title": "DOMAIN B: PROBLEM SOLVING",
      "content": "The combination of proximal weakness, preserved reflexes, and specific cutaneous findings (Heliotrope, Gottron's) is diagnostic of **Dermatomyositis (DM)**."
    },
    {
      "title": "+ Diagnostic Findings Return: CPK is 4,500. EMG shows 'Early Recruitment of short-duration, small-amplitude MUAPs' with fibrillations. Muscle Biopsy shows 'Perifascicular Atrophy'.",
      "content": "**Pathology Correlate**: \n- **Dermatomyositis**: Perifascicular Atrophy + Perimysial inflammation (CD4+ T-cells). \n- *(Contrast with Polymyositis: Endomysial inflammation/CD8+ T-cells)*."
    },
    {
      "title": "+ With a diagnosis of Dermatomyositis confirmed, what is your most critical Next Step in management?",
      "content": "**Malignancy Screening**. \nAdult-onset Dermatomyositis has a strong paraneoplastic association (Ovarian, Lung, GI, Breast). \n- **Workup**: CT Chest/Abdomen/Pelvis, age-appropriate cancer screening (Mammogram, PAP, Colonoscopy), and consideration of specific antibodies (Anti-TIF1-gamma associated with cancer)."
    },
    {
      "title": "DOMAIN C: PATIENT MANAGEMENT",
      "content": "You treat her with high-dose Prednisone. Her CPK normalizes (drops to 200), but 2 months later, she returns complaining that her legs feel *weaker* and she can no longer climb stairs."
    },
    {
      "title": "+ Differentiate between a 'Disease Flare' and 'Steroid Myopathy'.",
      "content": "- **Steroid Myopathy**: Normal CPK + Worsening Proximal Weakness (Type 2 fiber atrophy). \n- **Flare**: Elevated CPK + Worsening Weakness.\n*Action*: Since her CPK is normal, this is Steroid Myopathy. We must **taper steroids** rapidly and switch to a steroid-sparing agent (Methotrexate/Azathioprine)."
    },
    {
      "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
      "content": "You recommend starting Methotrexate to spare steroids. She refuses: 'That's a chemotherapy drug! I don't have cancer! I'm not taking poison.'"
    },
    {
      "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
      "content": "Role-play your counseling to address her fear of the medication label."
    },
    {
      "title": "+ Your response:",
      "content": "I would de-escalate her fear by framing the dosage.\nResponse: 'I completely understand your reaction—seeing that label is scary. While Methotrexate is used in high doses for cancer to kill cells, we use it in **tiny, once-a-week doses** as an 'Immunomodulator' to gently calm down the immune system that is attacking your muscles. In this low dose, it acts like a dimmer switch for inflammation, not a poison. It allows us to get you off the steroids, which cause the bone loss and skin thinning you want to avoid. We will monitor your labs closely to ensure it stays safe.'"
    }
  ]
};
