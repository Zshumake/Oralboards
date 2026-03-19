import '../../models/case_model.dart';

const caseHeadache = CaseModel(
  id: 'headache',
  title: 'Post-Traumatic Headache and Vestibular-Ocular Dysfunction',
  url: 'https://www.pmrrecap.com/headache',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 22-year-old female presents to your clinic with persistent headaches and dizziness following a sports-related injury. Two weeks ago, she sustained an acceleration-deceleration injury (fall from a cheerleading stunt) striking her occiput against a gymnasium floor. She reports no loss of consciousness (GCS 15 at scene) but has had non-remitting symptoms since the event.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating this post-traumatic presentation, your history should focus on the four symptom clusters of concussion (SCAT6 framework):\n- **Somatic**: Characteristics of the headache (unilateral/pulsating vs. tension-type), photophobia, phonophobia, and nausea.\n- **Vestibular/Ocular**: Dizziness, vertigo, or \'foggy\' sensation with rapid head movements.\n- **Cognitive**: Difficulty concentrating, memory deficits (\'feeling slowed down\').\n- **Sleep/Mood**: New-onset insomnia, emotional lability, or anxiety.\n- **Red Flag Screening**: Worsening headache, repeated vomiting, or focal neurologic signs that would suggest intracranial pathology.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vital Signs**: Stable. BP 115/75, HR 72.\n- **Cervical Spine**: Mild paraspinal tenderness and restricted ROM, ruling out significant cervicogenic contribution.\n- **Vestibular/Ocular-Motor Screening (VOMS)**: \n    - **Smooth Pursuit/Saccades**: Elicits mild headache.\n    - **Vestibular Ocular Reflex (VOR)**: Significant provocation of dizziness and nausea.\n    - **Visual Motion Sensitivity (VMS)**: Highly symptomatic.\n- **Balance**: Balance Error Scoring System (BESS) reveals deficits in single-leg stance on foam.\n- **Neurologic**: Cranial nerves II-XII are grossly intact. No focal motor or sensory deficits.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The patient demonstrates a symptom complex consistent with **mild Traumatic Brain Injury (concussion)** with predominant vestibular-ocular dysfunction and post-traumatic migraine phenotype.',
    ),
    const Section(
      title: '+ Challenge: Explain the underlying pathophysiology of the \'Metabolic Crisis\' in acute concussion/mTBI.',
      content: 'Concussion results in a biophysical force-induced neuronal depolarization. This triggers a massive release of glutamate and a subsequent influx of calcium and efflux of potassium. To restore homeostasis, the Na+/K+ pumps operate at maximum capacity, creating a state of **hyper-glycolysis** (increased energy demand). This occurs simultaneously with a period of **cerebral blood flow reduction** (decreased supply), leading to a \'mismatch\' or metabolic crisis. During this vulnerable window, the brain is hypersensitive to secondary ischemic or traumatic injury.',
    ),
    const Section(
      title: '+ What is your management strategy for her persistent vestibular symptoms and headaches?',
      content: '1.  **Activity Modification**: Avoidance of \'contact risk\' is mandatory. We no longer recommend \'cocoon therapy\' (complete dark room rest). Instead, she should engage in **symptom-limited activity** (sub-threshold) to promote autonomic recovery.\n2.  **Vestibular Rehabilitation**: Referral to PT for a specialized vestibular program (e.g., gaze stability, habituation exercises).\n3.  **Headache Management**: \n    - **Abortive**: Limit NSAID/Tylenol use to prevent Medication Overuse Headache (MOH).\n    - **Prophylactic**: Given the \'migrainous\' features (throbbing, photo/phonophobia), consider a trial of **Amitriptyline** (TCA) or **Topiramate** if symptoms persist beyond 4-6 weeks.',
    ),
    const Section(
      title: '+ Would you obtain advanced neuroimaging (CT/MRI) at this visit?',
      content: 'According to the **ACR Appropriateness Criteria** and clinical decision rules (e.g., Canadian CT Head Rule), imaging is **not indicated** at this time. She is GCS 15, >24 hours post-injury, has no focal neurologic deficits, no signs of basilar skull fracture, and no coagulopathy. CT imaging is utilized to detect neurosurgical emergencies (hemorrhage), not diffuse axonal injury.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You note an increasing number of concussions in the local high school district without standardized baseline data.',
    ),
    const Section(
      title: '+ How would you implement a \'Secondary Prevention\' program for student-athletes?',
      content: 'I would propose the district-wide implementation of **Baseline Neurocognitive Testing** (e.g., ImPACT). This \'Systems-Based\' initiative involves:\n1.  **Pre-season Screening**: Establishing a valid cognitive baseline for every contact-sport athlete.\n2.  **Post-injury Comparison**: Using objective data to assist in the difficult \'return-to-learn\' and \'return-to-play\' decision-making process, ensuring athletes have returned to their personal baseline before risk exposure.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: The patient is symptom-free at rest but dizzy with exercise. She says: \'My coach says I\'m fine if I don\'t have a headache. I have the State Championship in 4 days. I need you to clear me.\'',
    ),
    const Section(
      title: '+ Provide a professional response outlining the \'Graduated Return-to-Play\' protocol.',
      content: 'I would respond: \'I understand how huge this championship is for you, and I want to get you back as soon as safely possible. However, the international definition of \'recovered\' means you must be symptom-free *during physical exertion*, not just at rest. If you return before your brain\'s energy levels are restored, a second hit could be catastrophic (Second Impact Syndrome). We must follow the **6-Step Graduated Return-to-Play Protocol**: (1) Symptom-limited activity, (2) Light aerobic exercise, (3) Sport-specific exercise, (4) Non-contact drills, (5) Full-contact practice, and (6) Game play. Each step takes 24 hours. Since you become dizzy with exercise (Step 2), we cannot rush to Step 6 in four days. My medical clearance is based on your safety, and we have to follow the physiology.\'',
    ),
  ],
);
