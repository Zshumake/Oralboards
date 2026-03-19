import type { Case } from '../../types/case';

export const case_tachycardia: Case = {
  "id": "tachycardia",
  "title": "Pulmonary Embolism (PE) in SCI",
  "url": "https://www.pmrrecap.com/tachycardia",
  "sections": [
    {
      "title": "Initial Presentation",
      "content": "A 40-year-old female with a T4 ASIA B Spinal Cord Injury (1 week post-injury) develops sudden sustained tachycardia (HR 130 bpm). She has a concurrent Subdural Hematoma (SDH) from her initial trauma."
    },
    {
      "title": "History & Systems Review:",
      "content": "In a recumbent SCI patient, **Unexplained Tachycardia** is a Red Flag.\n- **Pain**: Is there a noxious stimulus below the lesion? (Though T4 usually causes Bradycardia in AD, tachycardia can occur).\n- **Respiration**: Oxygen desaturation? Pleuritic Chest Pain? (Often absent in SCI due to sensory loss).\n- **Volume**: Orthostatic hypotension vs. Hypovolemic shock (Bleeding?).\n- **Infection**: Fever? UTI symptoms?\n- **DVT Signs**: Unilateral leg swelling? (But remember: Calf pain/Homan's sign is absent in paralyzed limbs)."
    },
    {
      "title": "Physical Examination Findings:",
      "content": "- **Vitals**: HR 130. BP 100/60. SpO2 93% RA. Temp 37.5C.\n- **Lungs**: Clear to auscultation.\n- **Extremities**: 2cm circumference difference in the Right Calf vs. Left. No erythema.\n- **Labs**: WBC 12.0 (Mildly elevated). D-Dimer: 4,500 (Elevated)."
    },
    {
      "title": "DOMAIN B: PROBLEM SOLVING",
      "content": "The combination of Tachycardia, Hypoxia, and Elevated D-Dimer in an immobile trauma patient is highly suspicious for **Pulmonary Embolism (PE)**."
    },
    {
      "title": "+ Calculate the Modified Wells Score for PE risk stratification.",
      "content": "- **Initial Suspicion**: \n    - HR > 100 (+1.5)\n    - Immobilization/Surgery (+1.5)\n    - Clinical Signs of DVT (+3.0)\n    - PE most likely diagnosis (+3.0)\n- **Score**: >6.0 = **High Probability**.\n- **Action**: Immediate CT Angiogram (CTA) of the Chest."
    },
    {
      "title": "+ CT confirms a large Right Lower Lobe PE. How do you manage this in a patient with a recent Subdural Hematoma?",
      "content": "**Anticoagulation vs. Filter**: \n- **Contraindication**: Full systemic anticoagulation (Heparin/Lovenox) is **Contraindicated** due to the active/recent Traumatic Brain Injury (Risk of SDH expansion).\n- **Intervention**: Place a **Retrievable IVC Filter** immediately to prevent further emboli from the DVT shower."
    },
    {
      "title": "DOMAIN C: PATIENT MANAGEMENT",
      "content": "3 weeks later, the Neurosurgery team clears her for anticoagulation. The IVC filter is retrieved."
    },
    {
      "title": "+ Why is it critical to retrieve the IVC filter once anticoagulation is started?",
      "content": "- **Long-term Risk**: IVC filters left in place permanently have a high rate of complications: **Filter Thrombosis** (blocking the cava), **Migration**, and **Vessel Perforation**. They are valid *bridges*, not permanent solutions for transient risks."
    },
    {
      "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
      "content": "The patient is stabilized and transfers to rehab. She asks: 'Be honest, Doc. Am I ever going to walk again?'"
    },
    {
      "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
      "content": "Provide a professional, realistic prognosis based on her C7 ASIA A (Complete) status."
    },
    {
      "title": "+ Your response:",
      "content": "I would use the **'Independence vs. Ambulation'** frame.\nResponse: 'That is the most important question, and you deserve an honest answer based on the data. For a complete injury at the C7 level, the spinal cord connection is severed. Statistically, the chance of regaining functional walking is **less than 5%**. \nHowever, I want to be clear about what C7 can do: You have triceps function. This means you can transfer yourself, push a manual wheelchair, drive a modified car, and live independently. **You will not be bedbound.** Our goal in rehab is to maximize that independence so you can live a full life, even if using a wheelchair for mobility.'"
    }
  ]
};
