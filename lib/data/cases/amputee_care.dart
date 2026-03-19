import '../../models/case_model.dart';

const caseAmputeeCare = CaseModel(
  id: 'amputee-care',
  title: 'Post-Amputation Rehabilitation',
  url: 'https://www.pmrrecap.com/amputee-care',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'You are consulted for post-operative rehabilitation recommendations for a 53-year-old male who is 2 days status-post Right Transtibial Amputation (BKA). The amputation was necessitated by a non-healing diabetic foot ulcer complicated by osteomyelitis.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'Your initial assessment should address the following clinical domains:\n- **Etiology & Comorbidities**: Evaluation of dysvascular risk factors (Diabetes mellitus with A1c 8.2%, HTN, HLD) and renal function (Stage 3 CKD with Cr 1.8).\n- **Premorbid Functional Status**: Detailed vocational and avocational history (e.g., mail carrier, 10-15 miles daily ambulation) and baseline independence in ADLs/IADLs.\n- **Pain Profile**: Categorization of pain as nociceptive (surgical site, 4/10) vs. neuropathic (phantom limb pain, 7/10).\n- **Psychosocial & Environment**: Assessment of home architecture (2-story, 15 steps) and available support systems.\n- **Secondary Prevention**: Status of the \'intact\' contralateral limb, including history of neuropathy or previous ulceration.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Residual Limb**: Post-surgical dressing is in place. The incision is well-approximated with staples; no signs of dehiscence or infection. Tibial length is 15cm from the joint line.\n- **Contralateral Limb**: Diminished sensation to 10g monofilament in a stocking distribution. Pedal pulses (DP/PT) are 1+ bilaterally. No active integumentary issues.\n- **Vitals & Anthropometrics**: HR 88 bpm, BP 138/88 mmHg. BMI is 25.\n- **Neuromusculoskeletal**: Strength is 5/5 in UEs and L lower extremity (except 4/5 ankle dorsiflexion). R hip extension is restricted (-10 degrees flexion contracture).',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical objective in this subacute phase is the management of post-operative edema, prevention of secondary joint contractures, and optimization of the residual limb for future prosthetic fitting.',
    ),
    const Section(
      title: '+ Formulate the immediate post-operative management plan for this patient.',
      content: '1.  **Limb Protection & Edema Control**: Transition from a soft dressing to a **Rigid Removable Dressing (RRD)**. This provides mechanical protection against falls, reduces edema, and facilitates frequent wound inspection.\n2.  **Contracture Prevention**: Implement a daily \'Prone Lying\' protocol (20 mins TID) to address hip flexion contractures. Ensure the knee is maintained in extension while sitting (avoiding \'pillow-behind-the-knee\' positioning).\n3.  **Phantom Pain Management**: Initiate **Gabapentin** for neuropathic phantom limb pain; begin education on non-pharmacological strategies like mirror therapy once the incision is stable.',
    ),
    const Section(
      title: '+ Discuss the clinical significance of the \'intact\' limb in a patient with Stage 3 CKD and peripheral neuropathy.',
      content: 'The \'intact\' limb is at high risk for future limb loss (50% risk within 3-5 years post-primary amputation in dysvascular patients). Management must include:\n- **Tertiary Prevention**: Mandatory daily visual foot inspections and the use of high-quality, protective footwear (avoiding barefoot ambulation).\n- **Vascular Optimization**: Intensive glucose and blood pressure control to mitigate the progression of small-vessel disease and ensure adequate perfusion for surgical healing.',
    ),
    const Section(
      title: '+ Challenge: Provide a K-Level assessment and justification for this patient.',
      content: 'Based on his premorbid function (15 miles/day) and vocational requirements (mail carrier), the patient is an appropriate candidate for a **K3 or K4 classification**. A **K3** designation is justified as he has the potential for ambulation with variable cadence, which is necessary for community navigation and vocational duties. This status is critical for justifying advanced prosthetic components like energy-storing feet.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT (Subacute Follow-up)',
      content: 'The patient is now 6 months post-amputation. The residual limb is mature, well-healed, and non-edematous. He is ready for a definitive prosthetic prescription.',
    ),
    const Section(
      title: '+ Provide a detailed definitive prosthetic prescription for this K3-level transtibial amputee.',
      content: 'The prescription should include:\n1.  **Socket**: Total Surface Bearing (TSB) or Patellar Tendon Bearing (PTB) socket with a flexible inner liner.\n2.  **Suspension**: **Suction or Elevated Vacuum suspension**. This is superior to a locking pin for high-activity users as it reduces \'pistoning\' and improves proprioceptive feedback during community ambulation.\n3.  **Componentry**: Lightweight pylon and an **Energy Storage and Return (ESR) carbon fiber foot** with multi-axial capability to accommodate uneven terrain encountered during vocational tasks.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The third-party payer has denied the request for the ESR foot, stating that a basic SACH foot meets the minimum requirements for household ambulation.',
    ),
    const Section(
      title: '+ How do you structure a \'Letter of Medical Necessity\' (CMN) to appeal this denial?',
      content: 'The appeal must emphasize \'Functional Requirement\' over \'Minimum Necessity\':\n- **Vocational Data**: Document the requirement for variable cadence and high-mileage ambulation for his job as a mail carrier.\n- **Secondary Prevention**: Argue that advanced componentry (ESR/Multi-axial) reduces compensatory forces on the intact limb and lumbar spine, thereby preventing future multi-segmental MSK injuries and associated costs.\n- **Environmental safety**: Detail the need for multi-axial stability to navigate the \'uneven terrain\' inherent in community and vocational settings.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'Role-Play: During a 3-week follow-up, the patient expresses frustration: \'I saw an athlete on TV with a computerized leg running 5 days after his accident. Why am I stuck in this sock? I feel like my recovery is being mismanaged.\'',
    ),
    const Section(
      title: '+ Provide a professional response that addresses the patient\'s concerns while managing clinical expectations.',
      content: 'I would say: \'I understand your frustration; seeing rapid recoveries online can make your own process feel slow. However, the \'computerized\' legs you see require a very stable, maturely shaped limb to fit correctly. Because your amputation was caused by circulation issues and diabetes, we have to be much more careful with your skin\'s healing. Fitting a socket too early would lead to skin breakdown, which could set your progress back by months. We are currently building the foundation so that you can safely use those advanced components for the 15 miles a day you aspire to walk. We aren\'t holding you back; we are ensuring your recovery is durable and successful.\'',
    ),
  ],
);
