import type { Case } from '../../types/case';

export const case_wristdrop: Case = {
  "id": "wristdrop",
  "title": "Radial Neuropathy ('Saturday Night Palsy')",
  "url": "https://www.pmrrecap.com/wristdrop",
  "sections": [
    {
      "title": "Initial Presentation",
      "content": "A 39-year-old male presents with acute right wrist drop. He admits to consuming 'a lot of alcohol' at a party last night and woke up with the weakness."
    },
    {
      "title": "History & Systems Review:",
      "content": "In evaluating **Wrist Drop**, localize the lesion based on spared muscles:\n- **Posterior Cord**: Deltoids/Latissimus Dorsi weak.\n- **Axilla**: Triceps weak.\n- **Spiral Groove** (Humerus): **Triceps SPARED** (branches exit proximally), but Brachioradialis/Wrist Extensors weak.\n- **Posterior Interosseous Nerve (PIN)**: **Supinator SPARED** (no sensory loss), only finger extension weak.\n- **Red Flag**: Trauma? Must rule out **Humeral Shaft Fracture**."
    },
    {
      "title": "Physical Examination Findings:",
      "content": "- **Motor**: \n    - Triceps: 5/5 (Intact -> Lesion is distal to Axilla).\n    - Brachioradialis: 0/5.\n    - Wrist Extension: 1/5.\n    - Finger Extension: 0/5.\n- **Sensation**: Decreased light touch over the **Dorsal First Webspace** (Radial sensory autonomic zone). Intact sensation in the axillary patch.\n- **Reflexes**: Triceps 2+, Brachioradialis 0."
    },
    {
      "title": "DOMAIN B: PROBLEM SOLVING",
      "content": "The combination of **Spared Triceps**, **Weak Brachioradialis**, and **Dorsal Webspace Numbness** fits a **Radial Neuropathy at the Spiral Groove**."
    },
    {
      "title": "+ You suspect compression ('Saturday Night Palsy'), but he also has a bruise on his arm. What imaging is mandatory?",
      "content": "**X-Ray of the Humerus**. \n- **Rationale**: Must rule out a **Holstein-Lewis Fracture** (Distal 1/3 Humeral Shaft Fracture) which can entrap or lacerate the radial nerve. Managing this as simple compression without X-ray would be malpractice."
    },
    {
      "title": "+ X-ray is negative. You order NCS. How do you differentiate Conduction Block (Neurapraxia) vs. Axonal Loss?",
      "content": "Perform **Short Segment Stimulation ('Inching')** across the Spiral Groove.\n- **Neurapraxia**: Clean conduction block (Drop in CMAP amplitude proximal to the groove, normal distal).\n- **Axonotmesis**: Low CMAP amplitude everywhere (distal and proximal) due to wallerian degeneration."
    },
    {
      "title": "DOMAIN C: PATIENT MANAGEMENT",
      "content": "Diagnosis is Neurapraxia (Good prognosis). You prescribe a splint."
    },
    {
      "title": "+ Compare a Standard Cock-Up Splint vs. a Dynamic Extension Splint.",
      "content": "- **Wrist Cock-Up**: Keeps wrist neutral but fingers still droop (making function impossible). Good for night.\n- **Dynamic Extension Splint** (e.g., Thomas Splint): Uses rubber band outriggers to passively extend the fingers, allowing the patient to **actively grasp** and use the hand during the day. This is superior for functional independence."
    },
    {
      "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
      "content": "Three months later, his strength returns to 4/5. He asks: 'Doc, I can't go back to my warehouse job yet. It feels weird. Can you sign me off on permanent disability?'"
    },
    {
      "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
      "content": "Address the request for Disability vs. Return to Work."
    },
    {
      "title": "+ Your response:",
      "content": "I would pivot to the **Therapeutic Benefit of Work**.\nResponse: 'I am glad your strength is returning (4/5). I cannot medically certify permanent disability because your condition is improving and you have functional hand use. \nHowever, I will write a strict **Graded Return to Work** plan:\n1.  **Restrictions**: No lifting >10lbs, frequent breaks.\n2.  **Goal**: Getting back to work—even light duty—actually speeds up recovery by keeping you active and preventing the depression that often comes with long-term disability. Let's focus on what you *can* do, rather than what you can't.'"
    }
  ]
};
