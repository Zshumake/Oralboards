import '../../models/case_model.dart';

const caseLethargy = CaseModel(
  id: 'lethargy',
  title: 'Pediatric Traumatic Brain Injury & Hydrocephalus',
  url: 'https://www.pmrrecap.com/lethargy',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 14-year-old female is currently on your Inpatient Rehabilitation unit recovering from a severe Traumatic Brain Injury (Subdural Hematoma s/p Craniectomy). Evaluation of her morning labs is pending. The nurse pages you stat: the patient is unusually lethargic and her heart rate has dropped to 50 bpm.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In assessing an acute decline in mental status in a TBI patient, you must rapidly screen for:\n- **Raised Intracranial Pressure (ICP)**: Headache, projectile vomiting, Cushing\'s Triad (Bradycardia, Hypertension, Irregular Respirations).\n- **Infectious**: Fever, nuchal rigidity (Meningitis), or wound drainage.\n- **Seizure**: Post-ictal state following an unwitnessed event.\n- **Metabolic**: Hypoglycemia or Hyponatremia (CSW/SIADH).\n- **Medication**: Recent administration of sedatives/opioids.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vitals**: HR 48 (Bradycardic), BP 160/90 (Hypertensive), RR 10 (Irregular). **(This is Cushing\'s Triad)**.\n- **Eyes**: Left pupil is 6mm and sluggish. Right is 3mm and reactive. \'Sunset Eye\' sign (impaired upgaze) noted.\n- **Neurologic**: GCS has dropped from 14 (E4, V4, M6) to 9 (E2, V3, M4). She withdraws to pain but does not follow commands.\n- **Incision**: Clean, dry, and intact. No boggy swelling (pseudomeningocele).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The triad of Bradycardia, Hypertension, and Irregular Respirations (Cushing\'s Reflex) alongside pupillary asymmetry is diagnostic of **Acute Hydrocephalus** with impending herniation.',
    ),
    const Section(
      title: '+ Explain the pathophysiology of the Cushing\'s Reflex.',
      content: 'Ischemia to the brainstem (due to high ICP) triggers a sympathetic surge to increase Mean Arterial Pressure (MAP) and maintain cerebral perfusion. In response, the baroreceptors cause a parasympathetic reflex bradycardia via the Vagus nerve.',
    ),
    const Section(
      title: '+ What is your immediate management?',
      content: '1.  **Stat Head CT**: To confirm ventriculomegaly/hydrocephalus.\n2.  **Neurosurgery Consult**: Urgent evaluation for EVD (External Ventricular Drain) or VP Shunt (Ventriculoperitoneal Shunt) placement.\n3.  **Medical Management**: Elevate head of bed to 30 degrees. Hyperventilate (target pCO2 30-35 mmHg) for transient vasoconstriction if herniation is imminent.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'A VP shunt is placed. The patient stabilizes and returns to the unit. She enters **Rancho Los Amigos Level IV (Confused-Agitated)**: she is restless, hitting staff, and screaming.',
    ),
    const Section(
      title: '+ Describe your environmental and pharmacologic management strategy for RLA IV Agitation.',
      content: '1.  **Environmental**: \'Low Stimulation\' protocol. Dim lights, minimize noise/visitors, use a Craig Bed (enclosed safety bed) or 1:1 sitter for safety. Avoid restraints if possible as they increase agitation.\n2.  **Pharmacologic**: \n    - **First line**: Environmental modification.\n    - **Medications**: Propranolol (Beta-blocker) or Amantadine. Avoid Benzodiazepines (worsen confusion/memory) and Antipsychotics (lower seizure threshold) unless absolutely necessary for safety.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The insurance company attempts to deny her continued inpatient stay, stating: \'She is too agitated to participate in 3 hours of therapy. Send her to a skilled nursing facility (SNF).\'',
    ),
    const Section(
      title: '+ Conduct the Peer-to-Peer appeal. Justify the medical necessity of Acute Rehab over SNF.',
      content: 'I would argue: \'This patient is in the **Rancho IV** stage of recovery, which is a critical window for brain injury rehabilitation. \n1.  **Safety**: Her agitation and confusion require a **locked unit** or **1:1 safety monitors** and specialized enclosure beds (Craig bed), which standard SNFs cannot provide. A SNF would likely chemically restrain her (sedation), which halts her cognitive recovery.\n2.  **Therapy Function**: Agitation *is* the therapy target. Our neuropsychologists and therapists are working solely on behavior modification and command following. We document participation by \'time engaged\' rather than \'reps,\' which meets CMS criteria for this population.\'',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'The patient\'s mother is upset with your \'Low Stimulation\' rule restricting visitors. \'She needs her family! We are her support system! Why are you keeping us away?\'',
    ),
    const Section(
      title: '+ Counsel the mother on the concept of \'Overstimulation\' in brain injury.',
      content: 'I would explain: \'I know this feels like we are isolating her, and that goes against every instinct you have as a mother. But right now, her brain is like a computer that is rebooting—it is very fragile. Too much noise, talking, and touching causes her brain to \'overheat,\' which comes out as screaming and hitting (agitation). By keeping the room quiet and limiting visitors to one at a time, we are actually conducting a medical treatment—we are giving her brain the rest it needs to heal faster so she *can* recognize you and enjoy your company sooner. We are not keeping you away; we are pacing the visits to match what her brain can handle.\'',
    ),
  ],
);
