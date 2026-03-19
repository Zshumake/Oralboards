import '../../models/case_model.dart';

const caseBilateralshoulderpain = CaseModel(
  id: 'bilateralshoulderpain',
  title: 'Inflammatory Proximal Girdle Aching',
  url: 'https://www.pmrrecap.com/bilateralshoulderpain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 54-year-old female presents to your outpatient clinic with a 2-month history of symmetric proximal girdle aching. She describes localized discomfort in both shoulders and hips, which is most debilitating in the early morning. She reports significant difficulty performing overhead tasks, such as grooming and retrieving objects from high shelves, specifically during the first two hours after waking.',
    ),
    const Section(
      title: 'History of Present Illness & Review of Systems:',
      content: 'In your evaluation of symmetric proximal aching, you should prioritize the following:\n- **Diurnal Variation**: Characterization of the duration and severity of morning stiffness (currently reported as >60 minutes) and its response to activity.\n- **Systemic Symptoms**: Evaluation for constitutional signs, including low-grade pyrexia, unintentional weight loss (5 lbs), and exertional fatigue.\n- **Neurological/Vascular Red Flags**: Screening for symptoms of Giant Cell Arteritis (GCA), including new-onset localized headaches, jaw claudication during mastication, or transient visual obscurations.\n- **Functional Impairment**: Assessment of ADL interference (e.g., dressing, driving, hair care) and response to previous conservative measures (PRN Ibuprofen with minimal benefit).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Musculoskeletal (Shoulders)**: \n    - **Passive Range of Motion (PROM)**: Near full and symmetric in all planes, suggesting an extra-articular process.\n    - **Active Range of Motion (AROM)**: Restricted by pain, specifically during abduction and external rotation; \'painful arc\' noted bilaterally.\n    - **Strength Testing**: Demonstrates 4/5 effort in the deltoids and supraspinatus bilaterally. Weakness appears to be secondary to \'reflexic inhibition\' (pain-limited) rather than a primary neurologic or myopathic process.\n- **Axial Skeleton**: Cervical spine ROM is full; negative Spurling’s maneuver. Temporal arteries are non-tender and demonstrate normal pulsatility without thickening.\n- **Lower Extremities**: Symmetric aching in the proximal thighs; gait is slow but mechanically stable.',
    ),
    const Section(
      title: '+ Challenge: Provide the classic musculoskeletal ultrasound (MSK-US) findings associated with this clinical presentation.',
      content: 'A key diagnostic feature of Polymyalgia Rheumatica (PMR) on MSK-US includes **bilateral subacromial-subdeltoid (SASD) bursitis**. Additional findings often include biceps tenosynovitis and occasional glenohumeral or trochanteric synovitis.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'Laboratory evaluation reveals an Erythrocyte Sedimentation Rate (ESR) of 85 mm/hr and a C-Reactive Protein (CRP) of 4.2 mg/dL. A Complete Blood Count (CBC) demonstrates a mild normocytic, normochromic anemia (Hgb 11.2 g/dL).',
    ),
    const Section(
      title: '+ What is your definitive diagnosis and initial therapeutic intervention?',
      content: 'The clinical and laboratory profile is diagnostic for **Polymyalgia Rheumatica (PMR)**. The most appropriate initial intervention is a low-dose corticosteroid trial (e.g., **Prednisone 15mg daily**). A dramatic clinical response—often defined as >75% symptom resolution within 48 to 72 hours—serves as both a therapeutic and diagnostic confirmation.',
    ),
    const Section(
      title: '+ What \'Secondary Prevention\' measures are indicated for a patient initiating long-term corticosteroid therapy?',
      content: 'Given the anticipated 12–18 month treatment course, management must include:\n1.  **Skeleton Preservation**: Baseline **DEXA scan** to assess bone mineral density. Initiate Calcium (1200mg/day) and Vitamin D (800–1000 IU/day). Assess the need for bisphosphonate therapy based on FRAX scores or BMD results.\n2.  **Metabolic Surveillance**: Regular monitoring of blood pressure, fasting plasma glucose/HbA1c (for steroid-induced hyperglycemia), and a baseline ophthalmologic exam to monitor for cataract or glaucoma development.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'Despite adherence to the prednisone taper, the patient eventually develops symptoms consistent with Giant Cell Arteritis (GCA) and suffers significant visual impairment in the right eye.',
    ),
    const Section(
      title: '+ Formulate a comprehensive rehabilitation and community integration plan for this patient with new-onset visual impairment.',
      content: 'Rehabilitation should focus on safety and functional adaptation:\n- **Tertiary Prevention**: Referral to an Occupational Therapist specializing in **Low Vision Rehabilitation** for home safety modifications (e.g., high-contrast labeling, tactile markers).\n- **Vocational/Community Support**: Coordination with state organizations for the blind for \'Orientation and Mobility\' training, including the use of assistive technology or white cane training if necessary.\n- **Psychosocial Intervention**: Screening and referral for professional counseling to manage the grief and adjustment disorder associated with sudden sensory loss.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: The patient is visibly distressed and states: \'I feel completely failed by this system. You told me it was just shoulder aching, and now I am blind in my right eye. How could you have missed this?\'',
    ),
    const Section(
      title: '+ Provide a professional and empathetic response that addresses the patient\'s concerns while maintaining clinical boundaries.',
      content: 'I would respond: \'I deeply regret that this has been the outcome of your condition, and I can only imagine how devastating this vision loss is for you. To address your concern, at our initial consultation, we specifically screened for the markers of the vision-threatening condition (GCA)—including checking your temporal pulses and asking about headaches or jaw pain—and those tests were normal at that time. PMR and GCA are closely linked, and unfortunately, even with appropriate treatment for the shoulder pain, GCA can emerge subsequently. My immediate priority is to ensure we give you every resource available to adapt to this change and to coordinate closely with your rheumatologist to prevent further complications.\'',
    ),
  ],
);
