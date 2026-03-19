import type { Case } from '../../types/case';

export const case_neckpain: Case = {
  "id": "neckpain",
  "title": "Cervical Dystonia (Torticollis)",
  "url": "https://www.pmrrecap.com/neckpain",
  "sections": [
    {
      "title": "Initial Presentation",
      "content": "A 29-year-old female presents with a 3-year history of involuntary neck turning and chronic neck pain. She describes a 'pulling' sensation that forces her head to the right, which worsens with stress and improves with a 'sensory trick' (lightly touching her chin)."
    },
    {
      "title": "History & Systems Review:",
      "content": "In evaluating involuntary movements, your history should distinguish:\n- **Dystonia Classification**: Focal (Cervical) vs. Segmental vs. Generalized.\n- **Sensory Geste**: Does touching the chin/face temporarily resolve the posture? (Classic for Dystonia).\n- **Medication History**: Any exposure to Dopamine antagonists (Antipsychotics/Reglan) causing Tardive Dystonia?\n- **Family History**: DYT1 gene mutations (Early Onset Dystonia).\n- **Red Flags**: Wilson's Disease screening (young onset) or Parkinsonian features."
    },
    {
      "title": "Physical Examination Findings:",
      "content": "- **Inspection**: Rotational Torticollis to the RIGHT with slight Laterocollis to the RIGHT.\n- **Palpation**: Hypertrophy and spasm of the Left Sternocleidomastoid (SCM).\n- **Motor**: Attempting to turn the head to the left meets significant resistance.\n- **Neurologic**: No weakness, ataxia, or craneal nerve deficits."
    },
    {
      "title": "DOMAIN B: PROBLEM SOLVING",
      "content": "The clinical picture of involuntary sustained muscle contractions causing abnormal posture, relieved by a sensory geste, is diagnostic of **Cervical Dystonia (Spasmodic Torticollis)**."
    },
    {
      "title": "+ Identify the specific muscles involved in a Right Rotational Torticollis.",
      "content": "To turn the head to the RIGHT, the active muscles are:\n1.  **Left Sternocleidomastoid (SCM)**: Contralateral rotator.\n2.  **Right Splenius Capitis**: Ipsilateral rotator.\n*Key Procedural Note*: These would be the primary targets for Chemodenervation."
    },
    {
      "title": "+ Describe the Mechanism of Action of the first-line treatment (Botulinum Toxin Type A).",
      "content": "Botulinum Toxin A is a protease that cleaves **SNAP-25**, a protein in the **SNARE Complex**. This prevents the fusion of Acetylcholine vesicles with the presynaptic membrane at the neuromuscular junction, causing a reversible chemical denervation. \n*(Note: Type B cleaves VAMP/Synaptobrevin).* "
    },
    {
      "title": "DOMAIN C: PATIENT MANAGEMENT",
      "content": "You plan for Chemodenervation. The patient asks about safety."
    },
    {
      "title": "+ What is the 'Black Box Warning' for this medication, and how do you mitigate it?",
      "content": "The Boxed Warning is for **Distant Spread of Toxin**, which can cause dysphagia (swallowing difficulty) and respiratory compromise. \n- **Mitigation**: Use the lowest effective dose, avoid bilateral SCM injections (increases dysphagia risk), and utilize **Dual Guidance** (EMG to confirm motor endplate activity + Ultrasound to visualize vascular structures)."
    },
    {
      "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
      "content": "The patient returns 6 weeks later reporting *zero* improvement. This is her 4th injection cycle, and previous cycles worked well."
    },
    {
      "title": "+ How do you manage this 'Secondary Non-Responder'?",
      "content": "I would suspect the development of **Neutralizing Antibodies** (Immunoresistance). \n- **Frontalis Test**: Inject a small test dose into the forehead. If it fails to paralyze the frontalis muscle (no wrinkle loss), antibodies are confirmed.\n- **Management**: Switch serotypes (e.g., from Type A to Type B - RimabotulinumtoxinB) or attempt a 'Drug Holiday' to allow antibody titers to fall."
    },
    {
      "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
      "content": "During the examination, the patient makes an inappropriate comment: 'I love the way your pants fit... can I take a picture of you?' She pulls out her phone."
    },
    {
      "title": "+ Manage this breach of professional boundaries.",
      "content": "I would strictly enforce boundaries immediately.\nResponse: 'Ms. X, that comment and behavior are completely inappropriate. It breaches the professional boundary of our doctor-patient relationship. Please put your phone away. Because this boundary has been violated, I can no longer serve as your physician effective immediately. I will complete today's urgent medical assessment, but I will be transferring your care to another provider. I will provide you with emergency coverage for 30 days to ensure you are safe, but our therapeutic relationship is terminated.'"
    }
  ]
};
