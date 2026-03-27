# PM&R Novel Case Generation — Scoping

## Existing Coverage (37 cases from PMR Recap — to be replaced)
TBI (5), SCI (4), MSK/Sports (8), Neuromuscular/EDX (7), Pain (3), Pediatric (3), Amputee (2), Cancer (2), Cardiac (1), Other (2)

## Critical Gaps
- Stroke: 0 cases (should be ~8, it's the #1 PM&R topic)
- Geriatric Rehab: 0
- Pulmonary Rehab: 0
- MS/Parkinson's/Neurodegen: 0
- Burn Rehab: 0
- Polytrauma: 0
- Wheelchair/DME: 0 dedicated
- Work injury/IME: 0

## Case Format (from existing codebase)
Each case is a Dart const with sections:
1. Initial Presentation (clinical vignette, 3-5 sentences)
2. History & Systems Review (what to ask, bulleted)
3. Physical Examination Findings (vitals + exam, bulleted)
4. DOMAIN B: PROBLEM SOLVING (transition narration)
5. + Question (differential, workup)
6. + Answer
7. + Challenge question
8. + Challenge answer
9. DOMAIN C: PATIENT MANAGEMENT (transition narration)
10. + Management question(s)
11. DOMAIN D: SYSTEMS-BASED PRACTICE (transition narration)
12. + Systems question
13. DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS (transition narration)
14. + Communication/ethics role-play

## 50 Novel Cases by ABPMR Category

### Stroke Rehabilitation (8)
1. Acute MCA Ischemic Stroke — Left Hemiplegia
2. Hemorrhagic Stroke — Post-ICH Spasticity Management
3. Post-Stroke Dysphagia & Aspiration Risk
4. Hemispatial Neglect & Visual Field Cut
5. Post-Stroke Depression & Pseudobulbar Affect
6. Wallenberg Syndrome (Lateral Medullary)
7. Post-Stroke Shoulder Subluxation & Pain
8. Cryptogenic Stroke in Young Adult (PFO)

### Spinal Cord Injury (6)
9. Acute T6 Complete Paraplegia (ASIA A)
10. Neurogenic Bowel Management
11. Heterotopic Ossification Post-SCI
12. Stage 4 Sacral Pressure Injury
13. Brown-Séquard Syndrome
14. High Cervical SCI & Ventilator Weaning

### TBI Supplemental (3)
15. Moderate TBI & Return to Work
16. Sport-Related Concussion & Return to Play
17. TBI-Induced Pituitary Dysfunction

### Geriatric Rehabilitation (4)
18. Hip Fracture Rehabilitation (Intertrochanteric)
19. Deconditioning & Falls Prevention
20. Total Knee Arthroplasty Rehabilitation
21. Polypharmacy & Medication Reconciliation

### Neurodegenerative (3)
22. Multiple Sclerosis (Relapsing-Remitting)
23. Parkinson's Disease Rehabilitation
24. Post-Polio Syndrome

### Musculoskeletal/Sports (5)
25. Adhesive Capsulitis (Frozen Shoulder)
26. Rotator Cuff Tear — Surgical vs Conservative
27. ACL Reconstruction Rehabilitation
28. Cervical Radiculopathy (C6)
29. Myofascial Pain Syndrome (Upper Trapezius)

### Pain Management (3)
30. Chronic Low Back Pain — Multidisciplinary Approach
31. Fibromyalgia
32. Phantom Limb Pain

### Pediatric (3)
33. Brachial Plexus Birth Injury (Erb's Palsy)
34. Tethered Cord Syndrome
35. Juvenile Idiopathic Arthritis

### Cardiac/Pulmonary (3)
36. Pulmonary Rehabilitation (COPD)
37. Heart Failure & Cardiac Rehab (Phase II)
38. Post-COVID Rehabilitation

### Cancer Rehabilitation (2)
39. Chemotherapy-Induced Peripheral Neuropathy
40. Metastatic Spinal Cord Compression

### Burn/Trauma (2)
41. Major Burn Rehabilitation (40% TBSA)
42. Polytrauma — Blast Injury with TBI + Amputation

### Neuromuscular/EDX (3)
43. Myasthenia Gravis
44. Charcot-Marie-Tooth Disease
45. Ulnar Neuropathy at the Elbow (Cubital Tunnel)

### Systems/Special Topics (5)
46. Complex Wheelchair Prescription & Seating
47. Independent Medical Examination (IME)
48. Chronic Opioid Tapering
49. Intrathecal Baclofen Pump — Spasticity Management
50. Dysvascular Amputation & Diabetic Foot Care
