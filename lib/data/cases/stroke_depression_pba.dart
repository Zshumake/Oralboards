import '../../models/case_model.dart';

const caseStrokeDepressionPba = CaseModel(
  id: 'stroke-depression-pba',
  title: 'Post-Stroke Depression & Pseudobulbar Affect',
  url: '',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 58-year-old right-handed male is seen on the acute inpatient rehabilitation unit 8 weeks after a left frontal ischemic stroke resulting in mild right hemiparesis and non-fluent aphasia. His wife reports that he has become increasingly withdrawn from therapy sessions over the past 2 weeks, spending most of the day in bed. She describes frequent, sudden crying episodes that seem disproportionate to the situation, stating: "He starts sobbing when I walk in the room, but then stops just as fast." His FIM scores have plateaued despite adequate motor recovery potential.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In assessing mood and behavioral changes after stroke, your evaluation should focus on:\n- **Pre-Stroke Psychiatric History**: Any prior depression, anxiety, or psychiatric medication use.\n- **Temporal Onset**: Acute vs. gradual change in mood; relationship to stroke onset and lesion location (left frontal lesions carry highest risk for PSD).\n- **Characterization of Crying Episodes**: Involuntary vs. mood-congruent; duration; triggers; associated subjective sadness.\n- **Functional Impact**: Decline in therapy participation, ADL engagement, appetite, and sleep patterns.\n- **Medication Review**: Beta-blockers, benzodiazepines, or other medications that may exacerbate depressive symptoms.\n- **Substance History**: Pre-stroke alcohol use and current withdrawal risk.\n- **Social Supports**: Caregiver burden, family dynamics, and discharge environment.\n- **Screening Tools**: PHQ-9 (adapted for aphasia if needed), Stroke Aphasic Depression Questionnaire (SADQ) for patients with significant language deficits.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Vitals**: BP 138/82, HR 68, RR 14, Temp 98.4F, SpO2 97% on RA.\n- **General**: Appears fatigued, poor eye contact, psychomotor retardation noted. Flat affect at baseline but demonstrates two spontaneous crying episodes during the exam lasting 15-20 seconds each, self-resolving.\n- **Neurological**: Alert, oriented x3. Non-fluent aphasia with 3-4 word phrases, comprehension intact for 2-step commands. Right upper extremity 4-/5 proximally, 3+/5 distally. Right lower extremity 4/5 throughout. Sensation intact. No neglect.\n- **Mental Status**: PHQ-9 score of 16 (moderately severe depression). Patient endorses anhedonia, poor sleep, fatigue, and feelings of worthlessness. Denies suicidal ideation.\n- **Functional Status**: Mod-A for transfers (previously Min-A), requiring increased cueing for participation in OT/PT sessions.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The co-occurrence of depressive symptoms (withdrawal, anhedonia, PHQ-9 = 16) and involuntary, incongruent crying episodes suggests **both Post-Stroke Depression (PSD) and Pseudobulbar Affect (PBA)** may be present simultaneously.',
    ),
    const Section(
      title: '+ Distinguish Post-Stroke Depression (PSD) from Pseudobulbar Affect (PBA) and outline the diagnostic approach.',
      content: '**Post-Stroke Depression (PSD)**:\n1. Sustained low mood, anhedonia, sleep/appetite disturbance, psychomotor changes.\n2. Emotional expression is **congruent** with internal mood state.\n3. Prevalence: ~30-35% of stroke survivors.\n4. Risk factors: Left frontal lesion, prior depression, social isolation, functional disability.\n5. Diagnosis: PHQ-9 >= 10; DSM-5 criteria for Major Depressive Disorder due to another medical condition.\n\n**Pseudobulbar Affect (PBA)**:\n1. Involuntary, sudden episodes of crying or laughing that are **disproportionate or incongruent** to mood.\n2. Episodes are stereotyped, brief (seconds to minutes), and self-limited.\n3. Caused by disruption of cortico-pontine-cerebellar pathways that modulate emotional expression.\n4. Diagnosis: **Center for Neurologic Study-Lability Scale (CNS-LS)** score >= 13.\n5. Key distinguishing feature: Patient often reports they do NOT feel sad during crying episodes.\n\n**Critical Teaching Point**: PSD and PBA can **coexist** in the same patient. The PHQ-9 captures the sustained mood disorder, while the CNS-LS captures the involuntary affective dysregulation. Both should be assessed independently.',
    ),
    const Section(
      title: '+ What additional workup should be considered to rule out other etiologies of behavioral change?',
      content: '1. **Laboratory Studies**: TSH (hypothyroidism), B12/folate, CBC (anemia), CMP (metabolic derangement), urinalysis (occult UTI causing delirium).\n2. **Imaging**: Review existing brain MRI to confirm left frontal infarct location and rule out new or expanding lesion, hydrocephalus, or hemorrhagic conversion.\n3. **Medication Reconciliation**: Evaluate for drug-induced depression (beta-blockers, corticosteroids, levetiracetam if on seizure prophylaxis).\n4. **Sleep Study Consideration**: Post-stroke sleep-disordered breathing (central or obstructive apnea) can present with fatigue, poor participation, and mood disturbance.\n5. **Neuropsychological Screening**: Brief cognitive assessment (MoCA) to evaluate for executive dysfunction or apathy syndrome, which can mimic depression but requires different management.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'After confirming the dual diagnosis of PSD (PHQ-9 = 16) and PBA (CNS-LS = 18), you develop a comprehensive treatment plan.',
    ),
    const Section(
      title: '+ Outline the pharmacological and non-pharmacological management for co-occurring PSD and PBA.',
      content: '**Pharmacological Management**:\n1. **For PSD**: Initiate **Sertraline 25 mg daily**, titrate to 50-100 mg over 2-4 weeks. SSRIs are first-line for PSD with strong evidence (FLAME trial supported fluoxetine; sertraline has favorable side-effect profile). Avoid TCAs due to anticholinergic burden and cardiac risk.\n2. **For PBA**: If PBA symptoms persist despite SSRI therapy (SSRIs can partially treat PBA), consider adding **Dextromethorphan 20 mg/Quinidine 10 mg (Nuedexta)** — the only FDA-approved treatment for PBA. Counsel that quinidine is a CYP2D6 inhibitor; check for drug interactions.\n3. **Avoid**: Benzodiazepines (impair neuroplasticity and recovery), typical antipsychotics (risk of post-stroke apathy).\n\n**Non-Pharmacological Management**:\n1. **Cognitive Behavioral Therapy (CBT)**: Adapted for aphasia; use visual aids, simplified language, and caregiver involvement.\n2. **Behavioral Activation**: Structure daily schedule with meaningful activities to combat withdrawal.\n3. **Therapy Modifications**: Schedule high-demand therapies during peak alertness; use motivational interviewing techniques.\n4. **Family Education**: Teach distinction between PSD and PBA so caregivers do not misinterpret involuntary crying as worsening depression.\n5. **Reassessment**: Repeat PHQ-9 and CNS-LS at 4-week intervals to track response.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You recognize that mood disorders are frequently underdiagnosed in your rehabilitation unit, and many patients are discharged without adequate psychiatric follow-up.',
    ),
    const Section(
      title: '+ Describe a systems-level approach to integrating mental health screening and treatment into the inpatient rehabilitation setting.',
      content: '1. **Standardized Screening Protocol**: Implement universal PHQ-9 screening for all stroke patients at admission, weekly during stay, and at discharge. Add CNS-LS for patients with reported emotional lability.\n2. **Embedded Psychology/Psychiatry**: Advocate for a dedicated rehabilitation psychologist as part of the interdisciplinary team who attends weekly team conferences and provides bedside interventions.\n3. **Tiered Consultation Model**: Mild symptoms (PHQ-9: 5-9) managed by rehab physician with therapy referral; moderate-severe (PHQ-9 >= 10) triggers automatic psychiatry or psychology consult.\n4. **Discharge Transition**: Establish warm handoffs to outpatient mental health providers; include mood medication reconciliation in the discharge summary; schedule follow-up within 2 weeks of discharge.\n5. **Staff Training**: Provide nursing and therapy staff with education on recognizing PSD vs. PBA vs. grief reaction vs. apathy to improve early identification.\n6. **Quality Metric**: Track depression screening completion rates and time-to-treatment as a rehabilitation unit quality indicator.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: During your evaluation, the patient becomes tearful for 10 seconds, then abruptly stops. He looks at you and says: "I\'m not depressed, doc. I don\'t know why I keep crying. It just happens. My wife thinks I\'m losing my mind."',
    ),
    const Section(
      title: '+ Provide a model response that validates the patient\'s experience, explains PBA in accessible terms, and addresses the co-existing depression.',
      content: 'I would respond: "Mr. [Patient], I want you to know that what you are experiencing is a **real, recognized medical condition** — you are not losing your mind, and your wife does not need to worry about that. After a stroke, the brain\'s wiring that controls emotional expression can be disrupted. This means your brain may trigger crying even when you don\'t feel sad inside. We call this **Pseudobulbar Affect**, and there is a specific medication that can help control it.\n\nNow, I also want to be honest with you about something else. While the sudden crying may not match your mood, I have noticed some other changes — like pulling back from therapy, difficulty sleeping, and not enjoying things the way you used to. These are signs that the stroke may also be affecting your mood in a deeper way, which is incredibly common and affects about one in three stroke survivors. This is called **Post-Stroke Depression**, and it is not a sign of weakness — it is a biological consequence of the brain injury.\n\nThe good news is that we can treat both of these conditions effectively. I would like to start a medication that can help lift your mood and energy so you can get the most out of your rehabilitation. I also want to involve our psychologist to give you additional support. Would you be open to trying this approach?"',
    ),
  ],
);
