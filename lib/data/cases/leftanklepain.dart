import '../../models/case_model.dart';

const caseLeftanklepain = CaseModel(
  id: 'leftanklepain',
  title: 'Posterior Heel Pain in the Adolescent Athlete',
  url: 'https://www.pmrrecap.com/leftanklepain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 16-year-old female soccer player presents with a 2-week history of progressive left posterior heel pain. She is a \'travel team\' athlete and reports the pain limits her ability to sprint and push off.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In evaluating adolescent posterior heel pain, your history should focus on:\n- **Training Load**: Recent spikes in volume or intensity (\'Load Capacity Mismatch\').\n- **Pain Characterization**: Morning stiffness vs. warm-up phenomenon vs. pain after activity.\n- **Extrinsic Factors**: Footwear changes (cleats vs. running shoes), playing surface (turf vs. grass).\n- **Intrinsic Factors**: History of pes planus/cavus, prior injuries.\n- **Red Flags**: Night pain, constitutional symptoms, or history of flouroquinolone use.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Mild fusiform swelling noted 3cm proximal to the calcaneal insertion. No erythema or warmth.\n- **Palpation**: Tenderness to palpation in the mid-substance of the Achilles tendon. \'Arc sign\' is present (nodule moves with tendon excursion).\n- **Range of Motion**: Ankle dorsiflexion is limited to 0 degrees with knee extended (Gastrocnemius tightness).\n- **Functional Testing**: \n    - **Single Leg Heel Raise**: Reproduction of pain and inability to complete >10 repetitions on the left (vs 25 on right).\n    - **Thompson Test**: Negative (intact tendon continuity).\n- **Special Tests**: Negative Talar Tilt and Anterior Drawer.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The clinical presentation of mid-substance tenderness, morning stiffness, and pain with tendon loading is consistent with **Mid-portion Achilles Tendinopathy**.',
    ),
    const Section(
      title: '+ Provide a structured differential diagnosis for posterior heel pain in this demographic.',
      content: '1.  **Mid-portion Achilles Tendinopathy**: The primary working diagnosis.\n2.  **Retrocalcaneal Bursitis**: Inflammation of the bursa between the tendon and calcaneus.\n3.  **Haglund\'s Deformity**: \'Pump bump\' or bony prominence irritating the insertion.\n4.  **Sever\'s Disease (Calcaneal Apophysitis)**: Though typically seen in younger adolescents (skeletally immature), it remains a consideration if growth plates are open.\n5.  **Posterior Ankle Impingement**: Os trigonum syndrome (common in dancers/soccer due to plantarflexion).\n6.  **Sural Neuritis**: Numbness/burning along the lateral border of the foot.',
    ),
    const Section(
      title: '+ What is the preferred outcome measure to track her progress?',
      content: '**The VISA-A Questionnaire** (Victorian Institute of Sport Assessment-Achilles). It is the validated gold-standard tool for assessing symptom severity and functional disability in Achilles tendinopathy.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'You initiate a comprehensive rehabilitation program focusing on tendon mechanotransduction.',
    ),
    const Section(
      title: '+ Describe the \'Gold Standard\' exercise protocol for this condition.',
      content: 'The **Alfredson Protocol** (Eccentric Loading): \n- Investigates the use of heavy eccentric calf lowering (heel drops) to stimulate tendon remodeling.\n- **Protocol**: 3 sets of 15 repetitions, performed twice daily, for 12 weeks. \n- **Progression**: Performed with both straight knee (Gastrocnemius) and bent knee (Soleus). Load is added via a backpack or weights once bodyweight becomes pain-free.\n*Note*: Modern research also supports \'Heavy Slow Resistance\' (HSR) training as an equivalent alternative.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'The patient\'s coach contacts your office, stating: \'She\'s our leading scorer. If you don\'t clear her, we lose the playoffs. Can\'t you just inject it so she can play?\'',
    ),
    const Section(
      title: '+ How do you respond to this request regarding corticosteroid injection?',
      content: 'I would firmly advise **against** peritendinous corticosteroid injection in an active athlete. While it may provide short-term analgesic relief, high-quality evidence suggests it increases the risk of **tendon rupture** and inhibits long-term collagen healing. As a physician, my primary duty is to the long-term health of the patient\'s musculoskeletal system, not the short-term outcome of a game. Rupturing an Achilles would result in surgery and a 9-12 month recovery, which is an unacceptable risk.',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'During a follow-up visit, the patient\'s mother steps out to take a call. The patient immediately reveals: \'My ankle barely hurts anymore. I just told you it hurts because I hate soccer. My parents force me to play year-round and I want to quit, but I\'m afraid to tell them.\'',
    ),
    const Section(
      title: '+ Manage this ethical dilemma regarding patient autonomy and family dynamics.',
      content: 'I would respond: \'Thank you for trusting me enough to tell me the truth. I appreciate your honesty. It sounds like you are feeling incredibly pressured and burnt out, to the point where having an injury felt like the only way out. As your doctor, I care about your whole well-being—mental and physical. Forcing yourself to play a sport you resent can actually lead to injury due to distraction or fatigue. I would like to help you have this conversation with your parents. We can frame it around your \'health goals\' and the need to prevent burnout. Would you be open to me facilitating a discussion with them when they come back in, or would you prefer guidance on how to talk to them yourself later?\'\n\n**Key Board Points**: Validate the patient\'s feelings, identify the \'Burnout\' syndrome, and offer to act as a neutral advocate to facilitate family communication.',
    ),
  ],
);
