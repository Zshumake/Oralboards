import '../../models/case_model.dart';

const caseLowbackpain2 = CaseModel(
  id: 'lowbackpain2',
  title: 'Osteoporotic Vertebral Compression Fracture',
  url: 'https://www.pmrrecap.com/lowbackpain2',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 73-year-old female with a history of hypertension and Coronary Artery Disease presents with acute, severe mid-back pain after a ground-level fall (slipping on a wet floor) 3 days ago.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating acute geriatric back pain after trauma, focus on:\n- **Mechanism**: Low-energy (fragility) vs. High-energy trauma.\n- **Neurologic Screen**: Any bowel/bladder incontinence, saddle anesthesia, or lower extremity weakness (retropulsed fragment compressing the cord/cauda equina).\n- **Red Flags**: Unrelenting night pain or fever (Malignancy/Discitis).\n- **Constitutional**: Recent weight loss or history of malignancy.\n- **Social**: Current living situation and fall risk at home.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Kyphotic sustained posture. No bruising or abrasions.\n- **Palpation**: Point tenderness at the T10-L1 thoracolumbar junction. Percussion tenderness is positive.\n- **Neurologic**: Strength 5/5 in bilateral lower extremities. Sensation and reflexes intact. Rectal tone normal.\n- **Functional**: Unable to transition from sit-to-stand without significant assistance due to pain.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The history of low-energy trauma in an elderly female with point tenderness is highly suspicious for a **Vertebral Compression Fracture (VCF)**.',
    ),
    const Section(
      title: '+ Imaging Update: X-rays reveal a T12 Anterior Wedge Compression Fracture with 30% height loss. No retropulsion.',
      content: 'This is a **Genant Grade 2** (25-40% height loss) compression fracture. \n*Critical Step*: Verify stability by assessing the **Posterior Ligamentous Complex (PLC)**. Absence of widening between spinous processes on palpation/X-ray suggests a stable, anterior-column only injury.',
    ),
    const Section(
      title: '+ Describe your comprehensive medical management plan.',
      content: '1.  **Analgesia**: Multimodal approach (Acetaminophen, Lidocaine patch). **Calcitonin-Salmon (Intranasal)** is a unique adjunct shown to reduce acute VCF pain for 4 weeks.\n2.  **Bracing**: A **Posterior Inflatable (PKB)** or Jewett brace to prevent flexion and promote extension (comfort only, does not heal the bone).\n3.  **Mobilization**: Early mobilization as tolerated to prevent DVT/Pneumonia. Avoid bedrest.\n4.  **Secondary Prevention (CRITICAL)**: This is a fragility fracture. She needs a **DEXA scan** and initiation of anti-osteoporotic therapy (Bisphosphonates or Anabolics like Teriparatide) to prevent the next hip fracture.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'Six weeks later, she returns with persistent, debilitating pain (VAS 8/10) despite bracing and meds. She cannot sleep or function.',
    ),
    const Section(
      title: '+ Discuss the role of Vertebroplasty/Kyphoplasty in this scenario.',
      content: 'This is controversial. \n- **AAOS Guidelines**: Recommend *against* routine use due to sham-controlled trials showing no long-term benefit over medical management.\n- **VAPOUR Trial (Lancet)**: Showed that in fractures <6 weeks old with severe pain, vertebroplasty provided significantly better pain relief than sham.\n- **Decision**: Given her intractable pain failing 6 weeks of conservative care, she is a candidate for **Vertebroplasty/Kyphoplasty** for *palliation*, understanding the risks (cement leakage, adjacent level fracture).',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You refer her for the procedure. The Spine Surgeon calls you angrily: \'Why did you wait 6 weeks? You delayed her care! She needed this immediately!\'',
    ),
    const Section(
      title: '+ Role-play your professional defense of your conservative management.',
      content: 'I would respond: \'I appreciate your passion for her recovery. My decision to trial 6 weeks of conservative care aligns with the **AAOS Clinical Practice Guidelines**, which prioritize non-operative management due to the favorable natural history of most VCFs. Evidence suggests that early vertebroplasty does not always confer long-term benefit over placebo. However, now that she has failed that trial and meets the criteria for \'intractable pain,\' I agree she is an excellent surgical candidate. I referred her to you because I trust your technical skills to help her now that conservative measures have been exhausted.\'',
    ),
  ],
);
