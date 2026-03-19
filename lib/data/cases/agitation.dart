import '../../models/case_model.dart';

const caseAgitation = CaseModel(
  id: 'agitation',
  title: 'Post-Traumatic Agitation',
  url: 'https://www.pmrrecap.com/agitation',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'You are the attending physiatrist on a dedicated acute brain injury unit. You are paged to evaluate a 24-year-old male who is 3 weeks status-post severe traumatic brain injury (GCS 6 at scene, 4-day LOC). Over the preceding 24 hours, the patient has demonstrated escalating irritability. The nursing staff reports an episode of physical aggression toward a therapist during morning mobilization. The patient is currently being managed with 1-on-1 supervision.',
    ),
    const Section(
      title: 'History of Present Illness & Review of Systems:',
      content: 'In assessing this acute change in behavioral status, your history should focus on:\n- **Chronological Recovery**: Confirmation of GCS, duration of post-traumatic amnesia (PTA), and most recent Rancho Los Amigos level (Previously Ranchos V; currently appearing Ranchos IV).\n- **Safety & Restraint**: Evaluation of immediate risk to self/others and current behavioral containment strategies.\n- **Secondary Insults**: Assessment of potential triggers including sleep-wake cycle disruption, environmental overstimulation (new roommate, noise), or acute pain generators.\n- **Physiological Review**: Monitoring of bowel/bladder patterns (e.g., last bowel movement, urinary output/catheter status) and dietary intake.\n- **Medication Reconciliation**: Review of current neuro-pharmacotherapy (e.g., Levetiracetam, Enoxaparin, scheduled Acetaminophen).',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vital Signs**: T 99.1°F, HR 112 bpm, BP 145/90 mmHg, SpO2 96% on room air.\n- **General Observation**: The patient is hypervigilant, pacing the room, and demonstrates verbal disinhibition. He is disoriented to person, place, and time.\n- **Cognitive Assessment**: ABS (Agitated Behavior Scale) score is 32, consistent with severe agitation. Attention is severely impaired.\n- **Neurological**: Pupils are equal and reactive. Motor examination reveals symmetric movement of all four extremities, though limited by poor cooperation. Global hyperreflexia with sustained 2-beat clonus is noted bilaterally.\n- **Additional Systems**: Abdominal palpation reveals mild distention. No occult fractures or new pressure injuries are identified.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical picture is consistent with Rancho Los Amigos Level IV (Confused-Agitated). However, the acute onset and associated tachycardia necessitate the exclusion of superimposed medical delirium or secondary neurological complications.',
    ),
    const Section(
      title: '+ Provide a structured differential diagnosis for this acute behavioral escalation.',
      content: 'A systematic approach includes:\n1.  **Direct Neurological Complications**: Progressive post-traumatic hydrocephalus, subclinical seizure activity, or delayed intracranial hemorrhage/re-bleed.\n2.  **Extracranial Medical Etiologies**: \n    - **Infection**: Urinary tract infection (catheter-associated) or pneumonia.\n    - **Metabolic/Endocrine**: Hyponatremia (SIADH/Cerebral Salt Wasting), hypoxia, or glycemic dysregulation.\n    - **Physiological Discomfort**: Fecal impaction (note 3-day history), urinary retention, or occult pain.\n3.  **Pharmacological Factors**: Adverse effects of Levetiracetam (\'Keppra-rage\'), medication withdrawal, or toxicity.\n4.  **Environmental**: Circadian rhythm disruption and sensory overstimulation.',
    ),
    const Section(
      title: '+ Based on the objective findings, what is the most appropriate next step in management?',
      content: 'Management should prioritize stabilizing the patient while identifying the underlying etiology:\n1.  **Immediate De-escalation**: Implementation of a \'low-stimulation\' protocol.\n2.  **Diagnostic Workup**: Obtain a bladder scan to assess for retention, and order stat labs (CBC, BMP, UA with culture). Perform a non-contrast CT Head to rule out neurosurgical emergencies.\n3.  **Interventional Relief**: If the bladder scan or abdominal exam suggests retention/impaction, perform immediate catheterization or bowel disimpaction.\n4.  **Pharmacotherapeutic Adjustment**: Evaluate the risk-benefit profile of switching Levetiracetam to an alternative mood-stabilizing anticonvulsant, such as Valproic Acid.',
    ),
    const Section(
      title: '+ Challenge: Post-Traumatic Amnesia (PTA)',
      content: 'The patient\'s family requests a prognosis and an explanation for his aggression. How do you define PTA and describe its clinical assessment?',
    ),
    const Section(
      title: '+ Challenge Answer',
      content: 'Post-Traumatic Amnesia (PTA) is a transient state following TBI characterized by disorientation and the inability to form continuous new memories. Agitation (Rancho IV) is a frequent biological component of this phase. Clinical assessment utilizing validated tools like the **GOAT (Galveston Orientation and Amnesia Test)** or **LOGAS** is essential. Resolution of PTA (typically 2 consecutive GOAT scores >75) is one of the most reliable predictors of long-term functional and vocational outcomes.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'The diagnostic workup identifies urinary retention (600cc on bladder scan) and fecal impaction. Following targeted intervention, the patient\'s heart rate normalizes to 84 bpm and the ABS score improves to 22 (mild agitation).',
    ),
    const Section(
      title: '+ What pharmacologic strategy is indicated to optimize long-term cognitive recovery in this patient?',
      content: '1.  **Dopaminergic Augmentation**: Commencement of **Amantadine** (e.g., 100mg BID). Level 1 evidence supports its use to accelerate the rate of functional recovery during the early subacute phase of TBI.\n2.  **Behavioral Stabilization**: If agitation remains severe or safety-limiting, consider **Valproic Acid** or **Propranolol**. \n3.  **Pharmacologic Avoidance**: Strictly avoid **Benzodiazepines** and first-generation antipsychotics, as they may impair neuroplasticity, cause paradoxical agitation, and prolong PTA.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The treatment team expresses concern regarding staff safety and requests the application of four-point soft wrist restraints.',
    ),
    const Section(
      title: '+ Discuss the clinical rationale regarding the use of physical restraints in the TBI population.',
      content: 'A **restraint-minimization** approach is standard of care. Physical restraints often exacerbate \'trapped\' sensations, leading to increased agitation, autonomic dysregulation, and risk of injury. Preferred alternatives include:\n- **Environmental Control**: Use of a canopy \'Vail\' or \'Posey\' bed to provide a safe, enclosed environment.\n- **Staffing**: Utilization of 1-on-1 sitters or video monitoring.\n- **Secondary Protection**: Concealing IV sites with stockinette or \'tubigrip\' sleeves rather than hand-restraint.\n- **Proximity**: Relocating the patient closer to high-traffic nursing areas for better supervision.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: A bedside nurse, feeling distressed by the patient\'s previous aggression, asks: \'Can we just use a heavy sedative like Thorazine? It\'s not fair to the staff to be at risk for a patient who is clearly just aggressive by nature.\'',
    ),
    const Section(
      title: '+ Provide a professional response that addresses staff safety while providing clinical education.',
      content: 'I would respond: \'I truly appreciate the difficulty of providing care under these circumstances; staff safety is a paramount concern. However, this behavior is a clinical manifestation of his brain injury—specifically a loss of frontal lobe inhibitory control—rather than his baseline personality. Over-sedating him with medications like Thorazine would unfortunately \'mask\' his neurological recovery and likely prolong this agitated phase. Instead, let\'s implement a \'low-stim\' protocol and I will optimize his medications to improve his internal calm without impairing his cognitive progress. We will hold a team huddle to ensure every staff member feels supported and has a safe exit strategy during care tasks.\'',
    ),
  ],
);
