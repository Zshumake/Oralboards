import '../../models/case_model.dart';

const caseToewalking = CaseModel(
  id: 'toewalking',
  title: 'Cerebral Palsy (Spastic Diplegia)',
  url: 'https://www.pmrrecap.com/toewalking',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 4-year-old male presents with \'walking on his tiptoes\'. He was born at 28 weeks gestation and spent 2 months in the NICU. His parents note his legs seem \'stiff\' and \'scissor\' when he runs.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In a child with toe walking and prematurity, suspect **Cerebral Palsy (CP)**.\n- **Birth History**: Gestational age? Intraventricular Hemorrhage (IVH)? Periventricular Leukomalacia (PVL)? (PVL affects leg fibers -> Diplegia).\n- **Development**: Age of walking? (Delayed >18 mos?).\n- **Function**: Can he climb stairs? Jump? (GMFCS Classification).\n- **Review of Systems**: Seizures? Vision (Strabismus)? Swallowing (Dysphagia)?',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Tone**: Increased tone (Spasticity) in bilateral Gastrocnemius and Hamstrings (Modified Ashworth Scale 2-3). Upper extremities are minimally involved.\n- **Strength**: Weakness in Anterior Tibialis and Gluteus Maximus.\n- **Gait**: Bilateral equinus (toe walking), scissoring (adductor spasticity), and increased lumbar lordosis.\n- **ROM**: Popliteal Angle -50 degrees (Hamstring tightness). Ankle dorsiflexion -20 degrees.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The history (Prematurity/PVL) and exam (Spastic Diplegia > UEs) confirm **Cerebral Palsy**.',
    ),
    const Section(
      title: '+ Classify this patient\'s Motor Function using the GMFCS.',
      content: '**GMFCS Level I or II**:\n- **Level I**: Walks without limitations (can run/jump).\n- **Level II**: Walks with limitations (trouble on uneven terrain/crowds), but no assistive device.\n- **Level III**: Walks with an assistive device (Walker/Crutches).\n*This classification predicts future motor potential and hip risk.*',
    ),
    const Section(
      title: '+ Differentiate \'Jump Gait\' vs. \'Crouch Gait\' in CP.',
      content: '- **Jump Gait**: Equinus (Toe down) + Knee Extension + Hip Flexion. (Looks like jumping into water).\n- **Crouch Gait**: Excessive Dorsiflexion + Knee Flexion + Hip Flexion. (often iatrogenic from over-lengthening the heel cord). \n*Management implies different muscle targets (Gastroc vs. Hamstrings/Psoas).*',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You are managing his spasticity to improve gait efficiency.',
    ),
    const Section(
      title: '+ What are the options for focal vs. generalized spasticity?',
      content: '1.  **Focal (Botulinum Toxin)**: Best for specific muscles (e.g., Gastrocnemius for toe walking). Goal: Delay surgery.\n2.  **Generalized (Oral Meds)**: Baclofen/Diazepam. (Side effect: Sedation).\n3.  **Surgical (SDR)**: Selective Dorsal Rhizotomy (Permanent reduction in tone). Best for GMFCS I-III with pure spasticity (no dystonia).\n4.  **Intrathecal Baclofen (Pump)**: Usually for severe spasticity (GMFCS IV-V).',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You order a pelvic X-ray. The radiologist mentions the \'Migration Percentage\'.',
    ),
    const Section(
      title: '+ Explain the Hip Surveillance Guidelines for CP.',
      content: 'Children with CP are at high risk for **Hip Displacement** (Silent dislocation).\n- **Metric**: **Migration Percentage (MP)** = % of the femoral head uncovered by the acetabulum.\n- **Threshold**: **MP > 30%** is \'At Risk\'. **MP > 40%** usually triggers orthopedic referral for soft tissue release or osteotomy.\n- **Protocol**: \n    - GMFCS I-II: X-ray at age 2 and 6.\n    - GMFCS III-V: X-ray **Every 6-12 months** until skeletal maturity.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: The mother asks: \'Is this my fault? Did I do something wrong during pregnancy?\'',
    ),
    const Section(
      title: '+ Manage this parental guilt.',
      content: '1.  **Absolution**: \'This is absolutely **not your fault**. CP is caused by events often beyond anyone\'s control (like prematurity or vascular changes in the womb).\'\n2.  **Focus on Potential**: \'What matters now is that his brain is amazing and plastic. Our therapies are designed to teach his brain new ways to move. You are doing everything right by bringing him here.\'',
    ),
  ],
);
