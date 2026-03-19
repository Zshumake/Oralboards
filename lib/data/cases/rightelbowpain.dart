import '../../models/case_model.dart';

const caseRightelbowpain = CaseModel(
  id: 'rightelbowpain',
  title: 'Ulnar Collateral Ligament (UCL) Injury',
  url: 'https://www.pmrrecap.com/rightelbowpain',
  sections: [
    const Section(
      title: 'Initial Presentation',
      content: 'A 16-year-old elite high school baseball pitcher presents with 3 weeks of worsening medial elbow pain. He reports a decrease in velocity and control, but denies a specific \'pop\' event.',
    ),
    const Section(
      title: 'History & Systems Review:',
      content: 'In the throwing athlete, your history must quantify the **Workload**:\n- **Volume**: Pitches per game? Games per week? Showcase events?\n- **Mechanics**: Does he throw curveballs/sliders? (Higher torque).\n- **Neurologic**: Any numbness in the 4th/5th digits? (Ulnar Neuritis often co-occurs).\n- **\'Dead Arm\'**: Has he lost velocity or accuracy recently? (Early sign of UCL failure).\n- **Pop**: A distinct pop suggests an acute rupture vs. chronic attenuation.',
    ),
    const Section(
      title: 'Physical Examination Findings:',
      content: '- **Inspection**: Mild effusion over the medial epicondyle. No bruising.\n- **Palpation**: Tender at the sublime tubercle (UCL insertion).\n- **Stability**: \n    - **Valgus Stress Test**: Pain and laxity at 30 degrees flexion (isolates UCL) vs. 0 degrees (bony stability).\n    - **Milking Maneuver**: Positive for apprehension and pain.\n- **Neurologic**: Positive Tinel\'s at the Cubital Tunnel. 5/5 strength in FDP 4/5 and intrinsics.',
    ),
    const Section(
      title: 'DOMAIN B: PROBLEM SOLVING',
      content: 'The combination of medial instability (Valgus stress/Milking) and performance decline in a pitcher is diagnostic of **Ulnar Collateral Ligament (UCL) Insufficiency**.',
    ),
    const Section(
      title: '+ Compare the diagnostic utility of MRI vs. Dynamic Ultrasound for this condition.',
      content: '- **MRI Arthrogram**: The gold standard for visualizing the tissue quality and partial tears (\'T-Sign\').\n- **Dynamic Ultrasound**: Superior for assessing **Functional Laxity**. We can stress the joint in real-time and measure the gapping (widening) of the joint line compared to the contralateral side. >1mm asymmetry is significant.',
    ),
    const Section(
      title: '+ Imaging confirms a high-grade partial tear of the UCL. Outline your Rehabilitation Plan.',
      content: '1.  **Acute Phase**: Complete rest from throwing (Active Rest). Control inflammation/pain.\n2.  **Recovery Phase**: Focus on Kinetic Chain mechanics (Core/Hips) and Scapular dyskinesis.\n3.  **Strengthening**: Initiate the **\'Thrower\'s Ten\'** program (rotator cuff/scapular stabilizers).\n4.  **Return to Play**: Begin **Interval Throwing Program (ITP)** only when pain-free and strength is symmetric. Progress from 45ft -> 60ft -> 90ft -> 120ft -> Mound.',
    ),
    const Section(
      title: 'DOMAIN C: PATIENT MANAGEMENT',
      content: 'The patient returns 3 months later. He is throwing pain-free but is frustrated that his velocity hasn\'t fully returned. He asks about \'Tommy John Surgery\' to make him throw faster.',
    ),
    const Section(
      title: 'DOMAIN D: SYSTEMS-BASED PRACTICE',
      content: 'You examine the league notes and see he was throwing 120 pitches/game on back-to-back days.',
    ),
    const Section(
      title: '+ Counsel the coach/parent on Pitch Smart Guidelines (MLB/USA Baseball).',
      content: 'I would educate them: \'The UCL is a ligament, not a muscle—it cannot simply be \'trained\' to take infinite load. Evidence shows that **Pitch Counts** are the specific safety limit. For a 16-year-old, the limit is ~95 pitches/game, with **4 days rest** mandated afterwards. Exceeding this or pitching through fatigue is the #1 predictor of surgery. \'Tommy John\' reconstructs the ligament but does not guarantee a return to elite velocity.\'',
    ),
    const Section(
      title: 'DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS',
      content: 'The patient confides in you: \'Doc, I know I\'m not supposed to, but I started taking Anavar (Oxandrolone) to get my strength back. My gym buddy gets it for me. Please don\'t tell my parents.\'',
    ),
    const Section(
      title: '+ Manage this confession of Anabolic Steroid use in a minor.',
      content: 'I would balance Confidentiality with Safety.\nResponse: \'I appreciate you trusting me enough to tell me. This is a crucial piece of your medical history. \n1.  **Medical Reality**: Steroids might build muscle, but they weaken tendons/ligaments (making a UCL tear *more* likely) and risk permanent heart/liver damage.\n2.  **Legal/Safety**: As a minor, I generally respect your privacy, but if you are using a controlled substance that puts you in immediate danger, I have a duty to ensure you are safe. I strongly encourage we bring your parents into this conversation so we can monitor your health (liver enzymes/heart) together. I won\'t call the police, but I cannot ignore the medical risk this poses to your life.\'',
    ),
  ],
);
