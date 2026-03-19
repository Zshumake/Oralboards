import '../../models/case_model.dart';

const caseBurninghandpain = CaseModel(
  id: 'burninghandpain',
  title: 'Complex Regional Pain Syndrome (CRPS Type 1)',
  url: 'https://www.pmrrecap.com/burninghandpain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 45-year-old female presents with severe, burning pain in her right hand. Six weeks ago, she suffered a distal radius fracture (Colles Fracture) which was treated with casting. The cast was removed 1 week ago, but she reports the hand is now \'on fire\', swollen, and turns red when hanging down.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'Suspect **CRPS Type 1** (Reflex Sympathetic Dystrophy) after trauma.\n- **Pain Quality**: Burning, throbbing, or shooting? (Neuropathic).\n- **Allodynia**: Does light touch (clothing/wind) cause pain?\n- **Autonomic**: Changes in color (red/blue), temperature (hot/cold), or sweating?\n- **Trophic**: Rapid nail growth? Hair changes?\n- **Red Flag**: Rule out **Acute Infection** (Cellulitis/Osteomyelitis) or **DVT**.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Right hand is edematous and erythematous compared to the left. nails are brittle.\n- **Palpation**: Hand is warm (+2 degrees vs left). Extreme allodynia to light touch.\n- **Motor**: Weakness due to pain. Tremor present.\n- **ROM**: Decreased active ROM in fingers due to edema.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The constellation of burning pain, autonomic dysfunction, and trophic changes post-fracture meets the **Budapest Criteria** for CRPS.',
    ),
    const Section(
      title: '+ Define the \'Budapest Criteria\' for clinical diagnosis.',
      content: 'Diagnosing CRPS requires **Continuing Pain disproportionate to the event** PLUS:\n1.  **Sensory**: Hyperesthesia/Allodynia.\n2.  **Vasomotor**: Temperature/Color asymmetry.\n3.  **Sudomotor/Edema**: Sweating asymmetry or Edema.\n4.  **Motor/Trophic**: Decreased ROM, weakness, tremor, or nail/hair changes.\n*Must have at least 1 symptom in 3/4 categories and 1 sign in 2/4 categories.*',
    ),
    const Section(
      title: '+ You suspect CRPS. Is a Triple Phase Bone Scan useful?',
      content: '**Yes**, but timing matters.\n- **Acute Phase (<6 months)**: Highly sensitive. Shows diffuse uptake in the perfusion, blood pool, and delayed phases (periarticular uptake).\n- **Chronic Phase**: May be normal or show decreased uptake (\'Cold\' CRPS).',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You initiate management: \'Desensitization\' physical therapy and Medications.',
    ),
    const Section(
      title: '+ Describe \'Desensitization Protocol\' and Medical options.',
      content: '1.  **Desensitization**: Rubbing the affected limb with progressively coarser textures (silk -> wool -> towel) to retrain the central sensory cortex and reduce allodynia.\n2.  **Meds**: **Gabapentin/Pregabalin** (Neuropathic pain), **Nifedipine** (Vasodilator for cold/ischemic CRPS), **Bisphosphonates** (for bone pain/osteopenia), and **Vitamin C** (Prevention post-fracture).',
    ),
    const Section(
      title: '+ The patient fails conservative therapy after 4 weeks. What is the next Interventional step for Upper Extremity CRPS?',
      content: '**Stellate Ganglion Block (SGB)**.\n- **Target**: Sympathetic chain at C6/C7 (Chassaignac\'s tubercle).\n- **Sign of Success**: **Horner\'s Syndrome** (Ptosis, Miosis, Anhidrosis) indicates a successful sympathetic blockade.\n- **Goal**: Break the sympathetic feedback loop to allow PT participation.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: \'My surgeon thinks I\'m crazy. He says the X-ray is fine and I\'m just looking for drugs. Is this all in my head?\'',
    ),
    const Section(
      title: '+ Manage this medical gaslighting.',
      content: '1.  **Validation**: \'This is absolutely **Real**. It is a biological malfunction of the nervous system, not a psychological problem. You are not crazy.\'\n2.  **Education**: \'The nerves that control blood flow and sensation are stuck in an \'alarm\' mode. We can see the swelling and temperature change—that is objective proof. We will treat this like any other nerve injury.\'',
    ),
  ],
);
