import '../../models/case_model.dart';

const caseWeaknessinachild = CaseModel(
  id: 'weaknessinachild',
  title: 'Duchenne Muscular Dystrophy (DMD)',
  url: 'https://www.pmrrecap.com/weaknessinachild',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 5-year-old boy presents with \'clumsiness\' and difficulty keeping up with his peers at recess. His mother notes he uses his hands to \'climb up his legs\' when standing up from the floor.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In a male child with proximal weakness, focus on **Developmental Motor Milestones**:\n- **Delayed Walking**: Did he walk after 18 months? (Common in DMD).\n- **Gower\'s Sign**: The maneuver described (using arms to extend the hip due to gluteal weakness).\n- **Family History**: Any maternal uncles with wheelchair use? (X-linked Recessive).\n- **Cognition**: Is there speech delay or intellectual disability? (Dystrophin is expressed in the brain).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: **Lumbar Hyperlordosis** and **Calf Pseudohypertrophy** (Fatty infiltration, not true muscle).\n- **Gait**: Waddle gait (Trendelenburg) and Toe Walking (Heel cord contracture).\n- **Labs**: **CK (Creatine Kinase)** is markedly elevated (>10-50x normal) even before symptoms are severe.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The combination of **Male Gender**, **Gower\'s Sign**, **Calf Pseudohypertrophy**, and **High CK** is diagnostic of **Duchenne Muscular Dystrophy (DMD)**.',
    ),
    const Section(
      title: '+ Genetic testing confirms a Dystrophin mutation (Exon deletion). Discuss the Systems Review priorities.',
      content: 'DMD is a multi-system disease:\n1.  **Cardiac**: Dilated Cardiomyopathy is the leading cause of death. Requires **Cardiac MRI/Echo** at diagnosis and annually.\n2.  **Pulmonary**: Restrictive lung disease. Monitor FVC annually.\n3.  **Bone Health**: Risk of Osteoporosis (Steroid use + Immobility). Monitor Vitamin D/DEXA.\n4.  **Nutrition**: Risk of obesity (Steroids) vs. dysphagia (late stage).',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You initiate Glucocorticoid therapy to prolong ambulation.',
    ),
    const Section(
      title: '+ Compare the two primary steroid options: Prednisone vs. Deflazacort.',
      content: '- **Prednisone**: \n    - Cheap/Available.\n    - **Side Effect**: Significant Weight Gain (Cushingoid) -> Worse functional load on weak muscles.\n- **Deflazacort**: \n    - **Benefit**: Less weight gain.\n    - **Risk**: Higher risk of **Cataracts** and **Growth Delay**. Often preferred if weight gain becomes a limiting factor.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'Since this is an X-Linked Recessive condition, who else needs your attention?',
    ),
    const Section(
      title: '+ Recommendation:',
      content: 'The **Mother**. \n- she requires **Genetic Counseling** to discuss carrier status (risk for future pregnancies).\n- **Carrier Health**: Female carriers can develop **Cardiomyopathy** even without skeletal muscle weakness. She needs a cardiology referral for herself.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'As you leave, the 5-year-old boy pulls on your coat and whispers: \'My friend\'s brother said I\'m gonna die. Is that true?\'',
    ),
    const Section(
      title: '+ Manage this pediatric ethics scenario.',
      content: 'Do not lie, but do not traumatize. Use a **Parent-Bridging Strategy**.\nResponse: \n1.  **Validate**: \'That is a very scary thing to hear. I am sorry someone said that to you.\'\n2.  **Age-Appropriate Truth**: \'Your muscles are different, and the doctors are working very hard to keep them strong. We have medicines now that we didn\'t have before.\'\n3.  **Bridge**: \'This is a big question. I want to talk with your mom and dad so we can all answer this together in a way that makes sense.\' \n*(Rationale: Parents have the right to determine when/how terminal prognosis is disclosed to a young child).*',
    ),
  ],
);
