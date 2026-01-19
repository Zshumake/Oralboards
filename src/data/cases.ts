export type Section = {
  title: string;
  content: string;
};

export type Case = {
  id: string;
  title: string;
  url: string;
  sections: Section[];
};

export const cases: Case[] =
  [
    {
      "id": "agitation",
      "title": "Agitation",
      "url": "https://www.pmrrecap.com/agitation",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "You are called to the brain injury unit to evaluate a patient with a history of TBI who has become increasingly agitated and irritable over the past 24 hours.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Is the patient currently a danger to himself or others?\n- How long ago was his TBI?\n- What severity was his TBI?\n- Are his current symptoms worse than his typical symptoms of agitation? How does his agitation typically manifest?\n- What is the patient\u2019s neurologic baseline and has there been any recent change from this baseline?\n- Are there any stimuli or circumstances which worsen his agitation or improve it?\n- Is he prescribed any medications to address his agitation? Has he been taking them?\n- Does the patient appear to be in pain?\n- Past Medical and Surgical History?\n- Family history?\n- Current medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- General appearance and current behaviors\n- Mental status examination\n- Cranial nerve examination\n- Manual muscle testing\n- Brief sensory examination if tolerated\n- Additional examination: heart, lungs, abdomen, extremities, skin - emphasis on looking for any pain generators or signs of other underlying etiology\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient\u2019s recent baseline is described as Ranchos Level 4: he is confused, disoriented, and agitated. You learn that over the past 24 hours he has become more irritable and has been refusing therapies, vital checks, and other care. On examination he is pacing his room and yells at you as you enter. While no new neurologic deficits are noted, your examination is limited by extremely poor participation.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this change in status?",
          "content": "- The differential diagnosis is broad, especially given the limited examination. New intracranial pathology (especially intracranial bleed, hydrocephalus, seizures) should be considered. I would also consider infection (especially UTI, pneumonia, meningitis). Hunger, pain, thirst, drug intoxication or withdrawal, medication toxicity, hypoxia, endocrine changes, metabolic disturbance, or other electrolyte disorders are also on my differential. Finally, the patient may just be overstimulated.\n"
        },
        {
          "title": "+ Would you order any labs or imaging at this time? If so, which specific tests?",
          "content": "- In the patient\u2019s current state it may be difficult to obtain labs or vitals. I would try to deescalate the patient before any labs or imaging. I would like to obtain at least a CT head and basic labs to start (CBC, BMP, and UA).\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- In general, what are the pros and cons of obtaining a CT head without contrast vs an MRI brain without contrast in a brain injured patient?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- CT studies can be done much more quickly and are less sensitive to patient motion. CTs without contrast show bone and intracranial bleeding better than MRIs, while MRIs show the brain tissue and other soft tissue in more detail. CTs can be safely done in patients with metal foreign bodies, implantable medical devices, etc, while the magnetic fields in MRIs could affect these devices or potentially cause patient harm. Unlike CTs, MRIs do not use ionizing radiation.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "Your workup, including CT head and labs, has been unremarkable and the patient has actually improved on his own. He remains confused and agitated but is tolerating therapies and appears much calmer. You suspect that his earlier aggression was due to his post-traumatic amnesia and confusion.\n\n"
        },
        {
          "title": "+ What steps would you take to prevent further episodes of aggression in the future?",
          "content": "- I would start with environmental modifications, including creating a quiet environment by turning off televisions and limiting visitors, reorientation as appropriate, adjusting lighting to promote appropriate sleep/wake cycles, and permitting a degree of psychomotor restlessness as part of the recovery process.\n- I would make sure that evening medications are ordered to promote sleep, such as melatonin or trazodone.\n- If other pharmacologic measures are needed to control dangerous behaviors, I would consider both scheduled and PRN medications. Scheduled medications may include propranolol, valproic acid, antidepressants, or atypical antipsychotics (among others). PRN medications may include atypical antipsychotics, trazodone, and potentially short-acting benzodiazepines.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "You notice that the patient had to wait over three hours to be transported down to his stat CT head at your hospital\u2019s radiology department.\n\n"
        },
        {
          "title": "+ How would you attempt to improve this process?",
          "content": "- A three-hour wait for a stat CT is unacceptable so I would want to find out how to prevent this in the future. I would start by collecting data on average wait times for CTs - I could potentially do this by looking at the times that orders are placed in the EMR and comparing them to when the CTs are actually recorded in the EMR. If a trend is noted, I would bring this to hospital administration and would ask if it is something that they are already aware of. It is likely that there is some \u201cweakest link\u201d in the process - potentially transport personnel availability, CT scanner availability, order processing time in the EMR, etc. I would strongly encourage them to address these deficiencies in order to provide the best possible patient care.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is our role-playing portion of the case.\n\nYour patient has been doing well. Your co-worker, another physician, approaches you one morning and says that he saw the patient\u2019s face in the evening news for circumstances surrounding his firearm-related TBI. Your co-worker asks you about his recovery.\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- \u201cI need to respect HIPAA for my patients, so I can\u2019t share any information about his care with you, but thank you for letting me know that this individual was in the news. \u201d\n- Note: You should not share any information about the patient. You should remain respectful in all of your interactions, even if you feel that someone else has made a mistake.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "amputee-care",
      "title": "Amputee Care",
      "url": "https://www.pmrrecap.com/amputee-care",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "You are consulted to provide post-amputation recommendations on a 53 year-old male who is 2 days postoperative from amputation surgery.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Which limb(s) was/were amputated and at what level(s)?\n- What is the reason and medical history for the amputation(s)?\n- Unilateral or bilateral?\n- Was there trauma involved?\n- Is there pain? Phantom sensation or phantom pain?\n- Is there a history of dysvascular disease?\n- Past medical and surgical history? Are chronic conditions controlled?\n- Were there any premorbid pain or functional issues?\n- Is the patient willing to do physical and/or occupational therapy extensively?\n- Does the patient want a prosthesis? If so, have they researched any options?\n- What sort of postoperative residual limb care has been advised?\n- Does the patient have and wear a shrinker? If so, how often?\n- Functional history and current functional status, including equipment usage?\n- Social history? Work status? Support network?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs, weight, BMI\n- Inspection\n- Palpation\n- Gait analysis\n- Manual muscle testing, sensation, reflex examination of bilateral upper and lower extremities\n- Amputated limb compared to intact limb (size, length, diameter, skin, edema, color comparisons)\n- Surgical wound inspection, suture evaluation\n- Special testing as indicated by history.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Why is the length of the residual limb important to know?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The length of the residual limb determines the type of prosthesis the patient is a candidate to receive, as well as the components of that prosthesis, depending on how much space there is to fit those components into. In general, the shorter the residual limb length, the less functional the residual limb is.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- In a transfemoral amputation, what is the ideal residual limb shape? Please also describe the differences between a quadrilateral and ischial containment socket.\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The ideal residual limb shape in a transfemoral amputation is conical. A quadrilateral socket is narrow in the anteroposterior dimension and wide in the mediolateral dimension. This is an older socket type. The ischial containment socket allows for weight-bearing upon the medial ischium, and has narrow mediolateral dimensions in contrast to the quadrilateral socket. It encourages a more adducted and flexed position of the femur to facilitate a normal gait, in addition to improved distribution of weight-bearing forces by the residual limb in comparison to the quadrilateral socket.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 53 year-old male with a past medical history of type 2 diabetes mellitus (hemoglobin A1C is 6.7%) who underwent a right transtibial amputation 2 days ago without complications. He works as a mail carrier, walking 20 miles daily, and is eager to get back to the job with a prosthesis. His pain is controlled. He wears his shrinker 16 hours per day. On exam, the residual limb tibial length is 33% of the contralateral tibia. His BMI is 25. You can passively range his right hip to 5 degrees of flexion but no further extension beyond that point. The residual limb wound is clean without drainage, and is sensitive to light touch.\n\n"
        },
        {
          "title": "+ What are the most common causes of upper and lower limb amputation, respectively?",
          "content": "- Trauma and dysvascular disease (hypertension, diabetes, hyperlipidemia, etc.)\n"
        },
        {
          "title": "+ What further workup would you need in this patient?",
          "content": "- No further workup is necessary at this point from a rehabilitation standpoint.\n"
        },
        {
          "title": "+ What immediate prosthesis recommendations would you make for this patient?",
          "content": "- At this time, the immediate postoperative period, I would typically recommend no prosthesis be worn yet. We need to wait while the incision heals and ensure there are no postoperative complications before fitting the patient with a temporary prosthesis. A temporary prosthesis could be expected within 2-6 weeks following amputation surgery.\n"
        },
        {
          "title": "+ What are your initial recommendations for this patient?",
          "content": "- I would counsel the patient that losing a limb is very difficult and can both physically and psychologically challenging. I would recommend counseling and peer support groups to help cope with the loss of limb and loss of independence. I would advise that he wear his residual limb shrinker for 24 hours daily, only removing for wound/residual limb cleaning, until the limb edema has stabilized, which can take months. Wash the wound daily with gentle soap and water, pat dry and air dry. Maintain contact with the limb, desensitize the wound and skin with frequent touch, employ daily scar massage and mobility exercises. Maintain proper skin moisturization and avoid sweating excessively in the residual limb (use antiperspirant if needed). Attend physical and/or occupational therapy for functional rehabilitation prior to and after receiving the definitive prosthesis. Depending on the status of the patient's healing residual limb, we could potentially fit the limb for a temporary prosthesis approximately 2-6 weeks following amputation surgery. This would serve to condition and prepare the residual limb for weight-bearing forces it will encounter during its definitive prosthesis stage. Lie prone for 15-20 minutes three times daily to maintain adequate hip extension and avoid hip flexion contracture. When sitting, extend the knee fully to avoid knee flexion contracture. Acetaminophen and/or NSAIDs for nociceptive pain, and consider gabapentin for neuropathic pain. I will see the patient in follow-up periodically over the next several months to determine when ready for definitive prosthesis.\nThe patient returns to you 4 months following his amputation. He notes he still can feel the absent portion of his limb, even though it has been amputated.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would advise the patient that feeling like the distal part of the limb is still there is a common phenomenon called phantom sensation. It can become painful, in which case neuropathic pain medication such as gabapentin can be helpful. Phantom sensation by itself is not of clinical concern unless it becomes bothersome to the patient.\nYou deem that the patient is ready to be fitted for a definitive prosthesis.\n\n"
        },
        {
          "title": "+ What would you anticipate this patient\u2019s K level to be? Please define the different K levels.",
          "content": "- The K levels are defined by Medicare as designations of how functional of an ambulator a patient is.\n- K0: Nonambulatory.\n- K1: Limited household ambulator who ambulates at a fixed cadence.\n- K2: Unlimited household ambulator; limited community ambulator; ambulates at a fixed cadence.\n- K3: Unlimited community ambulator; variable cadence.\n- K4: High impact sports activities; variable cadence.\n- This patient is projected as a K3 ambulator due to his past history of excellent ambulation distances (walking 20 miles daily as a mail carrier).\n"
        },
        {
          "title": "+ Describe your prosthesis prescription for this patient.",
          "content": "- This patient should be fitted with a prosthesis suitable for a K3 ambulator. Thus, I would order the following:\n- Suspension: Locking pin. Would consider suction suspension if patient prefers.\n- Socket: Patellar tendon-bearing, flexible inner socket with a hard outer shell to provide a total contact fit.\n- Pylon to serve as the replacement tibia.\n- Foot unit: Multiaxis foot for traversing uneven terrain and allowing motion of plantar- and dorsiflexion and inversion-eversion planes.\n- Prosthetic cover for cosmesis.\nNote: There is of course some wiggle room with prosthesis prescriptions. As long as you confidently state some reasonable prosthesis prescription for the patient's K level while addressing all prosthesis components, your prescription will be acceptable.\n\nThe patient returns to clinic 6 months later, generally enjoying their prosthesis. On examination, you note many discolored wart-appearing papules over the swollen distal residual limb.\n\n"
        },
        {
          "title": "+ What is the most likely diagnosis, etiology, and treatment for this problem?",
          "content": "- This is most likely verrucous hyperplasia, a result of poor residual limb total contact with the socket (e.g. the distal residual limb may hang without contacting the bottom of the socket completely). Treatment involves efforts to restore a total contact fit. This may be through increasing sock ply or reshaping/refabricating the socket itself to allow for a total contact fit.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient notes an uncomfortable swelling in their popliteal fossa. Examination reveals a soft, compressible mass that is tender to palpate. He tried and failed ice and NSAIDs for this problem.\n\n"
        },
        {
          "title": "+ What would you do next for this patient?",
          "content": "- I would order a diagnostic ultrasound scan, as this is likely a cyst, and ultrasound will be cheaper, faster, and less claustrophobic for the patient than an MRI scan.\n- Note: This is the key question for this case in this Domain. Always be mindful of cost and patient comfort with your studies. Remember that you work within a healthcare system, and paying attention to cost is going to be an important part of your practice.\n"
        },
        {
          "title": "+ Your choices result in the following:",
          "content": "- Ultrasound scan reveals a cyst lying at the confluence of the medial head of the gastrocnemius and the semimembranosus.\n"
        },
        {
          "title": "+ Challenge Question:",
          "content": "- What is the name of a cyst in this location?\n"
        },
        {
          "title": "+ Challenge Answer:",
          "content": "- Baker cyst.\n"
        },
        {
          "title": "+ How would you treat this problem?",
          "content": "- I would advise cyst drainage with corticosteroid injection under ultrasound guidance.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "You read an online review of yourself posted by this patient. He has rated you 1 star out of 5, noting that you said something inappropriate and offensive to him at one of your visits. He comes in the following week for follow-up. Pretend that I am the patient.\n\n"
        },
        {
          "title": "+ How would you handle this situation?",
          "content": "- It would be reasonable to continue to provide respectful, high quality care without mentioning the poor review. If you opt to mention the review, a proper conversation should start similarly to below.\n- \u201cThank you for coming in today. It has been so wonderful to watch and be an active part of your rehabilitation and functional improvements. I know you have been on a long road to get to where you are today, and I sincerely congratulate you on your efforts. Unfortunately I did happen to come across an online review that seemed to be written by yourself, noting some inappropriate behavior on my part. I just wanted to take the moment to emphasize that I support you and will continue to remain on your side throughout your lifelong rehabilitation process, and am here to serve your rehabilitation needs regarding whatever challenges you may face. I want to assure you that I would never intentionally say or do anything to make you feel uncomfortable, offended, or unwelcome. I hope that we can have a healthy discourse and relationship going forward, and I welcome you to share your honest thoughts with my care in your case so that I can help improve the care for you and all of my patients.\u201d\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "bilateralshoulderpain",
      "title": "Bilateral Shoulder Pain",
      "url": "https://www.pmrrecap.com/bilateralshoulderpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 54 year-old female presents to your office with 2 months of bilateral shoulder pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin?\n- Was there injury/trauma?\n- Where exactly is the pain? Quality, duration, aggravating/alleviating factors, radiation?\n- Has this ever happened before?\n- Is there stiffness, fever, weakness, numbness, or tingling?\n- What has she tried so far to alleviate the problem? Medications, therapy, bracing, injections, surgery?\n- Has she had any workup already for this problem?\n- Is she active?\n- Functional history and current functional status?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation of bilateral shoulders\n- Manual muscle testing of bilateral upper limbs (would include rotator cuff isolation testing here)\n- Sensory and reflex examination of bilateral upper limbs\n- Passive and active range of motion evaluation of the shoulders and neck\n- Special testing: Spurling, Neer, Hawkins, Painful Arc, Empty Can, Speed, O\u2019Brien, Scarf\n"
        },
        {
          "title": "+ Challenge Question #1",
          "content": "- The patient states she has also felt like she has had fevers and shoulder stiffness for 1-2 hours each morning. What else would you like to know?\n"
        },
        {
          "title": "+ Challenge Answer #1",
          "content": "- I would ask if she has experienced any weight loss, headaches, jaw claudication, fatigue, malaise, or vision changes.\n"
        },
        {
          "title": "+ Challenge Question #2",
          "content": "- What are you hoping to learn by asking about those signs and symptoms?\n"
        },
        {
          "title": "+ Challenge Answer #2",
          "content": "- I want to help elucidate if she might be suffering from a rheumatologic condition, such as rheumatoid arthritis, systemic lupus erythematosus, or polymyalgia rheumatica, for example.\n"
        },
        {
          "title": "+ Challenge Question #3",
          "content": "- Why is it important to ask about headaches or jaw claudication symptoms?\n"
        },
        {
          "title": "+ Challenge Answer #3",
          "content": "- These symptoms may indicate giant cell arteritis (GCA/temporal arteritis), which can results in blindness if not treated promptly with high-dose corticosteroids.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "You discover that this patient has a past medical history of right total knee replacement, and has experienced 2 months of gradual onset bilateral aching shoulder pain with generalized fatigue along with morning stiffness that lasts 1-2 hours. She denies trauma, vision changes, headaches, other pains, or previous workup. On physical examination, vital signs are within normal limits. She has pain with bilateral active shoulder abduction and positive Neer and Hawkins testing.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Polymyalgia rheumatica, subacromial subdeltoid bursitis, rotator cuff (supraspinatus) impingement or tear, biceps tenosynovitis, glenohumeral osteoarthritis, rheumatoid arthritis, systemic lupus erythematosus, giant cell (temporal) arteritis, dermatomyositis, polymyositis, multiple myeloma, fibromyalgia, cervical radiculopathy, cervical spondylosis.\n"
        },
        {
          "title": "+ What specific workup would you arrange for this patient?",
          "content": "- I would order bloodwork, starting with a basic metabolic panel (BMP), complete blood count (CBC), erythrocyte sedimentation rate (ESR), and c-reactive protein (CRP). I would start physical therapy for musculotendinous reconditioning and functional improvement as well. I would advise acetaminophen and over-the-counter NSAIDs such as ibuprofen for pain control. She may try topical heat and/or ice for symptomatic relief. I would like to see her back in the office in 6 weeks to see how she is doing.\n"
        },
        {
          "title": "+ Her workup returns as follows:",
          "content": "- BMP: within normal limits\n- CBC: within normal limits\n- ESR: elevated\n- CRP: elevated\n"
        },
        {
          "title": "+ What are your specific management recommendations for this patient?",
          "content": "- I would call the patient or see her in the office, depending on when the lab results returned and how imminent her follow-up appointment with me is. I would discuss the need to start oral corticosteroids (prednisone) and discuss a rheumatologist referral, as I have concerns about rheumatologic disease at this point, namely polymyalgia rheumatica. I would also discuss polymyalgia as a diagnosis and explain what it means and how it is treated. I would ensure all questions are answered to the patient\u2019s satisfaction.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient agrees to start oral corticosteroids.\n\n"
        },
        {
          "title": "+ How would you make your decision on what dosage of steroids to start this patient on?",
          "content": "- In the immediate term I would review published guidelines from the American College of Rheumatology on corticosteroid dosing in suspected polymyalgia rheumatica. If unsatisfactory, I would reach out to the consulted rheumatologist for recommendations until they are able to evaluate the patient and assume care.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient returns to your office 6 months later. She states that her diseased has caused her blindness, and she has had to file for disability because of this. This is the role-playing portion of this case. I will be acting as the patient.\n\nPatient: \u201cDoctor, frankly, I am extremely disappointed and upset with you. You made me go blind! I can no longer see my family or other loved ones because of your mismanagement. My life is ruined. I seriously hope you retire soon.\u201d\n\n"
        },
        {
          "title": "+ Your response?",
          "content": "- \u201cI am so sorry that your condition has led to blindness. That must be so incredibly difficult and life-changing. Unfortunately your condition (PMR) is known to be related to another condition called temporal arteritis (GCA), which itself can lead to blindness. However, at your visit with me, you exhibited no signs or symptoms that would suggest you required urgent treatment or workup for potential GCA. We started you on oral corticosteroids and referred you to a rheumatologist for further management of this rheumatologic condition. I also made certain to follow all of the guidelines exactly as published by the American College of Rheumatology for this condition, as is documented in the electronic medical record. Again, I am so sorry that this condition has led to this life-changing disability for you. I want you to know that I am here for you if there is anything you would like me to assist with in the future, including directing your physical therapy (if needed at this point), or for any other problems that might arise within my expertise. I would also be more than happy to reach out to your rheumatologist to discuss your case personally. Are there any other questions you have that I can help answer today?\u201d\n- The key here is to remember to ally yourself with the patient (always \u201cyou and the patient vs. the problem\u201d, not \u201cyou vs. the patient\u201d, even if the patient appears adversarial. It is ok to politely but firmly re-establish that you followed all proper guidelines, and that unfortunately sometimes we cannot predict how diseases will progress. In all likelihood this patient will not have progressed to full-blown GCA/blindness in the real world, as she exhibited no red flags to warrant aggressive steroids and temporal artery biopsy. Low-dose steroids are the mainstay of treatment for PMR in the absence of signs or symptoms of GCA/temporal arteritis.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "bilateralshoulderpain2",
      "title": "Bilateral Shoulder Pain 2",
      "url": "https://www.pmrrecap.com/bilateralshoulderpain2",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 48 year-old male with a history of C8 ASIA A injury presents with 3 months of worsening shoulder pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset and context of symptoms?\n- Location, duration, intensity, quality, radiation, constant/intermittent, aggravating/alleviating factors?\n- Is the pain unilateral or bilateral?\n- Is there associated changes in terms of weakness, numbness, tingling, bowel/bladder dysfunction?\n- What is the history of the SCI? How long ago was it, what was the etiology, hospital course, workup, treatment, etc.?\n- Any workup or treatment so far for this pain?\n- Functional history and current functional status, including equipment usage?\n- What kind of wheelchair does the patient use? Manual/power? How old is the chair? Is it in a good state?\n- Family history?\n- Past Medical and Surgical History?\n- Social and work history?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Manual muscle testing of bilateral upper and lower extremities\n- Sensory and reflex testing of bilateral upper and lower extremities\n- Special testing: Hawkins, Neer, O\u2019Brien, Speed, Painful Arc, Empty Can, Drop Arm Test, Scarf\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 48 year-old male who sustained a traumatic C8 ASIA A injury 3 years ago in a surfing accident. He is modified independent and utilizes a manual wheelchair for mobility. On physical examination, he demonstrates 5/5 strength in elbow flexion, wrist extension, and elbow extension bilaterally, with 3/5 strength in his finger flexors, 0/5 strength in 5th digit abduction bilaterally, and 0/5 strength in bilateral lower extremities. He has 3+ patellar and achilles reflexes with several beats of ankle clonus bilaterally. He has pain with Hawkins and Empty Can maneuvers bilaterally. His wheelchair appears to fit him well and be in good condition.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's shoulder pain?",
          "content": "- Rotator cuff tear, rotator cuff impingement, subacromial bursitis, glenohumeral joint arthritis, acromioclavicular arthritis, myofascial pain, cervical radiculopathy, Parsonage-Turner Syndrome\n"
        },
        {
          "title": "+ How would you proceed with this patient?",
          "content": "- Bilateral shoulder x-rays\n- Physical therapy\n- Oral acetaminophen and/or NSAIDs, topical ice/heat, topical diclofenac gel\n- Consider shoulder injections (subacromial bursa, glenohumeral joint, acromioclavicular joint)\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What would you write on the physical therapy prescription?**\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Physical therapy: 2-3 times per week for 6-8 weeks, focused on strengthening posterior shoulder girdle/rotator cuff and scapular stabilizer musculature, with stretching of anterior shoulder musculature. Heat, ice, massage as needed. Home exercise program.\n- These patients often have an imbalance of anterior \"pushing\" muscles being far stronger than posterior \"pull\" muscles.\n"
        },
        {
          "title": "Workup reveals:",
          "content": "- Bilateral shoulder x-rays: mild glenohumeral joint space narrowing with subchondral sclerosis.\nBilateral shoulder x-rays: mild glenohumeral joint space narrowing with subchondral sclerosis.\n\n- The patient performs your suggested treatment regimen and returns to your office 2 months later noting no improvement in pain. You perform bilateral subacromial bursa corticosteroid injections with minimal benefit.\nThe patient performs your suggested treatment regimen and returns to your office 2 months later noting no improvement in pain. You perform bilateral subacromial bursa corticosteroid injections with minimal benefit.\n\n"
        },
        {
          "title": "+ What is your next step, and why?",
          "content": "- MRI of bilateral shoulders to better elucidate the cause of the patient's pain by examining soft tissue structures such as the rotator cuff musculature, bursae, articular cartilage, and labrum.\n"
        },
        {
          "title": "+ Your next step leads to the following:",
          "content": "- MRI of bilateral shoulders reveals no significant soft tissue abnormalities. There is again minimal degenerative changes of the glenohumeral joint bilaterally.\n- You inform the patient of these results.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient notes that his pain is worsening and he can no longer work at the post office.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would repeat vital signs and physical exam to see if anything has changed objectively. I would inquire as to any symptomatic or neurologic changes.\n"
        },
        {
          "title": "+ Further investigation reveals the following:",
          "content": "- The patient feels weaker in his arms, specifically that it is more difficult to push his wheelchair over the past few weeks. On examination, he demonstrates increased hyperreflexia compared to baseline.\n"
        },
        {
          "title": "+ What is your next step, and why?",
          "content": "- I would obtain an MRI of the cervical spine. I am concerned for a progressive lesion in the cervical spinal cord, given the patient\u2019s worsening pain, weakness, and hyperreflexia.\n"
        },
        {
          "title": "+ Your next step leads to the following:",
          "content": "- MRI of the cervical spine reveals a cystic intramedullary expansion spanning from C5-T2.\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- Neurosurgery consultation for syringomyelia to consider possible shunting and/or other surgical interventions. I would also discuss that short-term disability permissions is a reasonable pursuit at this time, and that I am happy to assist with the necessary paperwork.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "You recommend neurosurgical consultation to the patient. This is the role-playing portion of our case. Pretend that I\u2019m the patient.\n\nPatient: \u201cDoctor, I actually feel like the therapy and home exercises have started to kick in. I know if I keep lifting weights and getting stronger my pain will get better. I\u2019m not going to see the surgeon.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I am so glad that you are so invested in your health! You have faced a lot of challenges, and your motivation and discipline to improve yourself is admirable. Unfortunately, given that we were not able to identify a true source of your pain in your shoulders, and that our interventions did not provide you significant benefit until possibly right now, the most likely cause of your symptoms is actually the fluid that has built up in your neck that we identified on MRI. This is not something that can be rehabilitated with physical therapy and exercise, and does require surgical intervention to treat, or we risk losing more function in your arms in terms of strength and sensation. Please let me know if any of that does not make sense, and I would be more than happy to explain in more detail. In addition, what particular concerns do you have about speaking with a neurosurgeon? Is there anything about this consult that I can help explain? I want to reassure you that we are not signing you up for surgery; we are merely exploring your options and having a conversation with a neurosurgeon to see what he or she might be able to offer you. Does that sound all right? Would you possibly be open to seeing the neurosurgeon and listening to their thoughts?\n- Note: Always keep syringomyelia in mind in patients with history of SCI who develop progressive pain or functional loss. This diagnosis can be easy to miss!\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "calfdiscomfort",
      "title": "Calf Discomfort",
      "url": "https://www.pmrrecap.com/calfdiscomfort",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 48 year old woman is admitted to your brain injury unit and is regaining function after a moderate brain injury with a right subdural hematoma. She complains of new-onset progressively-worsening left calf pain and discomfort.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What are the pain characteristics? What is the onset, context, location, duration, aggravating/alleviating factors, radiation, quality, severity?\n- Was there trauma/injury?\n- Has there been any swelling, spasticity, muscle tightness, skin changes, or numbness/tingling?\n- Have there been any functional changes?\n- Has this pain ever occurred before?\n- Have there been any fevers or chills?\n- Has there been any workup or imaging?\n- Past medical and surgical history?\n- Medications including DVT prophylaxis?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs (note any fever, tachycardia to suggest pain or sepsis, hypotension to suggest sepsis, or hypoxia to suggest pulmonary embolism)\n- Inspection (note any skin changes, atrophy, deformities, swelling, positioning abnormalities)\n- Palpation of the affected leg (note any edema, point tenderness)\n- Passive and active range of motion at the bilateral hips, knees, and ankles\n- Manual muscle testing of the bilateral lower extremities\n- Sensory testing (note any sensation changes or allodynia)\n- The affected leg should be compared to the contralateral leg in all of the above testing\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient states that her left calf pain started two days ago without any inciting trauma. Pain is localized to the calf and is described as aching and progressively worsening. On examination, the patient is mildly tachycardic. There is mild swelling at the left foot and calf. Passive ROM and palpation aggravate the pain. The left leg is also noted to be weak and has diminished sensation.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for her calf pain?",
          "content": "- Lower extremity DVT given unilateral pain and swelling, spasticity or muscle spasms given weakness on the affected side, neuropathic pain given impaired sensation on the affected side, cellulitis given unilateral pain and tenderness, fracture given unilateral pain and tenderness; other diagnoses to consider include lumbar radiculopathy, peripheral neuropathy, contusion, delayed onset muscle soreness, sprain, tendonitis, arthritis\n"
        },
        {
          "title": "+ What initial tests would you order?",
          "content": "- I would order venous doppler ultrasounds of the bilateral lower extremities to rule out DVT. I would also order a CBC to check for leukocytosis. If these tests came back negative then I would consider x-ray imaging of the left lower extremity.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "Doppler venous ultrasound reveals a left common femoral deep venous thrombosis. You elect to obtain a CT angiogram of the chest, which comes back negative for pulmonary embolism. CT head obtained earlier in the day revealed stable right subdural hematoma, slightly improved in size compared to the initial study 10 days ago.\n\n"
        },
        {
          "title": "+ How would you manage this condition?",
          "content": "- This is a difficult case because the patient has a new proximal DVT, which could progress to a life-threatening pulmonary embolism if left untreated. On the other hand, she has had a recent subdural hematoma which has not resolved on CT head, and anticoagulation could worsen this bleed which would likely worsen morbidity or mortality if it was to occur. My first step would be to place the patient on bedrest and to inform her of her condition. I would then reach out to her neurosurgical team for clearance to start anticoagulation. If clearance is obtained, I would start full dose therapeutic anticoagulation, such as IV heparin, weight-based enoxaparin, or oral agents. If clearance is not obtained, I would place an IVC filter to stop venous thromboemboli from traveling to the lungs. If unable to reach the neurosurgical team, the decision to start anticoagulation or place an IVC filter would require careful weighing of the bleeding risk and discussion with the patient and/or POA.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- The neurosurgical team clears the patient for anticoagulation but hangs up before you decide on an agent. What are the practical pros and cons of IV heparin vs an oral anticoagulant such as apixaban?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- IV heparin is more difficult to administer, requiring IV access and management of IV tubing as well as frequent blood draws to check levels, compared to oral agents which are relatively easy to administer. The benefit of IV heparin is that it can be discontinued quickly if the patient develops a new bleed or any concerning neurologic findings during administration, while oral agents are much more difficult to reverse.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "More and more patients on your inpatient rehabilitation unit are found to have venous thromboemboli. You notice that many of these patients have come from one referring hospital in particular, while patients from other referring hospitals have much lower rates of DVTs.\n\n"
        },
        {
          "title": "+ What steps would you take to address this problem?",
          "content": "- I would begin by reviewing the actual percentages of patients with venous thromboemboli from this hospital compared to other hospitals in order to verify that there was a true discrepancy between this hospital and others. I would then review individual patient charts to see if something had been missed on acute care or in the transition process, paying close attention to DVT prophylaxis administration both on acute care and at inpatient rehabilitation. Perhaps the acute care hospital had not been giving DVT chemoprophylaxis, or perhaps there was a missing piece in my inpatient rehabilitation unit\u2019s admitting process that caused us to forget to give chemoprophylaxis while at rehab. It is also possible that there is a different underlying reason including patient population or other comorbidities that could contribute to the higher rate of DVTs from this hospital. Once the issue is identified, I would discuss this with my department chair and likely reach out to representatives at the acute care hospital including department chairs, unit directors, or patient safety officers in order to fix the issue.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "A patient arrives to your inpatient rehabilitation unit from an acute care hospital. On your admission examination you notice left leg swelling so you immediately send the patient for venous doppler ultrasounds and you find a new DVT and PE. The patient is cognitively intact and is calm when you tell her about the new venous thromboemboli and initiate treatment, but the next morning you get a call from her father who says \u201cDoctor, the acute care hospital missed a diagnosis that could have killed my daughter. This is entirely unacceptable. I am going to speak to my lawyer today and sue them for everything they\u2019re worth.\u201d\n\n"
        },
        {
          "title": "+ How would you respond?",
          "content": "- \u201cThank you for calling me to discuss this issue. I would be happy to discuss it with you but first I need your daughter\u2019s permission to discuss this with you.\u201d\n- Wait for the examiner\u2019s response. If no permission is granted, stop the conversation. If permission is granted, then continue.\n- \u201cI understand that it is extremely frustrating to learn about another diagnosis and setback after everything that your daughter has been through. We were looking forward to starting her rehabilitation program with her and are now met with this new setback, which I am sure is very difficult and frustrating for you and for your daughter. I recommend that you reach out to the patient\u2019s last doctor to discuss your concerns and get more clarification. DVTs and PEs are unfortunately a common complication for people who are hospitalized and less mobile than they are used to being. It\u2019s also important to realize that patients can have DVTs or PEs without any signs or symptoms. The good news is that we were able to identify this issue before it progressed to a life-threatening condition. She is getting the appropriate treatment and we will be able to start our rehabilitation program without a significant delay. She is clinically stable and doing quite well. Do you have any other questions about her care plan?\u201d\n- Note: The question of whether or not to sue another healthcare provider or hospital is always difficult. As with any case, you should make sure that you have a patient\u2019s permission to speak with a family member or acquaintance before starting your conversation. In cases where you are asked about litigation, the most important thing to do in the beginning is to show empathy and understanding of the situation. You want to diffuse the situation as much as possible by showing that you understand the frustration that they are experiencing, and this will build rapport with the patient or family member who is calling you. After you have expressed your understanding of the situation, it is best to AVOID making any judgements on another provider\u2019s care. You should always defer to the other provider and recommend that they schedule an appointment with the other provider to discuss the case and get more information. You should then offer assurance and your insight on rehabilitation progress or potential if appropriate.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "difficultywalking",
      "title": "Difficulty Walking",
      "url": "https://www.pmrrecap.com/difficultywalking",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 57 year-old male presents with 5 days of difficulty walking.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset? Context of symptoms?\n- Describe the walking difficulty in more detail, what it feels like, what particularly is difficult about walking?\n- Was there trauma/injury?\n- Is there numbness/tingling/weakness/bowel or bladder deficits?\n- Is there pain? Specifically neck or back pain?\n- Any falls recently?\n- Any history of diabetes?\n- Any recent infections or illnesses?\n- Any fever, chills, shortness of breath, nausea, vomiting, diarrhea, palpitations, rashes, or vision changes?\n- Any recent weight changes?\n- Past Medical/Surgical History?\n- Family History?\n- Social History? Work status?\n- Functional History and current functional status? Any assistive devices?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Gait analysis\n- Cranial nerve examination\n- Manual muscle testing, reflexes, sensation testing of all four limbs\n- Special testing as indicated by history/exam in addition to Babinski, Hoffman, straight leg raise, and slump sit tests.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 57 year-old male, previously independent, with a history of hypertension and type 2 diabetes mellitus who presents with the gradual onset of 5 days of progressive difficulty walking. He denies falls or injury, but complains of back pain. He describes the difficulty as leg heaviness and unsteadiness, and has been resorting to using a walker for stability. He denies fever or chills, but feels like he might have had diarrhea 1 month ago. On exam he demonstrates intact strength except for 1/5 strength of plantarflexion, dorsiflexion, and great toe extension bilaterally. Reflexes are absent in bilateral achilles and 1+ in the patellae.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Guillain-Barre Syndrome (Acute Inflammatory Demyelinating Polyradiculopathy - AIDP), Chronic Inflammatory Demyelinating Polyneuropathy (CIDP), lumbosacral radiculopathy, diabetic radiculoplexopathy, polymyositis, Lambert-Eaton Myasthenic Syndrome (LEMS), myasthenia gravis, botulism, cervical myelopathy, sciatic neuropathy, lumbosacral plexopathy, conversion disorder, transverse myelitis, multiple sclerosis, mononeuritis multiplex, peripheral polyneuropathy, amyotrophic lateral sclerosis (ALS), PLS.\n"
        },
        {
          "title": "+ What are your next steps in the workup of this problem?",
          "content": "- CBC, CMP, ESR, CRP\n- Lumbar puncture with CSF analysis\n- EMG/nerve conduction studies of bilateral lower extremities\n- MRI brain/CTL spine\n"
        },
        {
          "title": "+ The results of your workup are noted below:",
          "content": "- Laboratory workup is grossly unremarkable.\n- Lumbar puncture with CSF analysis reveals increased CSF protein with normal white blood count (WBC).\n- EMG/nerve conduction studies of bilateral lower limbs are normal.\n- MRI brain and cervicothoracic spine is normal. MRI lumbar spine reveals increased signal in the lumbosacral nerve roots.\n"
        },
        {
          "title": "+ What is the most likely diagnosis?",
          "content": "- Guillain-Barre Syndrome (AIDP).\n"
        },
        {
          "title": "+ Challenge Question #1",
          "content": "- How do you explain the normal EMG/NCS findings in this patient?\n"
        },
        {
          "title": "+ Challenge Answer #1",
          "content": "- With only 5 days of symptoms, it is likely too early for AIDP to be manifested on EMG/NCS at this point in time. Ideally we would repeat the EMG/NCS at roughly 2 weeks of symptoms for maximal diagnostic utility.\n"
        },
        {
          "title": "+ Challenge Question #2",
          "content": "- Describe the electrodiagnostic findings you would expect to see in a case of demyelinating Guillain-Barre Syndrome (AIDP).\n"
        },
        {
          "title": "+ Challenge Answer #2",
          "content": "- The earliest expected findings would be prolonged latency of F-waves. I would also expect to see prolonged distal latencies, conduction block at non-entrapment sites, and abnormal temporal dispersion. Needle EMG exam would likely reveal decreased recruitment of motor units.\n"
        },
        {
          "title": "+ Explain the etiology and mechanism of Guillain-Barre Syndrome (AIDP).",
          "content": "- GBS/AIDP is the result of a bacterial or viral infection leading to the body producing an immune response against the foreign pathogen. Certain proteins on the foreign pathogen can mimic proteins found on peripheral nerve myelin or axons, leading to the body destroying these self proteins in the process of eradicating the infection. With myelin and potentially even axons destroyed, the peripheral nerves do not function properly, and weakness is developed.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would recommend the patient be admitted to the hospital with stat neurology consult placed. ICU admission should be considered depending on the patient\u2019s autonomic and cardiorespiratory status. I would recommend stat IVIG/plasmapheresis to help halt circulating antibodies from continuing to destroy myelin and/or axons. Supportive cardiorespiratory care as indicated by the patient\u2019s clinical status. I would recommend physical and occupational therapy consults; ultimately the patient may require inpatient rehabilitation admission once medically stable. For pain I would advise acetaminophen, NSAIDs, potentially antineuropathic pain medication, and if severe enough, opioid pain medication. Repeat EMG/NCS should be performed in approximately 1 week.\n"
        },
        {
          "title": "+ What specific steps would you take to facilitate a hospital admission for this patient?",
          "content": "- I would call the hospital directly and ask to perform a direct admission from clinic. I would ask to speak with the accepting physician and relay all pertinent patient information to facilitate a swift and safe transfer of care. If admission is not granted for any reason, I would recommend the patient present to the emergency department immediately for evaluation, and in that case I would call the ED directly to relay pertinent information and my recommendations for care. I would ensure that all questions are answered from all parties and that the patient is in agreement with the plan. I would educate the patient on rationale for all of my actions, and about the disease process and treatment options.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "You receive a call a few hours later by the internal medicine physician covering this patient. Pretend that I am this physician.\n\nInternal medicine physician: \u201cWhy didn\u2019t you start steroids? This is an inflammatory process. Every delay of care worsens his prognosis for walking again.\u201d\n\n"
        },
        {
          "title": "+ Your response:",
          "content": "- I would be delighted to discuss this case with you. Thank you so much for caring for this unfortunate gentleman. After receiving the diagnostic results, GBS/AIDP became the most likely diagnosis, and you are absolutely correct that immediate action is paramount to maintaining the best prognosis for functional recovery in this patient, which is why I immediately recommended hospital admission for stat IVIG/plasmapheresis. May I ask your further thoughts on this case, and what your understanding of the disease process is?\n"
        },
        {
          "title": "+ The internal medicine physician's response:",
          "content": "- \u201cYeah, of course, it\u2019s an inflammatory process, and you wasted time that could have been better served with an initial steroid bolus while he awaits admission. These patients do better with steroids, and you should know that. Why didn\u2019t you start something?\u201d\n"
        },
        {
          "title": "+ Your response:",
          "content": "- This is a great question! The literature does not support the use of corticosteroids in GBS/AIDP. They have not been shown to provide functional benefit or treat the disease process. In CIDP, a disease related to GBS/AIDP, corticosteroids actually do serve a purpose and are indicated. However, in this patient\u2019s case, steroids are unfortunately not indicated, and prompt removal of circulating antibodies via IVIG/plasmapheresis is of prime importance. I hope this helps to answer your question. I would otherwise be more than happy to further explain my rationale. Does that treatment plan and rationale sound all right, as I have outlined?\n- Note: Do not be adversarial; educate and align yourself with this treating physician, and ensure that proper treatment is being followed at the same time. Unnecessary corticosteroids would not be a harmless intervention, and should be minimized if possible.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "disorderofconsciousness",
      "title": "Disorder of Consciousness",
      "url": "https://www.pmrrecap.com/disorderofconsciousness",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "You are consulted on a 34 year old woman with a disorder of consciousness secondary to traumatic brain injury.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What are the circumstances surrounding the patient\u2019s TBI (mechanism of injury, time since injury, other concomitant injuries).\n- Describe the patient\u2019s hospital course?\n- Describe the patient\u2019s recent neurologic status. Is there evidence of sleep-wake cycles or eye opening? Has she followed any commands? Are there any spontaneous or purposeful movements? Has she vocalized?\n- Describe recent imaging?\n- Recent vital signs?\n- Does the patient appear to be in pain?\n- Past medical and surgical history?\n- Family history?\n- Current medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs?\n- General appearance?\n- Arousal (is the patient attentive; are her eyes open with or without stimulation?)\n- Communication (any attempts at intentional communication?)\n- Command following?\n- Verbalizations or oral movements?\n- Movement of extremities (spontaneous or purposeful?)\n- Object use?\n- Visual pursuit, fixation, or startle?\n- Withdrawal to pain?\n- Within the limits of command following, cranial nerve examination, manual muscle testing, sensory examination?\n- Reflexes and tone/spasticity?\n- Additional examination: heart, lungs, abdomen, extremities, skin\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient was involved in a motor vehicle accident two weeks ago and she remains in the ICU in a minimally conscious state. She required a craniectomy due to a large subdural hematoma. The patient has been intermittently tachycardic and febrile.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's tachycardia?",
          "content": "- Infection/sepsis (commonly pneumonia, urinary tract infection, bacteremia, intracranial infection), venous thromboembolism (DVT or PE), pain, volume depletion, anemia, cardiac abnormality such as atrial fibrillation or SVT, hypoxia, paroxysmal sympathetic hyperactivity (storming), medication-induced (stimulants), hyperthyroidism, withdrawal.\n"
        },
        {
          "title": "+ What initial tests would you order to workup the tachycardia?",
          "content": "- The patient is unable to provide a history, so a broad workup would be appropriate. CBC, CMP, TSH/T4, urinalysis, blood cultures, and chest x-ray should be considered first. Depending on the clinical context, I would also consider ordering troponin and d-dimer levels as well as CT or MRI of the brain. I would also consider doppler ultrasound of the lower extremities or CT chest with contrast to evaluate for venous thromboembolism.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "Medical workup is unremarkable, yet the patient continues to exhibit intermittent episodes of tachycardia. You note that the episodes are often associated with fevers, hypertension, diaphoresis, tachypnea, and hypertonicity, yet at other times none of these features is present. You diagnose the patient with paroxysmal sympathetic hyperactivity (dysautonomia).\n\n"
        },
        {
          "title": "+ How would you manage this condition?",
          "content": "- I would maintain three major goals in treating paroxysmal sympathetic hyperactivity: identifying predisposing factors, stopping excessive sympathetic outflow, and supportive management. I would attempt to identify and eliminate any potential triggers such as pain, underlying fracture or venous thromboembolism, or infection. Depending on the patient\u2019s clinical profile, I would consider medications including propranolol, bromocriptine, clonidine, dantrolene, baclofen, and benzodiazepines. Refractory symptoms may require intravenous infusions. Supportive therapy includes cooling blankets for elevated temperatures, optimizing nutrition and hydration, and pain management.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What is propranolol\u2019s mechanism of action and how might it be helpful in treating paroxysmal sympathetic hyperactivity?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Propranolol is a beta blocker, so it can be helpful for control of hypertension and tachycardia associated with PSH. It is nonselective and lipophilic, easily crossing the blood-brain barrier and mitigating excessive sympathetic outflow.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "Despite running a robust PM&R consult service at a level I trauma center, you notice that you are not being consulted on many patients with disorders of consciousness (DOC).\n\n"
        },
        {
          "title": "+ How would you approach this discrepancy?",
          "content": "- I would begin by reviewing the number of recent DOC referrals and comparing them to historical referral numbers to determine if and when the number of DOC referrals had dropped. I would consider various reasons for the drop in referrals, including a lack of primary team awareness of PM&R DOC management, fewer patients with DOC being admitted to the hospital, or perhaps purposeful omission of referrals due to lack of trust or confidence from the primary team. I would reach out to the primary teams and make them aware of my ability and desire to help manage DOC in the acute care setting. If appropriate, I might ask them why there have been fewer referrals recently. Regardless of the reason, I would put full effort into all DOC referrals and would provide clear and concise recommendations in order to build trust from primary teams and to provide the best possible patient care.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is the role-playing portion of this case.\n\nAs part of your consult recommendations, you recommend placement of a percutaneous endoscopic gastrostomy (PEG) tube for this patient due to severe oropharyngeal dysphagia in the setting of a minimally conscious state. The primary trauma service calls you and says, \u201cI disagree with your recommendation; the patient has a nasogastric tube which is good enough for now, and there is always a chance that she will wake up and her swallow will improve. Will you accept her for inpatient rehabilitation admission today?\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- A good response would be: \u201cThank you for reaching out regarding this patient; I always appreciate discussing these decisions in person or over the phone so that we can hear each other out. I agree with you that the patient has certainly shown neurologic improvement since admission, but as you know she remains in a minimally conscious state and it is very difficult to predict her recovery trajectory going forward. In my experience, these patients often take weeks to months -- if not longer -- to regain good enough swallow function to take in 100% of their nutrition and hydration by mouth. A PEG tube will reduce caregiver burden and will reduce the risk of nasal mucosa breakdown. Placing a PEG tube prior to her rehabilitation admission will allow her to spend her time at rehabilitation engaged in therapies aimed at promoting functional recovery. Will you please reconsider placing a PEG tube prior to inpatient rehabilitation?\u201d\nA good response would be:\n\n\u201cThank you for reaching out regarding this patient; I always appreciate discussing these decisions in person or over the phone so that we can hear each other out. I agree with you that the patient has certainly shown neurologic improvement since admission, but as you know she remains in a minimally conscious state and it is very difficult to predict her recovery trajectory going forward. In my experience, these patients often take weeks to months -- if not longer -- to regain good enough swallow function to take in 100% of their nutrition and hydration by mouth. A PEG tube will reduce caregiver burden and will reduce the risk of nasal mucosa breakdown. Placing a PEG tube prior to her rehabilitation admission will allow her to spend her time at rehabilitation engaged in therapies aimed at promoting functional recovery. Will you please reconsider placing a PEG tube prior to inpatient rehabilitation?\u201d\n\n- Note: You will need to be firm but not adversarial. You should acknowledge that prognostication is difficult in DOC but that the chance of sufficient recovery of swallow function in a short time frame is low. As a consultant, it is not your place to make the final decision to place or not place the PEG tube. However, as a gatekeeper responsible for clearing admissions to the inpatient rehabilitation unit, you do have the ability to deny an admission unless appropriate criteria are met, including PEG tube placement in certain patients.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "footdrop",
      "title": "Foot Drop",
      "url": "https://www.pmrrecap.com/footdrop",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 45 year-old male presents with 1 week of foot drop with calf pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What was the context and onset of these symptoms?\n- Was there any trauma or prior injury history?\n- Is the foot drop and pain unilateral or bilateral?\n- Has this ever happened before?\n- Please describe the quality, intensity, ?radiation, aggravating/alleviating factors of the pain.\n- Are there sensation changes, bowel or bladder changes, breathing difficulties, back or neck pain?\n- Has the patient been sick recently, or have any sick contacts?\n- Has the patient travelled recently?\n- Has the patient sought care for this problem before seeing me?\n- Does the patient have a known history of nerve or muscle disease?\n- Does the patient have a family history of nerve or muscle disease?\n- Functional history and current functional status, including equipment usage?\n- Past Medical and Surgical History?\n- Medications?\n- Allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- What are the vital signs?\n- Inspection for any asymmetry or deformities\n- Gait analysis\n- Palpation of bilateral lower extremities\n- Manual muscle testing, sensation to light touch and pinprick in bilateral lower extremities, reflexes in bilateral lower extremities\n- Integumentary exam of bilateral lower extremities\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Why are you asking about his travel and illness history?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The patient may have suffered from a recent infectious disease (upper respiratory or GI illness most commonly), or been exposed to individuals with communicable disease. Infectious diseases such as campylobacter can lead to Guillain Barre Syndrome (GBS/AIDP) which can present as an ascending paralysis, e.g. foot drop.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 45 year-old male with no significant past medical history who presents with 1 week of right foot drop and right lateral calf/leg and dorsum of foot pain of gradual onset after camping and hiking in Colorado 1 week ago. He does not recall any recent illness, sick contacts, or particular injury, though the ground was unsteady at times. He complains of mild back pain upon further questioning. On examination, there is abnormal sensation to light touch over the lateral right leg below the knee and dorsum of the right foot. Manual muscle testing reveals 4/5 strength in right ankle dorsiflexion, great toe extension, and eversion. There is 2+ achilles reflex on the right side. The remainder of the bilateral lower extremity examination is normal.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Sciatic neuropathy, lumbosacral radiculopathy, lumbosacral plexopathy, common fibular neuropathy, deep fibular neuropathy, superficial fibular neuropathy, tibial neuropathy, Guillain Barre Syndrome / AIDP, Charcot-Marie-Tooth disease (CMT), cervical myelopathy, anterior horn cell disease, tarsal tunnel syndrome, dystonia, stroke, myopathy, compartment syndrome, multiple sclerosis (MS).\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- Given the lack of infectious illness and unilaterality of symptoms, I do not favor a systemic process. In the context of intact hamstring strength and thigh sensation along with plantarflexion and posterior calf sensation, but impaired motor and sensory findings in the common fibular (peroneal) nerve distribution, I have suspicion of acute to subacute nerve impingement. Thus, I would obtain the following studies:\n- X-ray right knee\n- MRI right knee\n- If I possess diagnostic ultrasound skills in this scenario, then I would perform an in-office diagnostic ultrasound scan of the right knee and right lower extremity nerves during this visit.\n- I am not confident in the diagnostic yield of an EMG/nerve conduction study at this time, given the short duration of this patient\u2019s symptoms (1 week).\n"
        },
        {
          "title": "+ Your next steps result in the following:",
          "content": "- You opt to perform a diagnostic ultrasound scan of the right lower extremity during the office visit. It reveals the following:\n- Large, anechoic, compressible, round mass effacing the common fibular (peroneal) nerve near the fibular head/neck. Color doppler flow is negative within the mass. The mass appears to communicate with the superior tibiofibular joint.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- During this visit I would educate the patient on my findings and show them images or video of what I suspect is a large intraneural common fibular/peroneal ganglion cyst in their leg compressing the common fibular/peroneal nerve and causing an impingement neuropathy of the common fibular/peroneal nerve, which is the likely explanation for their presenting complaints. I would educate that prompt cyst aspiration is indicated in order to preserve nerve function and promote functional recovery, and that this recovery can be expected to occur on the order of weeks to months. With informed consent obtained, I would proceed to perform an ultrasound-guided cyst drainage. If no contraindications, I would likely elect to inject corticosteroid into the cyst space following drainage in order to prevent cyst regrowth. Following drainage, I would recommend physical therapy and possibly an ankle-foot orthosis (AFO), depending on their gait analysis. I would recommend oral acetaminophen +/- NSAIDs for pain relief. If her symptoms returned, MRI of the leg would be appropriate with orthopedic surgery consult for surgical evaluation of cyst removal.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "Your office lacks the proper equipment required to perform this cyst drainage. It is Friday morning and you are told there is no one else available in your region who can evaluate the patient today.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would send the patient to the emergency department for prompt drainage with orthopedics consultation also obtained. I would call the ED ahead of time and relay all relevant clinical information to the emergency medicine physician, and would advise a consult to interventional radiology for stat cyst drainage. Time is nerve, and this situation of known nerve compression does require prompt drainage in order to relieve the source of compression on the common fibular/peroneal nerve. The more time that goes by, the more this nerve will be compressed and lead to further demyelination and axon loss, which will lead to a poorer functional recovery prognosis as time passes. Thus, it is necessary to address this known cyst today. I would discuss all of my recommendations with the patient, and ensure that all questions are answered and that he is agreeable to this plan.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient is sent to the emergency department and undergoes cyst drainage. He calls your office 2 weeks later. Pretend that I am the patient.\n\nPatient: \u201cDoctor, my foot is still weak. You have to help me. I thought you said I could walk if we fix the nerve. Now I have a large ER bill and a weak foot, thanks to you.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I am sorry to hear that your leg is still feeling weak. Unfortunately there was a large cyst compressing your sciatic nerve, as we discussed. We did have the cyst drained and the source of compression removed promptly. As discussed, nerves can take a long time to recover following an injury. They do possess the ability to sprout new connections, but also to regrow along the length of the nerve. This regrowth can take about 1 inch per month to occur. In your case, I would continue to expect recovery to occur in a span of weeks to months following the cyst drainage. I would like to see you back in the office in 2 weeks for a repeat ultrasound scan of your leg and nerve to make sure the cyst has not regrown. If you are not improving within another 2 weeks after that appointment, I would recommend a nerve test called and EMG/nerve conduction study, which will tell us about the health and function of that nerve, as well as the prognosis for recovery. I would also recommend potentially an MRI scan and orthopedics consult at that appointment to determine whether or not surgical removal of the cyst is required. What questions do you have for me? Does that plan sound all right with you?\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "headache",
      "title": "Headache",
      "url": "https://www.pmrrecap.com/headache",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 22-year-old female presents to your office with headaches.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What are the headache characteristics? Describe the onset, context, location, duration, aggravating/alleviating factors.\n- Describe the severity and quality of headaches (dull, throbbing, squeezing, sharp, stabbing, etc.)?\n- Where are the headaches located?\n- Are they constant or intermittent?\n- Alleviating or aggravating factors?\n- When did these headaches start? Is there a history of chronic headaches?\n- Was there trauma/injury?\n- Is there pain anywhere else? Any neck pain or numbness/tingling/weakness?\n- Any post-concussive symptoms including vestibular dysfunction, vision changes, nausea, mood changes, or cognitive complaints?\n- Functional changes?\n- What has she done so far to treat the problem? Has there been any workup/imaging?\n- Past Medical and Surgical History?\n- Medications?\n- Social history including school and employment history?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- General appearance and comfort level with the lights on\n- Mental status examination\n- Cranial nerves\n- Strength, sensation, and reflexes - testing for contralateral asymmetry\n- Vestibular signs - saccades, visual motion sensitivity testing, nystagmus\n- Cervical range of motion and palpation\n- Special testing: Spurling\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient states that her headaches started after hitting her head against a gymnasium floor in a cheerleading accident two weeks ago. They are described as throbbing, typically unilateral, and associated with nausea and photosensitivity. On examination she appears uncomfortable and withdrawn, she is wearing her sunglasses indoors, and vestibular testing provokes nausea and dizziness. There are no other focal neurologic deficits and GCS (Glasgow Coma Scale score) is 15.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's headaches?",
          "content": "- My primary considerations include post-traumatic migraines, chronic migraines, tension type headaches, cervicogenic headaches, occipital neuralgia, or intracranial bleed. Other diagnoses which I might consider include temporomandibular joint injury, trigeminal neuralgia, low cerebral spinal fluid pressure headaches, paroxysmal hemicrania, neoplasm, arteriovenous malformation, cerebral venous thrombosis, temporal arteritis, pseudotumor cerebri, spontaneous intracranial hypotension, and Chiari I malformation.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- How would you distinguish between migraine and tension-type headaches?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- There is some overlap between these two headache syndromes. Migraine headaches tend to be unilateral and throbbing, while tension-type headaches are often bilateral and described as a dull pressure, tightening, or squeezing sensation. Migraine headaches are often associated with nausea, photo- and phonosensitivity, and worsening with activity, while these features do not occur as frequently in tension-type headaches. Tension-type headaches often slowly worsen throughout the day and are worse at night, particularly after stressful days.\n"
        },
        {
          "title": "+ Would you obtain imaging or laboratory work in this patient?",
          "content": "- I would consider imaging of her brain such as a CT or MRI in order to rule out intracranial bleed. However, given that two weeks have passed since her injury and she remains alert and cognitively intact without focal neurologic deficit, I would likely defer imaging at this time. I would have a low threshold to obtain imaging if the patient were to develop any cognitive or functional decline. Laboratory work is not currently indicated in this patient.\n"
        },
        {
          "title": "+ You diagnose the patient with a concussion with associated post-traumatic migraines and vestibular dysfunction. How would you manage this case?",
          "content": "- I would begin by counseling the patient on her diagnosis. I would then describe healthy lifestyle interventions to promote concussion recovery, focusing on diet, hydration, sleep, stress management, and light exercise. As two weeks have passed since her concussion, I would counsel her to avoid \u201ccomplete rest\u201d and instead engage in activities as tolerated, taking breaks when needed. Especially given her vestibular dysfunction, I would recommend that she avoid returning to gymnastics for the time being and I would educate her on return-to-play protocols for the future.\n- Regarding her migraines, I would counsel her to maintain a daily log of her migraines, to avoid triggers, and to avoid over-the-counter medication overuse. I would consider pharmacologic options for migraine prevention including tricyclic antidepressants (such as amitriptyline), antiepileptics (such as topiramate or depakote), or beta blockers (such as propranolol), among other choices. I would also consider prescribing an as-needed migraine abortive (such as sumatriptan). For her vestibular dysfunction, I would refer the patient to physical therapy for a vestibular therapy program.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "You use a computerized testing tool in your office to track concussion recovery for your patients. You are seeing more and more high school athletes in your practice and you feel that it would be helpful to have pre-injury baseline scores obtained for all local high school athletes.\n\n"
        },
        {
          "title": "+ How might you try to implement this?",
          "content": "- I would begin by researching the tool and ensuring that it is validated and supported in the literature. I would then reach out to local high schools, perhaps through athletic trainers or through contact information on the schools\u2019 websites. I think that the best approach would be to see if the schools are already using some type of tool for a similar process, rather than coming in and immediately demanding that they start using my tool. If possible, I would try to adapt to whatever processes are currently in place. If no tool is currently in place, I would be understanding that implementing a new tool would require costs and planning from the school. I would be prepared to explain the benefits of implementing such a tool and would make myself available for any questions from the schools. This could be a large undertaking requiring coordination between multiple schools and physician offices, so I would be sure to delegate where possible.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient returns to your office two weeks later and reports resolution of her headaches and vestibular symptoms at rest, however her symptoms worsen with any light exercise. She has an important gymnastics meet in four days and says her coaches have cleared her to compete.\n\n"
        },
        {
          "title": "+ How would you counsel her?",
          "content": "- A good response would be: \u201cI am very happy to hear that your symptoms are getting better. You are doing a good job managing your symptoms and giving your body the resources that it needs to recover from your concussion. While you do seem to be recovering, you are not completely healed from your concussion yet. One way that we track recovery and readiness to return to sports is monitoring symptoms, both at rest and with activity. Before you go back to competing, you should be entirely symptom free or else you risk a repeat injury significantly worsening your symptoms and delaying your recovery. I recommend that you continue daily light aerobic activity until you can do this activity without any symptoms. The next day, you may progress to moderate exercise, and if you remain symptom-free you can then progress to heavy exercise the next day. After you can do heavy exercise without symptoms you may return to practice. You should not compete until you can practice without any symptoms. As you can see, we still have work to do before you can compete and I do not believe that you will be ready to safely compete in the next four days. I know that this process can seem slow and frustrating, but I thank you for being understanding and patient as you follow these necessary steps towards recovery.\u201d\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "headaches",
      "title": "Headaches",
      "url": "https://www.pmrrecap.com/headaches",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 50 year-old female presents with headaches.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What is the onset, timing, location over the cranium, duration, aggravating/alleviating factors, ?radiation, severity of the pain?\n- Was there injury or trauma?\n- Has this ever happened before?\n- Is there any associated nausea, vomiting, diarrhea, vision or hearing changes, weakness, numbness, tingling, bowel/bladder dysfunction, gait dysfunction, memory impairment, abnormal scents, photophobia, phonophobia, or tearing associated with this?\n- Has she had any workup or treatment so far for this problem?\n- Past Medical/Surgical History?\n- Family History?\n- Social History?\n- Functional History? Current functional status?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Range of motion of cervical spine\n- Cranial nerve examination\n- Manual muscle testing, reflexes, sensation of bilateral upper and lower limbs\n- Special testing: occipital nerve palpation, cervical facet-loading challenge\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 50 year-old female with a past medical history of left wrist fracture status post surgical fixation who presents with 6 months of daily intermittent bilateral headaches that are worst in the morning. Her pain is improved with ibuprofen. She denies any vision changes, weakness, numbness, gait dysfunction, or bowel/bladder dysfunction. On exam she is tender to palpation over the cervical paraspinals. Direct palpation of the greater occipital nerves causes pain shooting over the scalp. Her strength, sensation, and reflexes are normal.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's headaches?",
          "content": "- Cervicogenic headaches, myofascial pain, occipital neuralgia, cervical spondylosis, cervical facet arthropathy, migraines, tension headaches, cluster headaches, trigeminal neuralgia, intracranial neoplasm, increased intracerebral pressure.\n"
        },
        {
          "title": "+ Anything else?",
          "content": "- That is all. Thank you.\n"
        },
        {
          "title": "+ What workup would you recommend for this patient?",
          "content": "- No particular workup is indicated at this point in time.\n"
        },
        {
          "title": "+ How would you manage this patient if cervicogenic headaches were your primary concern?",
          "content": "- I would recommend physical therapy focused on strength and range of motion of the cervical spine musculature and scapular stabilizer muscles with education on a home exercise program. I would advise over the counter acetaminophen, NSAIDs, ice/heat/massage as needed, stress reduction techniques, proper posture while working.\n"
        },
        {
          "title": "+ How would you manage this patient for primary headaches that are not cervicogenic?",
          "content": "- I would consider a dedicated headache medication such as magnesium supplementation, amitriptyline/nortriptyline, gabapentin, or topiramate.\nThe patient returns to your office 2 months later. Her headaches have worsened with your course of treatment. You notice that she turns her head to the left whenever speaking directly with you. She complains of hearing difficulty and notes that her mother also requires hearing aids. She feels a little unsteady with her gait, but attributes this to a history of prior ankle sprains.\n\n"
        },
        {
          "title": "+ What are your next steps in management, and why?",
          "content": "- I would order an MRI of the brain and cervical spine with contrast. I am concerned about a possible pathologic intracranial process that may involve the cervical spine, given the patient\u2019s worsening headaches with vision changes, hearing changes, and gait dysfunction. I would counsel the patient on why I am ordering the imaging and CC her primary care physician on the note or send a copy of my note of the physician is outside my health system. I would ensure all questions are answered and would ask if the patient is agreeable to the plan.\n"
        },
        {
          "title": "+ Your next steps lead to the following:",
          "content": "- MRI brain with contrast is positive for an abnormal enhancing intracerebral mass.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would call the patient, inform her of the results, and offer my next steps in the plan. I would offer my sympathetic condolences and reassure her that I will be here to support her every step of the way as we work to treat this problem. I would counsel that her headaches and other concerning symptoms are likely the result of this mass identified on the MRI scan of her brain. I would recommend consultations with neurosurgery, oncology, and radiation oncology for a treatment plan.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient undergoes surgical resection of a large meningioma without complications. She is medically stable and not requiring medications. A course of radiation therapy is being arranged. Physical and occupational therapy evaluations demonstrate that the patient is performing below her baseline level of function and is not safe for home discharge alone. She does not have any family or friends in town who would be able to provide full-time supervision. You are consulted as the rehabilitation physician for this patient.\n\n"
        },
        {
          "title": "+ What are your recommendations for her?",
          "content": "- Given that she lacks medical complexity, she will likely not qualify for inpatient rehabilitation, despite her functional deficits. She is medically stable and not requiring medications. She will not require daily physician supervision and active management of medical comorbidities while she is rehabilitated. Furthermore, it may present an undue challenge to coordinate her radiation therapy schedule with her demanding inpatient rehabilitation schedule. I would recommend skilled nursing facility placement so that she can rehabilitate with the support of trained nursing staff along with physical and occupational therapy without the need for close medical supervision.\nDuring her skilled nursing facility stay she attends a scheduled virtual follow-up visit with you. She notes that she has resided at this facility for 2 weeks and only sees her nurse once daily; she is otherwise left alone in her room all day. You note a cluttered, dirty countertop in her vicinity.\n\n"
        },
        {
          "title": "+ How would you handle this situation?",
          "content": "- If I had a concern for her immediate safety or life-threatening neglect, I would call 9-1-1. In her case I would call the facility and ask to speak to the nursing home director and attending physician on staff. I would call a social work consultation for further recommendations. I would strongly consider calling state or national nursing home abuse agencies on her behalf. I would inform her if she has any concern for her safety or wellbeing, please dial 9-1-1, and I would ask if she has a phone nearby that she can use safely, given her decreased functional status. I would consider contacting social work to help initiate a transfer to a different facility.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient completes her rehabilitation at another facility and is discharged home in modified independent functional status. This is the role-playing portion of our encounter. I will play the role as the patient.\n\nPatient: \u201cDoctor, I feel like my memory is gone, and I have a hard time ge-getting the right wards--words out.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- What you have been through and continue to battle is incredibly difficult, and I commend you for your strength and your efforts as you take on this challenge. Thank you for sharing this with me. We need to work to help you further and do what we can to improve your memory and language skills. I would like you to consider being evaluated by a speech/language therapist, and also consider counseling for what you are going through, as it is certainly not an easy task, though you are meeting the challenge formidably. We can also consider neurology or psychiatry consultations to help identify other factors that may improve your memory, including possible medication options. Does that sound like an acceptable plan? Please let me know if you have any concerns about this plan, or any other questions or thoughts today.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "leftanklepain",
      "title": "Left Ankle Pain",
      "url": "https://www.pmrrecap.com/leftanklepain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 16 year-old female presents with 2 weeks of left ankle pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin?\n- Was there injury/trauma?\n- Where exactly is the pain? Quality, duration, aggravating/alleviating factors, radiation?\n- Unilateral or bilateral?\n- Has this ever happened before?\n- Is there weakness, numbness, or tingling?\n- What has she tried so far to alleviate the problem? Medications, therapy, bracing, injections, surgery?\n- Has she had any workup already for this problem?\n- Is she active? Does she play sports?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation of bilateral ankles\n- Manual muscle testing of bilateral lower extremities\n- Sensory examination of bilateral lower extremities\n- Reflex testing\n- Special testing: Thompson test, Tinel at fibular head and medial malleolus, Anterior drawer of ankle, Talar Tilt, Straight leg raise, plantar fascia stretching with direct palpation\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Describe how to perform the Thompson test, and what you are looking for with it.\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The Thompson test is performed to check for achilles tendon tears. It is performed by having the patient lie prone with their feet dangling over the edge of the exam table. The examiner then squeezes the patient\u2019s calf muscle (gastrocnemius/soleus complex). In a normal patient, squeezing the calf in this way will elicit passive plantarflexion of the ankle, indicating an intact achilles tendon. In a patient with an achilles tendon tear, squeezing the calf will not cause plantarflexion (there is no achilles tendon fiber continuity onto the calcaneus, so plantarflexion cannot occur), indicating a positive Thompson test.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "This patient is a 16 year-old female who has felt gradual onset posterior left ankle pain for the past 2 weeks. She plays on a competitive traveling soccer team and notices the pain while playing. She feels like she can barely play soccer due to the pain. She has no pain at rest. She denies weakness, numbness, or tingling. On exam, strength, sensation, and reflex testing are normal; however, there is significant pain with left-sided heel raises. There is visible grimacing with palpation of the posterior ankle and with passive dorsiflexion. Anterior drawer of the ankle and Thompson test are negative\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's ankle pain?",
          "content": "- Achilles tendonitis/tendinosis, achilles tendon tear, plantar fasciitis, lateral ankle sprain, medial ankle sprain, retrocalcaneal bursitis, retroachilles bursitis, calf strain, shin splints (medial tibial stress syndrome), calcaneal stress fracture, CRPS (complex regional pain syndrome), midfoot ligament sprain, midfoot fracture, talar fracture.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "The patient is diagnosed with left achilles tendonitis.\n\n"
        },
        {
          "title": "+ What workup and treatment plan would you prescribe?",
          "content": "- Initial rest followed by physical therapy focused on eccentric strengthening or heavy slow resistance training of the achilles tendons. Acetaminophen and/or NSAIDs (including topical diclofenac), heat, ice, TENS for symptomatic pain relief. No further workup is required at this point for achilles tendonitis.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "She states that her soccer coach is wondering if she will be able to continue playing. Her team is in the playoffs right now and she is their leading scorer.\n\n"
        },
        {
          "title": "+ What would your next steps be?",
          "content": "- It is not advised that she continue playing right now, given the extent of her pain during activity and with mechanical loading of the tendon (heel raises). Continued playing at her current level of pain may worsen her condition or even lead to achilles tendinosis or tearing. At the permission of the patient and her parent, offer to speak directly with her coach to relay your recommendations and rationale, as well as conditions for returning to play.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient undergoes a course of physical therapy for the achilles tendon. Her pain resolves. At a follow-up visit, while her mother is answering a phone call out of the room, she reveals to you that she exaggerated her level of pain, and she really just didn\u2019t want to play soccer anymore. She has softball coming up and she is not interested in playing that, either.\n\n"
        },
        {
          "title": "+ How do you respond? This is our role-playing segment of the examination, so pretend I am the patient.",
          "content": "- Thank you so much for keeping me informed. I am sorry that it sounds like you were playing soccer without having much enjoyment. I am glad your pain is better now, even if it wasn\u2019t as bad as I originally thought. Are you planning to continue playing sports in any capacity, including softball coming up?\n"
        },
        {
          "title": "+ The patient responds:",
          "content": "- I just don\u2019t want to play any sports anymore. I don\u2019t have fun. My parents have made me play a million different sports since I was 6, and I hate it.\n"
        },
        {
          "title": "+ Your response:",
          "content": "- I\u2019m so sorry to hear that. Have you tried talking to your parents about what you want and what your goals are?\n"
        },
        {
          "title": "+ Examiner:",
          "content": "- Thank you. That concludes this case.\n- Note: The key here is to promote healthy communication between this patient and her parents. Whether she has informed them she doesn\u2019t want to play sports or not, points would be earned in this Domain for promoting dialogue and open communication between the patient and her parents. It is important that she communicate her own individual desires and goals, as it is not clear if her parents are pushing her excessively to play sports, or if they believe she enjoys it as much as they do. The first, most appropriate steps, are to find out what both parties know and where they are coming from, and then promoting proper dialogue and understanding.*\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "lefthandpain",
      "title": "Left Hand Pain",
      "url": "https://www.pmrrecap.com/lefthandpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 27 year-old female presents with left hand pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset and context of symptoms? Was there any injury recently or in her past?\n- Regarding pain, what is the location, duration, intensity, quality, radiation, constant/intermittent, aggravating/alleviating factors?\n- Is the pain unilateral or bilateral?\n- Are there associated changes in terms of weakness, numbness, tingling, bowel/bladder dysfunction, skin changes?\n- Has the patient had any workup or treatment so far for this pain?\n- Functional history and current functional status, including equipment usage?\n- Social history and work status?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Manual muscle testing, sensation, reflex examination of bilateral upper limbs\n- Special testing as directed by the history\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 27 year-old female who presents with 2 years of left wrist and hand pain. She was exercising and accidentally dropped a 35lb dumbbell onto her left wrist, resulting in a left scaphoid fracture for which she underwent surgical fixation. Her presurgical left wrist pain improved following that operation, but over the next several months she developed gradual onset vague left wrist and hand burning pain, swelling, abnormal sweating in the left hand, and extreme sensitivity to light touch over the left hand. She states the left hand feels \u201cfunny\u201d in addition to painful. She denies other concerning symptoms elsewhere. She has tried oral acetaminophen and ibuprofen with no relief. She stopped working as a chef due to the pain. On examination, she has allodynia over the left wrist and hand dorsally, and you meet significant tissue resistance when attempting to passively extend her left fingers.\n\n"
        },
        {
          "title": "+ What tools would you use to assist you in generating your differential diagnosis?",
          "content": "- Clinical knowledge from residency and experience in independent practice\n- Discussion with colleagues (via de-identified case information)\n- Researching the primary literature\n- Subscription-based peer-reviewed services (uptodate, dynamed, etc.)\n"
        },
        {
          "title": "+ What is your differential diagnosis?",
          "content": "- CRPS 1 or 2 (complex regional pain syndrome type 1 or type 2), central sensitization, failed surgical fixation, surgical nonunion, extensor tendinopathy, undiagnosed wrist/hand fracture, carpal tunnel syndrome, ulnar neuropathy, radial neuropathy, cervical radiculopathy, ganglion cyst, thalamic stroke, malingering.\n"
        },
        {
          "title": "+ What are your next steps in the workup for this problem?",
          "content": "- X-rays of left wrist and hand\n- EMG left upper extremity\n- Triple phase bone scan\n- Consider diagnostic ultrasound or MRI of left wrist/hand\n"
        },
        {
          "title": "+ Your next steps result in the following:",
          "content": "- X-rays of left wrist and hand: patchy demineralization of the carpal bones\n- EMG left upper extremity: normal\n- Triple phase bone scan: increased uptake in the left wrist during phase three\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- First I would educate the patient about the diagnosis of CRPS, prognosis, and management options going forward.\n- This patient has failed oral acetaminophen and NSAIDs. If no contraindications, I would start anti-neuropathic pain medication such as gabapentin, pregabalin, amitriptyline, nortriptyline, or duloxetine. I would recommend a topical medication such as lidocaine, capsaicin cream, or even a compound cream to help improve the skin sensitivity/allodynia. If no improvement, a course of oral corticosteroids could be considered. I would recommend TENS therapy in addition to occupational therapy to promote use of the affected hand and restore range of motion. Ultimately a work hardening program could be considered.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient follows your recommendations and does not improve. Her pain is worsening.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would recommend either a peripheral nerve block over the region of her pain, vs. a stellate ganglion block, depending on how comfortable she is with either option after I explain the risks/benefits, and rationale of both.\n"
        },
        {
          "title": "+ The patient adamantly refuses stellate ganglion block. The peripheral nerve block is denied by insurance. How would you proceed?",
          "content": "- Options include: Call insurance company and perform peer-to-peer discussion. Appeal the decision. Discuss with the insurance company what services they would cover in her case.\n- Call insurance company and perform peer-to-peer discussion.\n- Appeal the decision.\n- Discuss with the insurance company what services they would cover in her case.\nThe insurance company approves the stellate ganglion block. The patient ultimately agrees to undergo this procedure and receives complete pain relief for 1 week, before her symptoms gradually return.\n\n"
        },
        {
          "title": "+ What would you recommend next?",
          "content": "- Conservative and interventional measures have failed. Repeat stellate ganglion block could be considered, but this patient should also be considered for neuromodulation, such as peripheral nerve or spinal cord stimulation.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is the role-playing portion of the encounter. Pretend that I\u2019m the patient.\n\nPatient: \u201cDoctor, I\u2019m sick of being shuttled around. I am so hopeless. Nothing works. I can\u2019t even hold a job due to the pain. I need you to recommend that I am permanently disabled and cannot work.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I am so sorry that you are going through this. CRPS is incredibly difficult to experience. It can severely limit your quality of life and your ability to function. I know we have been trying very hard to improve your pain and your function, and I am disappointed that nothing has helped you significantly or for a long enough time. However, you are not out of options. I want you to consider neuromodulation as we discussed previously. I think you should strongly consider it, as there is evidence that it is beneficial for CRPS-related pain. I understand and agree that you cannot work right now due to your constant, severe pain. I am happy to write a recommendation that you cannot work in your current state. However, I do not yet believe that we have reached your permanent maximal medical improvement; there is reasonable hope that your pain and function can improve enough for you to be able to work.\n"
        },
        {
          "title": "+ The patient responds:",
          "content": "- \u201cAre you kidding me? You think I can wait around another 6 months to get in with someone who will then make we wait another 6 months to get a stimulator implanted that may or may not even work? I can\u2019t work! I need my permanent disability payout!\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- Please understand that I want your pain improved as fast as possible and effectively as possible. I am so sorry that you are having to deal with your current situation. I certainly don\u2019t know how it feels, but I know it is incredibly difficult. I know we can work together as a team to improve your pain and function. Please allow me to work hard to find the fastest and most effective solution for your pain.\n"
        },
        {
          "title": "+ The patient responds:",
          "content": "- I don\u2019t want a stimulator or your useless excuses! All I\u2019m hearing from you is that you can\u2019t help me. I can\u2019t believe I even came here. You are trash. You\u2019re lucky you didn\u2019t have to call security on me today.\n"
        },
        {
          "title": "+ Your response?",
          "content": "- Again, I am so sorry for your ongoing pain, and that our efforts have not been successful in treating your pain or improving your function. I have been willing to work hard to find the best solution for you. Unfortunately I no longer feel that our patient-doctor relationship is one of trust and harmony. I am willing to provide emergency care for you as needed, but unfortunately I do believe it is in both of our best interests to transfer your care to one of my partners or another physician who is capable of treating this problem for you. Please allow me to show you to the exit.\n- Note: This case illustrates the unfortunate reality that despite your best, most honest, and most genuine efforts, some patients just will not like you. If you ever encounter a situation in which you no longer feel safe (above), or that the patient-doctor relationship of teamwork has become fractured, then it is in both your and the patient\u2019s best interest to terminate the relationship and transfer care to another capable physician. In these cases, always inform the patient that you are available to provide urgent/emergent care until they become established with a new physician.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "leftlowerextremitypain",
      "title": "Left Lower Extremity Pain",
      "url": "https://www.pmrrecap.com/leftlowerextremitypain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 42 year-old male presents with 1 month of low back and left thigh pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Where exactly is the patient\u2019s pain? What are the other details of the pain, including onset, duration, radiation, quality, severity?\n- Has this ever happened before?\n- Was there trauma/injury recently or in the past?\n- Is the pain worsening over time?\n- What makes the pain better or worse?\n- What has been tried so far to treat the pain? Oral medications? Physical therapy? Injections? Surgery?\n- Has any workup been performed so far, or has the patient sought medical care for this problem before?\n- Are there associated neurologic symptoms, such as numbness, tingling, weakness, gait dysfunction, bowel or bladder dysfunction, or saddle anesthesia?\n- Past Medical and Surgical History\n- Medications\n- Social history, including work details and current work status.\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation of lumbar spine and bilateral lower limbs\n- Manual muscle testing of bilateral lower limbs\n- Sensory and reflex testing of bilateral lower limbs\n- Special testing: straight leg raise, slump sit, FAIR, FABER, Ober\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are you trying to assess with the FAIR test, and how do you perform it?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The FAIR test stands for flexion, adduction, and internal rotation of the hip. It is a test for piriformis irritation of the sciatic nerve which may be responsible for a patient\u2019s shooting pain down the leg. The FAIR test is performed typically by having the patient lie supine, flexing the hip of the affected lower extremity to 60 degrees, and adducting the hip while internally rotating it. This is designed to stretch the piriformis and potentially irritate an already-irritated sciatic nerve, thus reproducing the patient\u2019s symptoms of pain +/- numbness/tingling down the lower extremity. If the patient\u2019s pain is reproduced, the test is positive and indicates sciatic nerve irritation likely due to piriformis syndrome.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient\u2019s pain began 1 month ago gradually without trauma. It is described as a sharp pain in the left low back region and the left lateral thigh. There is pain with palpation of the proximal left lateral thigh. There is numbness and tingling over the left lateral thigh. Strength is normal except for 4/5 left ankle dorsiflexion. Straight leg raise, slump sit, and FAIR test are negative.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Lumbar radiculopathy (particularly L4 or L5), piriformis syndrome, lateral femoral cutaneous neuropathy, sciatic neuropathy, greater trochanteric pain syndrome, SI joint dysfunction, IT band syndrome, primary hip joint pathology, common fibular (peroneal) neuropathy, deep fibular (peroneal) neuropathy, anterior horn cell disease.\n"
        },
        {
          "title": "+ What specific workup would you arrange for this patient?",
          "content": "- There is no immediate imaging or laboratory workup required at this point in time.\n"
        },
        {
          "title": "+ What are your specific management recommendations for this patient?",
          "content": "- Prescribe physical therapy to start, focusing on core strength, stability, gait, gluteal, hip girdle musculature activation, coordination, progressive strengthening, and range of motion with work on postural mechanics. There is no urgent indication to rush to testing (MRI lumbar spine or EMG of left lower extremity). There is gradual onset left 4/5 dorsiflexion weakness, but this is not sudden-onset and the limb is not profoundly weak, so urgent testing or surgical consultation is not required. Over the counter oral pain medications would be appropriate as well, such as acetaminophen, NSAIDs, or antineuropathic pain agents such as gabapentin, if appropriate based on medical history and current medications.\n"
        },
        {
          "title": "+ Your recommendations lead to the following:",
          "content": "- The patient performs 2 months of physical therapy with a daily home exercise program, yet his pain and weakness are unchanged. He has tried oral pain medications without significant relief.\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- This is not an easy question, but essentially 2 tests would be appropriate to consider, and either is a legitimate choice as long as you are prepared to explain your reasoning for ordering either test, and how you might act on the results. Arguably an EMG/nerve conduction study of the left lower extremity is the most appropriate next step, given the unclear etiology of the patient\u2019s symptoms, unclear special testing on physical examination, and differential diagnosis considerations of peripheral neuropathy (sciatic, common fibular, etc.), radiculopathy, or lateral femoral cutaneous neuropathy. Based on the EMG results, you may elect to proceed with a lumbar spine MRI without contrast if the EMG indicates lumbar radiculopathy, and then move forward with an epidural steroid injection (either interlaminar or transforaminal approach - be prepared to explain rationale for all your choices). If the patient\u2019s clinical presentation was much more supportive and clear to indicate a radiculopathy, you might consider proceeding with lumbar spine MRI and epidural steroid injection.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "EMG of the left lower extremity reveals a subacute left L5 radiculopathy with mildly decreased recruitment and polyphasic potentials in the gluteus medius, semimembranosus, and tibialis anterior. The EMG report details that the electromyographer had a complete discussion with the patient, educating them on their diagnosis and options for treatment.\n\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- Personally inform the patient of the test results and next steps. No matter what the report says (MRI, EMG, X-ray, etc.) always take the time to personally tell your patient the results of the test and the next steps. This may be in the form of an office visit, a phone call, a secure message, or a mailed letter. This electromyographer may have documented that they had an educational discussion, but ultimately the only thing that matters here is: did you personally educate the patient, explain the test findings, and offer a treatment plan?\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "What would you have done if the patient had refused the EMG test, stating, \u201cNo, doctor, I know I pinched a nerve, I need an MRI of my back now to see what\u2019s going on.\u201d Pretend I\u2019m the patient in this scenario.\n\n"
        },
        {
          "title": "+ How would you respond?",
          "content": "- \u201cI know this is a very difficult situation you are dealing with. I want you to be assured that my chief goal is to diagnose the cause of your problem so that we can know how to properly treat it. Please explain to me what you understand about the MRI test vs. the EMG test and I\u2019d be happy to talk about it some more.\u201d\n- \u201cWhat other questions do you have for me today?\u201d\n- Note: Always take the time to inquire and find out what your patient understands about the diagnosis/workup/treatment plan, before simply ordering the test. The patient needs to understand the value of each test you order and why you are ordering it over another test. In this way you can reach a \u201cteam-based\u201d solution that the patient feels invested in.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "leftshoulderpain",
      "title": "Left Shoulder Pain",
      "url": "https://www.pmrrecap.com/leftshoulderpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 45 year-old male presents with 1 month of left shoulder pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What are the pain characteristics? What is the onset, context, location, duration, aggravating/alleviating factors, quality, radiation, severity?\n- Was there trauma/injury?\n- Has this happened before?\n- Other relevant symptoms: is there pain anywhere else? Numbness/tingling/weakness?\n- Functional history and current functional status?\n- What has he done so far to treat the problem? Has there been any workup/imaging?\n- Past Medical and Surgical History?\n- Medications?\n- Social history? Occupation? Is patient able to work with this pain?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection with comparison to contralateral side (note any atrophy, deformities, postural abnormalities)\n- Palpation of the affected shoulder (palpate glenohumeral joint, peri-shoulder muscles, AC joint, subacromial space, proximal biceps tendon, clavicle)\n- Passive and active range of motion comparison of the shoulders\n- Manual muscle testing (myotome scan), isolated rotator cuff strength testing (isolating and testing supraspinatus, infraspinatus, teres minor, subscapularis)\n- Sensory and reflex testing\n- Special testing: Spurling, cervical facet joint loading challenge, Empty Can, Speed, Yergason, Hawkins, Neer, O\u2019Brien, Scarf, Painful Arc, Drop-arm Test\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are you looking for with the O\u2019Brien test? How would you perform the O\u2019Brien test?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The O\u2019Brien test is a test to assess for a labrum tear of the shoulder or acromioclavicular joint (AC joint) arthropathy. It is performed by asking the patient to flex their shoulder to 90 degrees and adduct it towards the midline, holding their arm straight out anteriorly in front of them, elbow extended, internally rotated, forearm pronated with thumb pointing towards the ground. The patient then provides active resistance as the examiner pushes inferiorly on the extended arm. If the patient\u2019s shoulder pain is reproduced with this test, then the test is positive and suggestive of a labrum tear or AC joint arthropathy, as long as the patient subsequently supinates their forearm and the test is repeated with reduced or absent pain in the supinated position.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient states his problem began gradually over the past 1 month. His pain is aching and is located along the neck, upper back, and left shoulder region. He works as a software engineer and likes to exercise. He denies a history of trauma to the shoulder. Strength, sensation, and reflex testing are normal. The Empty Can, O\u2019Brien, Hawkins, and Painful Arc maneuvers elicit pain.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Rotator cuff tear, rotator cuff tendinopathy, subacromial subdeltoid bursitis, calcific tendonitis, biceps tendonitis, labrum tear, glenohumeral arthritis, AC joint arthritis, myofascial pain, cervical radiculopathy, cervical facet joint dysfunction\n"
        },
        {
          "title": "+ Describe the course of treatment you would prescribe for this patient.",
          "content": "- Physical therapy for 4-8 week trial with home exercise program. PT should emphasize rotator cuff, scapular stabilizer, and cervical paraspinal progressive strengthening, stretching, postural mechanics, and safe lifting technique.\n- Acetaminophen, NSAIDs, topical heat/ice/NSAIDs, TENS machine, massage\n- If pain is too limiting to participate in physical therapy, consider shoulder x-ray or corticosteroid injection.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "The patient participates in physical therapy and is compliant with his home exercise program. After 2 months his pain is somewhat reduced and he feels like he can do slightly more activity throughout the day.\n\n"
        },
        {
          "title": "+ What would you suggest next?",
          "content": "- It would be appropriate at this time to ask the patient if he feels satisfied enough with his pain and functional improvements such that he can live his life and do all the activities he wants to do to his satisfaction. It is appropriate to ask whether he would like you to do more to treat his pain. If he still feels too limited by his pain and impaired function, then it is reasonable to discuss ordering a left shoulder x-ray and possibly a left shoulder MRI.\n"
        },
        {
          "title": "+ Your next steps ultimately result in the following:",
          "content": "- Left shoulder x-ray reveals mild glenohumeral and, AC joint arthritis, as well as cystic changes of the greater tuberosity of the humerus. Left shoulder MRI reveals partial thickness bursal-sided tear of the supraspinatus.\n"
        },
        {
          "title": "+ What treatment would you recommend based on these imaging findings?",
          "content": "- It would be most appropriate to offer a subacromial subdeltoid corticosteroid injection for pain relief and for improved tolerance to exercise. Given enough pain relief, the hope is that the patient can rehabilitate through this problem and not require any additional injection or other intervention beyond exercise and over-the-counter pain medications. If the patient denies wanting an injection, a discussion could be initiated regarding the potential benefits of orthopedic surgical intervention.\n"
        },
        {
          "title": "+ What would you change about your previous recommendation if the patient had a history of diabetes?",
          "content": "- I would educate the patient on the risks of using corticosteroids with a focus on blood sugar changes following a corticosteroid injection, as well as the increased risk of infection and poor tissue healing in the setting of diabetes. I would advise the patient to closely monitor their blood sugar following the injection, and to let his primary care physician know that he will be having this injection done so that plans can be made regarding diabetes management following the injection. I would also inform the patient that I would send a copy of my note to his primary care physician so that he or she remains informed as well.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient\u2019s brother, who is a physical therapist, calls your office. He states, \u201cWhy are you wasting your time with a shoulder shot when you know surgical repair is the only actual solution to a tendon tear? How long have you been practicing, again?\u201d\n\n"
        },
        {
          "title": "+ What is your response? Pretend I'm the patient's brother.",
          "content": "- First, always obtain express written consent from the patient to talk to anyone other than his or herself. If the patient has not designated his brother as an authorized contact, then you must calmly and politely explain that you cannot comment on his questions. If the brother is indeed an authorized contact (which is more likely to be the case on the oral board examination), then you should calmly and politely explain your rationale for treatment. Before explaining, it is a good idea to ask if the patient is nearby and available to talk. It is also a good idea to ask the brother what the brother\u2019s and the patient\u2019s thoughts are regarding his current treatment. An acceptable response would be: \u201cI understand your question and concerns, and I appreciate the seriousness of your brother\u2019s problem. I know you care for your brother and want what is best for him. I apologize if there has been any confusion regarding his diagnosis or treatment plan. I would be happy to discuss this with you today. Could you please tell me what you know of your brother\u2019s problem, including the treatments we\u2019ve tried so far? Our treatment program is designed to progress from conservative to invasive in a stepwise fashion, trying to treat your brother with the least invasive methods possible. If a certain intervention fails to solve his problem, then we proceed to the next step, which tends to be more invasive but which may also be necessary to benefit him. It is true that surgical repair of his torn tendon is an option. However, surgery is the most invasive of his options and comes with increased risks as a result. Of course, should he desire surgery, or should all his other options fail him, then I would be more than happy to have the discussion with him regarding risks vs. benefits of surgery, as well as a referral to a surgeon to treat his problem. Are there any other questions I can help answer today?\u201d\n- Note: It\u2019s important to remember when speaking to individuals other than the patient that you will need express written consent from the patient to discuss the patient\u2019s personal health information with them. It is also a great idea to ask if the patient is available to contribute to the discussion, or if you can set up a time when all three of you can meet to discuss the case together. Essentially, involve the patient himself/herself as much as possible. Do not allow yourself to become flustered by the occasional aggression of other individuals, and always act in the patient\u2019s best interest.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "legpain",
      "title": "Leg Pain",
      "url": "https://www.pmrrecap.com/legpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 63 year-old male presents with acute onset left lower extremity pain with numbness.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What is the onset, timing, exact location, duration, aggravating/alleviating factors, ?radiation, severity of the pain and numbness?\n- Was there injury or trauma?\n- Has this ever happened before?\n- Any back pain, neck pain, swelling, skin changes, fever, chills, vision or hearing changes, nausea, weakness, gait or balance problems, bowel/bladder changes?\n- Has he had any workup or treatment so far for this problem?\n- Past Medical/Surgical History?\n- Family History?\n- Social History?\n- Functional History? Current functional status?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Range of motion of cervical and lumbar spine, bilateral lower extremities\n- Cranial nerve examination\n- Manual muscle testing, reflexes, sensation testing of bilateral upper and lower limbs\n- Special testing: Babinski, Hoffman, Straight Leg Raise, Slump Sit, Femoral Nerve Stretch Test, Tinel at inguinal ligament/fibular head/medial malleolus\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Explain the femoral nerve stretch test and how you would perform it.\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The femoral nerve stretch test is a test similar to the straight leg raise, only more specific for the upper lumbar nerve roots (L2-L4). The examiner performs the test by having the patient lying prone, allowing the examiner to then flex the knee of the affected limb beyond 90 degrees while extending the affected hip. If reproduction of radiating leg pain occurs with this maneuver, the test is positive and indicates a possible mid-to-upper lumbar radiculopathy or femoral neuropathy.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 63 year-old male with a history of type 2 diabetes mellitus who presents with a 1-week history of sudden-onset constant, burning left lower extremity pain in the anterior thigh, posterior thigh, and medial leg below the knee with numbness and tingling in this distribution. He is functionally independent. On exam he demonstrates intact strength and reflexes of the bilateral lower extremities with impaired sensation in the left lower extremity in his anterior and posterior thigh and medial leg below the knee.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Lumbar radiculopathy, sacral radiculopathy, lumbosacral plexopathy, diabetic radiculoplexopathy/diabetic amyotrophy, femoral neuropathy, sciatic neuropathy, cervical myelopathy, stroke (right anterior cerebral artery), Guillain-Barre Syndrome/AIDP, CIDP, amyotrophic lateral sclerosis (ALS), PLS, diabetic peripheral polyneuropathy, femur/hip or pelvis fracture, polymyositis.\n"
        },
        {
          "title": "+ The patient notes a 30lb weight loss recently along with a hemoglobin A1C of 8.3%. What is the most likely diagnosis?",
          "content": "- Diabetic radiculoplexopathy/diabetic amyotrophy.\n"
        },
        {
          "title": "+ The patient is diagnosed with diabetic radiculoplexopathy/diabetic amyotrophy. How would you proceed with workup?",
          "content": "- I would order a complete blood count (CBC), erythrocyte sedimentation rate (ESR), hemoglobin A1C, EMG left lower extremity, and MRI lumbar spine and left lumbosacral plexus.\n"
        },
        {
          "title": "+ Workup reveals the following:",
          "content": "- CBC: normal\n- ESR: elevated\n- Hemoglobin A1C: 8.3%\n- MRI lumbar spine and left lumbosacral plexus: increased signal in L2-L4 nerve roots and lumbosacral plexus.\n- EMG/NCS left lower extremity: decreased amplitude of sensory nerve action potentials (SNAPs) and compound motor action potentials (CMAPs) of left tibial and fibular/peroneal nerves. Fibrillations and positive sharp waves present in left rectus femoris, semimembranosus, gastrocnemius, and tibialis anterior with rapidly firing voluntarily recruited motor units in this musculature.\n"
        },
        {
          "title": "+ The diagnosis of diabetic radiculoplexopathy/diabetic amyotrophy is supported with your recent test results. How would you proceed with management?",
          "content": "- I would educate the patient on the diagnosis. I would counsel that this condition can be particularly painful, but can be treated with neuropathic pain medications such as gabapentin, pregabalin, amitriptyline, nortriptyline, duloxetine, or venlafaxine. I would advise he monitor his functional status closely as we treat his pain. I would educate that prognosis varies from person to person in terms of pain and functional recovery, but weakness can develop which can affect his function. I would ensure that all questions are answered and that the patient is in agreement with the plan.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient returns to clinic 2 months later and notes that he is falling down repeatedly at home. He is not using an assistive device. He has bruising on his arms and legs. He feels fatigued. Exam reveals unsteady gait requiring him to lean against the wall for support; he demonstrates 2/5 strength throughout the left lower extremity.\n\n"
        },
        {
          "title": "+ What would you advise at this point?",
          "content": "- I would recommend x-rays to ensure no fractures are present from the falls. I would inquire as to whether the patient lost consciousness, felt lightheaded, or struck his head at all. I would ask about any changes regarding, weakness, numbness, tingling, or pain. I would discuss hospital admission for further workup of his falls and fatigue.\nThe patient is admitted to the hospital. X-rays reveal no fractures; however, he is discovered to have sustained a retroperitoneal hematoma compressing his left femoral nerve; the hematoma is evacuated. His hemoglobin is 7.6 g/dL. and his blood sugars average 220-250 mg/dL. Physical and occupational therapy evaluations reveal the patient to be functioning at a moderate assistance level. You are consulted to provide rehabilitation recommendations.\n\n"
        },
        {
          "title": "+ What would you recommend at this point?",
          "content": "- I would recommend inpatient rehabilitation admission.\nThe patient\u2019s insurance company denies inpatient rehabilitation admission, citing that his medical needs can be met at a lower level of care.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would call a peer to peer discussion with the insurance company to explain why the patient should qualify and be approved for IPR. I would note that the patient\u2019s hemoglobin of 7.6 is dangerously low and requires daily medical monitoring to ensure he is not further bleeding into his retroperitoneum or elsewhere, as this risks further nerve dysfunction, organ damage, and death. He requires active management of his diabetes as well, which is not controlled, along with dietary counseling and weight management strategies long-term. He may require insulin, and thus nursing education on how to perform insulin injections and monitor his blood glucose at home. We will actively manage his pain medication and find him a balanced regimen that successfully and consistently treats his pain on an outpatient basis. Finally, his functional level is well below his baseline of independence, and requires 5x/week of physical and occupational therapy to regain functional independence. All of these problems cannot be met at a lower level of care.\nYour peer-to-peer call is successful, and the patient is approved for inpatient rehabilitation admission.\n\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "You are rounding on this patient during his inpatient rehabilitation stay. He is functionally improving and enjoying pain relief with gabapentin. He stops you before you leave his room to see other patients. Pretend that I\u2019m the patient. This is our role-playing portion of this case.\n\nPatient: \u201cOh, please, stay! Let\u2019s pray together. You have been such a blessing and I want to express my thanks for your care with you alongside me.\u201d\n\n"
        },
        {
          "title": "+ Will you join me in prayer?",
          "content": "- This scenario is a sensitive issue, often for both parties. We do not have a templated example response, as proper responses to this scenario can widely vary. In its simplest form, this scenario reflects a grateful patient simply expressing his or her gratitude for your care. The correct answer is to respond in a manner that is consistent with your own belief system, but also promotes harmony, trust, and an ongoing positive relationship between you and your patient. If you are not religious or you belong to a different religious belief system from the patient, it is reasonable to state this or politely decline their offer as long as you ensure you do not offend or demean the patient in any way. Make sure to demonstrate respect for the patient\u2019s belief system. If you do or do not share the patient\u2019s belief system, but would be happy to pray with the patient, then it is also reasonable to do so as long as you feel comfortable with this and do not neglect your other patients in any way. Ultimately this is usually a kind gesture of thanks from a grateful patient, so don\u2019t sweat it!\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "lethargy",
      "title": "Lethargy",
      "url": "https://www.pmrrecap.com/lethargy",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 14 year old girl on your inpatient Rehabilitation unit sustained a moderate-to-severe TBI with a subdural hematoma requiring craniotomy. Her therapist calls you to the gym and tells you that today she has been more drowsy and lethargic than usual.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What is the time course of the change in mental status? Describe what has changed this morning.\n- What are the circumstances surrounding the patient\u2019s initial TBI (mechanism of injury, time since injury, other concomitant injuries)?\n- Describe the patient\u2019s hospital course including labs and imaging.\n- Describe the patient\u2019s recent baseline neurologic status in greater detail.\n- Recent vital signs?\n- Past medical and surgical history?\n- Current medications and recent medication changes?\n- Any risk for recent substance abuse?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs?\n- General appearance?\n- Examination of surgical incision on scalp?\n- Arousal (is the patient attentive; do her eyes open with or without stimulation?)\n- Communication (any attempts at intentional communication?)\n- Command following?\n- Verbalizations or oral movements?\n- Movement of extremities (spontaneous or purposeful?)\n- Object use?\n- Visual pursuit, fixation, or startle?\n- Withdrawal to pain?\n- Within the limits of command following, cranial nerve examination, manual muscle testing, sensory examination?\n- Reflexes and tone/spasticity?\n- Additional examination: heart, lungs, abdomen, extremities\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "You learn that the patient has recently been confused and agitated, but it was difficult to wake her up today and she has been drowsy all morning. On examination she is oriented only to self and briefly follows simple one step commands, but she only sustains attention for a few seconds at a time before falling back asleep, and does not participate in manual muscle testing or the remainder of your neurologic examination.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this change in mental status?",
          "content": "- My primary concern would be new or worsened intracranial pathology, including new or worsened intracranial bleed, hydrocephalus, seizures, or postoperative intracranial infection. Given her history of recent TBI with craniotomy, she is at high risk of developing any of these conditions and I would want to rule these serious conditions out first.\n- Infection would also be high on my differential diagnosis. I would be most suspicious of UTI, pneumonia, surgical site infection, or bacteremia/sepsis.\n- Medication toxicity is also on my differential, as is illicit substance abuse or withdrawal.\n- I am also concerned about possible metabolic disturbance including electrolyte abnormalities or hypoglycemia, hypercarbia from respiratory failure, or severe anemia.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What other metabolic abnormalities could cause altered mental status?\n"
        },
        {
          "title": "Some of the most common include:",
          "content": "- Hypoglycemia or hyperglycemia\n- Hyponatremia or hypernatremia\n- Hypocalcemia or hypercalcemia\n- Uremia\n- Thyrotoxicosis or myxedema coma\n- Thiamine deficiency\n"
        },
        {
          "title": "+ What initial tests would you order?",
          "content": "- The patient is unable to provide a history, so a broad workup would be appropriate. I would start with a CT of her head and a stat fingerstick glucose level. I would also order CBC, CMP, urinalysis, blood cultures, EEG, and chest x-ray. If she is on seizure medications then I would obtain levels of those medications. I would consider obtaining free T4, TSH, and vitamin B12 levels.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "CT scan reveals new hydrocephalus and the remainder of her workup is unremarkable. Her mental status is unchanged.\n\n"
        },
        {
          "title": "+ What steps would you take next?",
          "content": "- I would call neurosurgery as quickly as possible to facilitate transfer to their service for possible neurosurgical intervention. In the interim I would ensure close monitoring of her vitals and \u201cA.B.C.\u201ds of her airway, breathing, and circulation. I would reach out to her POA to inform them of this new diagnosis and transfer.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Broadly speaking, what type of neurosurgical intervention would you expect in this patient with hydrocephalus?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- I would expect the neurosurgery team to place some type of drain or shunt to relieve the increased intracranial pressure, such as an EVD (external ventricular drain), VPS (ventriculoperitoneal shunt), or possibly a lumbar drain.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "Neurosurgery places a VP shunt and the patient improves to her neurologic baseline of Ranchos level 4 (confused and agitated). You see her as a consultant and recommend readmission to inpatient rehabilitation, however insurance denies this due to her agitation, stating that she is not an appropriate candidate because she cannot participate in therapies. You are offered a peer-to-peer conversation to appeal this conversation.\n\n"
        },
        {
          "title": "+ Would you agree to participate in the peer-to-peer conversation with the insurance company?",
          "content": "- Yes, I believe that that would be best for the patient.\n"
        },
        {
          "title": "+ What would be some of the main points that you would like to get across in the conversation? As a reminder, the insurance company has denied the patient since they believe that her agitation precludes her from participating in therapies.",
          "content": "- I would focus on four major points: 1) education on brain injury, 2) therapy goals for an agitated patient, 3) benefits of inpatient PM&R management, 4) patient safety\n- I would be sure to acknowledge that being confused and agitated is a natural and normal part of recovery from brain injury. I could perhaps reference the Ranchos Los Amigos scale to educate the reviewer on brain injury recovery.\n- I would be sure to acknowledge that being confused and agitated is a natural and normal part of recovery from brain injury. I could perhaps reference the Ranchos Los Amigos scale to educate the reviewer on brain injury recovery.\n- I would emphasize the types of therapies that she would be receiving and how this could benefit her and promote her recovery. If possible, I would go back to some of the therapy documentation from her initial rehabilitation admission to give some concrete evidence of how she can participate and progress even if agitated.\n- I would emphasize the types of therapies that she would be receiving and how this could benefit her and promote her recovery. If possible, I would go back to some of the therapy documentation from her initial rehabilitation admission to give some concrete evidence of how she can participate and progress even if agitated.\n- I would discuss the benefits of having a PM&R-trained physician manage her agitation both pharmacologically and non-pharmacologically.\n- I would discuss the benefits of having a PM&R-trained physician manage her agitation both pharmacologically and non-pharmacologically.\n- I would highlight the inpatient rehabilitation unit\u2019s capability to handle this sort of patient. She is currently a danger to herself and others and an inpatient rehabilitation unit would be a safer option than home or a subacute rehabilitation facility.\n- I would highlight the inpatient rehabilitation unit\u2019s capability to handle this sort of patient. She is currently a danger to herself and others and an inpatient rehabilitation unit would be a safer option than home or a subacute rehabilitation facility.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "You have noticed that your 14-year-old brain injured patient\u2019s agitation improves when her mother comes to visit but worsens when large groups of friends or family come to visit her in the evenings. You set a new restriction that only two people can visit at a time. The next time you see her mother (who is her designated POA), she tells you that she is unhappy with the rule since her daughter \u201cneeds her whole family right now.\u201d\n\n"
        },
        {
          "title": "+ How would you respond?",
          "content": "- \u201cThank you very much for accommodating this new change in her care plan. I understand that this is a big sacrifice for you and for your family. I think we all agree that what we want most is your daughter\u2019s recovery. We have found that most people with your daughter\u2019s condition do best in a \u2018low-stimulation\u2019 environment and that even small things like TVs or radios or bright lights can be very distracting. We want to let her brain focus on recovering rather than focusing on everything going on in her room. We are doing our best to keep her room quiet and peaceful and we appreciate the help from your family in doing so, even if it means that she cannot have too many people visit at once. I want to assure you that we have made this decision with your daughter\u2019s best interests in mind. Please let us know how we can support your family in this.\u201d\n- Note: You should be sure to be empathetic, but should not cave to pressure to change your decisions if you believe that they are what is best for the patient. You should explain yourself in ways that are simple and easy to digest. Try your best to be cool and collected and avoid confrontation whenever possible.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "lowbackpain1",
      "title": "Low Back Pain",
      "url": "https://www.pmrrecap.com/lowbackpain1",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 56 year-old male presents with 1 year of low back pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset and context of symptoms?\n- Location, duration, intensity, quality, radiation, aggravating/alleviating factors?\n- Is there associated weakness, numbness, tingling, bowel/bladder dysfunction?\n- Has this ever happened before?\n- Is there a history of trauma/injury/or spine disease?\n- Has he sought care for this before, and if so, what has the workup and treatment been so far?\n- What is his work history and current working status?\n- Functional history and current functional status?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Range of motion of lumbar spine\n- Gait observation\n- Manual muscle testing of bilateral upper and lower extremities\n- Sensory and reflex testing of bilateral upper and lower extremities\n- Special testing: As directed by history. Lumbar facet loading challenge, FABER, thigh thrust, sacral compression test, Gillet, Yeoman, Gaenslen, Fortin finger, straight leg raise, FAIR, slump sit.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are you looking for with the FABER test?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- A positive FABER test will reproduce concordant pain in the contralateral sacroiliac (SI) joint. (Contralateral from whichever lower limb is being actively moved).\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 56 year-old male with a past medical history of atrial fibrillation controlled with a cardiac pacemaker, who has experienced gradual onset axial low back pain without radiation. He has been out of work as an auto mechanic for the last 4 months due to the pain. A course of physical therapy recently was of no benefit. Acetaminophen and oral NSAIDs have not helped. Physical examination is grossly unremarkable.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's back pain?",
          "content": "- Lumbar spondylosis, lumbar facet arthropathy, sacroiliac joint dysfunction/arthropathy, myofascial pain, discogenic pain, ankylosing spondylitis, vertebral body compression fracture, neoplastic process, infectious process, malingering.\n"
        },
        {
          "title": "+ What would be your next steps in workup?",
          "content": "- Xray of lumbar spine\n- MRI of lumbar spine, but first would need to confirm that the patient\u2019s pacemaker is MRI-compatible.\n"
        },
        {
          "title": "+ Results of your workup are as follows:",
          "content": "- Xray of the lumbar spine demonstrates multilevel lumbar spondylosis, degenerative disc disease, and lumbar facet arthropathy that is worst in the L4-L5 and L5-S1 segments.\n- The patient\u2019s cardiac pacemaker is not MRI-compatible.\n"
        },
        {
          "title": "+ What would be your next steps?",
          "content": "- CT scan of the lumbar spine without contrast. If concern for neural impingement, I would consider a CT myelogram of the lumbar spine.\n"
        },
        {
          "title": "+ Your next steps lead to the following:",
          "content": "- CT of the lumbar spine demonstrates mild multilevel central canal stenosis, mild-to-moderate multilevel foraminal stenosis, and moderate-to-severe facet arthropathy in the L4-L5 and L5-S1 segments bilaterally.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would offer lumbar medial branch blocks and consider radiofrequency ablation of the medial branches, particularly aimed at the lower lumbar facets (L4-L5 and L5-S1). I would educate the patient on the rationale for this procedure. I would demonstrate the anatomy, purpose, and procedure using a spine model, drawing, or other educational tools. I would ensure that all questions were answered to the patient\u2019s satisfaction. I would finally ensure that the patient feels fully autonomous regarding what he chooses to do next.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient undergoes your recommended treatment program, but fails to receive any benefit. He continues to complain of low back pain.\n\n"
        },
        {
          "title": "+ What would be your next steps in managing this patient?",
          "content": "- At this moment, it would be appropriate to discuss with the patient the option to see a fellowship-trained pain management specialist. I would discuss that I am more than happy to refer to a trusted pain management colleague for further evaluation and ideas to improve his pain. I would explain that we have exhaused all reasonable options that history, physical examination, and imaging would direct our care towards. I would express compassion and ensure that all questions are answered satisfactorily.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is the role-playing portion of this case, so please pretend that I\u2019m the patient.\n\nPatient: \"Doctor, I can\u2019t keep getting bounced around to different clinics. It seems like nobody can figure out what\u2019s causing my pain. I had some of my wife\u2019s hydrocodone and that really took the pain away. Can you just write me a script for that? I\u2019ll take whatever drug tests you need me to.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- This is a great question. I\u2019m so sorry that we have not been able to find an effective pain control solution for you yet. My goal is always to improve your pain and quality of life so that you can get back to doing the things you enjoy doing. Unfortunately we know from studies that opioid pain medication, such as hydrocodone, is not effective in controlling pain in the long-term. It can also lead to dependence on the medication and requiring higher doses over time, among other side effects, such as constipation, and even possibly breathing problems.\n- Patient: \u201cI can\u2019t work with this pain. I can\u2019t even throw a football around. I can hardly even sit and watch TV. I don\u2019t know why you want me to suffer. I promise I won\u2019t abuse the medication.\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- Again, I am so sorry that your pain is so severe. Unfortunately opioid pain medication is not the most appropriate treatment option, and evidence shows that non-opioid medications can work as well as opioid medications. I would encourage trying a combination of scheduled acetaminophen, NSAIDs, topical lidocaine patch, TENS machine, and even discussing with a pain psychologist ways to modify and modulate your perception of pain so that you can feel more functional throughout the day and less inhibited by your pain. In addition, I do recommend you speak with a pain management physician, as you may qualify for other advanced procedures to treat pain beyond the scope of my expertise.\n- Patient: \u201cYou have got to be kidding me. I am not doing any of that ridiculous nonsense. I can\u2019t work with this pain. If you\u2019re not going to give me what I obviously need, can you at least write a letter telling the insurance company that I\u2019m disabled and can\u2019t work?\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- This is a great question. You may not be able to work due to your pain level. What we need to do is get a good estimate of what sorts of activity you can and cannot perform at this time. The best way to go about this is for us to request a functional capacity evaluation. Based on the results of this evaluation, we can consider a work hardening program for you, which is designed to gradually recondition your body to handle work similar to your job as an auto mechanic. I would also very much encourage consultation with a pain management specialist. I would be more than happy to facilitate each of these steps for you. What questions do you have for me regarding these steps or anything else we\u2019ve discussed today?\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "lowbackpain2",
      "title": "Low Back Pain 2",
      "url": "https://www.pmrrecap.com/lowbackpain2",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 73 year-old female presents with 3 days of low back pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset and context of symptoms?\n- Location, duration, intensity, quality, radiation, constant/intermittent, aggravating/alleviating factors?\n- Is there associated weakness, numbness, tingling, bowel/bladder dysfunction?\n- Has this ever happened before?\n- Is there a history of trauma/injury/or spine disease?\n- Has she sought care for this before, and if so, what has the workup and treatment been so far?\n- Any fever, chills, weight loss?\n- Functional history and current functional status?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Gait observation\n- Manual muscle testing of bilateral upper and lower extremities\n- Sensory and reflex testing of bilateral upper and lower extremities\n- Special testing: As directed by history. Possibly lumbar facet loading challenge, FABER, thigh thrust, sacral compression test, Gillet, Yeoman, Gaenslen, Fortin finger, straight leg raise, FAIR, slump sit.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- If the patient says she fell, what would you want to know?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Why did she fall? Was she lightheaded? Did she lose consciousness or strike her head? Was it a mechanical fall/did she trip on something? Did she lose her balance in some way? In what position did she strike the ground or other objects? Has she fallen before? Does she live with anyone else? How long was she down? How did she get up? When did the pain begin in relation to the fall timing?\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "This patient is a 73 year-old female with a past medical history of hypertension and coronary artery disease (CAD) who presents with 3 days of sudden-onset nonradiating low back pain after a mechanical ground-level fall after slipping on a wet floor at home. Pain is slightly improved with acetaminophen and ibuprofen. She is tender to palpation of the midline thoracolumbar spine. Manual muscle testing is limited by pain.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for her back pain?",
          "content": "- Thoracic/lumbar vertebral body compression fracture, paraspinal muscle strain, myofascial pain, lumbar spondylosis, lumbar facet arthropathy, sacroiliac joint dysfunction, discogenic pain, pyelonephritis, nephrolithiasis, vertebral body osteomyelitis.\n"
        },
        {
          "title": "+ What are your next steps in the workup of her low back pain?",
          "content": "- X-rays of thoracolumbar spine\n- Consider CT or MRI of thoracolumbar spine depending on Xray results\n"
        },
        {
          "title": "+ The results of your workup are below:",
          "content": "- X-rays of thoracic and lumbar spine: anterior wedge deformity of T10 vertebral body with 30% vertebral body height loss.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would recommend oral acetaminophen and NSAIDs on a scheduled basis, along with topical lidocaine patch to the low back, and TENS unit as needed. A short course of opioid pain medication would also be appropriate, if needed. I would consider intranasal calcitonin for pain control, as well. I would recommend avoiding spinal bracing, or only using a brace sparingly, as we want to promote core muscle strength, and brace encourages core muscle disuse which can destabilize the spine and predispose to further injury. Avoid bedrest. I would recommend physical therapy for postural mechanics and core muscle strengthening, with avoidance of flexion-biased exercises. I would discuss home safety and even consider a home safety evaluation. If the pain is still intolerable despite these interventions, I would recommend hospitalization for IV analgesia and possible CT scan or MRI of the thoracolumbar spine. I would recommend to the patient\u2019s primary care physician workup for osteoporosis if that has not already been performed recently, with potentially a DEXA scan, bisphosphonate therapy, calcium, vitamin D, and potentially an endocrinologist referral. I would educate the patient that the pain from a vertebral body compression fracture can take weeks to months as it gradually improves. I would ask the patient if there is anything I can help to clarify or any questions I can help answer about anything we\u2019ve discussed today.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient follows your recommendations. However, in follow-up several weeks later, she notes that pain is still limiting her, despite your interventions. The patient requests additional opioid pain medication.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would recommend consultation with a spine surgeon for vertebroplasty/kyphoplasty, as this has been shown to improve pain in recalcitrant cases of vertebral body compression fracture. A short course of opioids would be appropriate in the interim. I would advise scheduled acetaminophen, oral NSAIDs, TENS, lidocaine patch, and home exercise program in order to reduce opioid usage as much as tolerable.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "1 week later, the patient\u2019s spine surgeon calls your office, asking to speak directly to you. This is the role-playing portion of this case. Pretend that I\u2019m the surgeon.\n\nSurgeon: \u201cWhy didn\u2019t you send this patient to me sooner? She needed kyphoplasty 2 months ago. Your delay in care is causing her unnecessary pain.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- Thank you so much for calling to discuss this patient. I appreciate your concern for her. I want to assure you that my goal remains the same as yours, to improve this patient\u2019s pain and function. My goal is to reach this end in the least invasive way possible. Given that there were appropriate nonsurgical options to try first, it was reasonable to see if we could improve her pain to tolerable levels without surgery. Many patients with vertebral body compression fractures will improve without surgical intervention, and of course surgery brings higher risks associated with it. My process is to escalate care only as appropriate, and as soon as I learned that conservative measures were not helping enough, I referred her to your expertise for surgical management, which I agree is very appropriate at this time. I would be more than happy to discuss guidelines and the case in greater detail if you like so that we can reach a mutual understanding and trust. I value our working relationship and hope that we can continue to work supportively and fruitfully together in the future.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "neckpain",
      "title": "Neck Pain",
      "url": "https://www.pmrrecap.com/neckpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 29 year-old female presents with neck pain and headaches.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What is the onset, timing, location, duration, aggravating/alleviating factors, ?radiation, severity?\n- Was there injury or trauma?\n- Any fever, chills, vision or hearing changes, nausea, weakness, numbness, tingling, gait or balance problems, bowel/bladder changes?\n- Has she had any workup or treatment so far for this problem?\n- Past Medical/Surgical History?\n- Family History?\n- Social History?\n- Functional History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Range of motion of cervical spine and shoulders\n- Cranial nerve examination\n- Manual muscle testing, reflexes, sensation testing of bilateral upper limbs\n- Special testing: cervical facet joint loading, Spurling, Babinski, Hoffman, Neer, Hawkins, Empty Can, painful arc. Other shoulder tests as directed by history and physical examination.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "This is a 29 year-old female who complains of 3 years of gradual onset neck pain without trauma. She has tried heat, ibuprofen, and massage without benefit. On exam her head is tilted to the right in a lateral flexion position. She is neurologically intact.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this problem?",
          "content": "- Cervical dystonia, cervicogenic headaches, migraines, occipital neuralgia, myofascial pain, cervical facet joint dysfunction, tension headaches, shoulder arthritis, rotator cuff disease/impingement, cervical radiculopathy, intracranial pathology.\n"
        },
        {
          "title": "+ You are not certain on workup or treatment recommendations for her suspected condition. How would you go about providing optimal care for this patient?",
          "content": "- I would perform a literature search and read the primary literature regarding workup and treatment options. I seek out and read professional, published recommendations by board-certified physicians in this endeavor. Established textbooks within PM&R are another option in broadening my information search. I would ensure that this case presentation aligns with typical patients in the published literature before proceeding with workup and treatment. If I could not confidently find the answers I am searching for, I would consider referring the patient to another physician who can workup and manage her care.\n"
        },
        {
          "title": "+ What workup would you recommend at this point in time?",
          "content": "- In this neurologically intact patient with isolated positional abnormality, I would recommend no further laboratory or imaging workup at this time.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "The patient is diagnosed with cervical dystonia.\n\n"
        },
        {
          "title": "+ Define dystonia.",
          "content": "- Dystonia is the condition of sustained, abnormal muscle contractions that result in abnormal twisting and/or posturing.\n"
        },
        {
          "title": "+ Name and describe the different classic head postures documented in cervical dystonia.",
          "content": "- Torticollis: horizontal head rotation/turning\n- Anterocollis: head/neck flexion\n- Retrocollis: head/neck extension\n"
        },
        {
          "title": "+ Which muscles are typically involved in torticollis with head turning to the right?",
          "content": "- Left sternocleidomastoid.\n"
        },
        {
          "title": "+ How would you proceed with treatment?",
          "content": "- I would recommend chemodenervation with botulinum toxin as first-line therapy for cervical dystonia. This would be performed with EMG and/or ultrasound guidance for maximum accuracy with minimized risk of distant toxin spread. I would educate and counsel the patient on the diagnosis and treatment plan including all risks and benefits of neurotoxin treatment. I would ensure patient acts autonomously in making her decision.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What is the mechanism of action of botulinum toxin and expected onset and duration of effect?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Botulinum toxin inhibits the release of acetylcholine from synaptic terminals of motor neurons within muscles. It does so by inhibiting syntaxin, synaptobrevin, and SNAP-25 proteins in particular. Without the release of acetylcholine, motor neurons cannot stimulate muscle fibers to contract. Botulinum toxin classically begins to take effect within 3 days, with peak effect occurring approximately 3-6 weeks after injection, and total duration of effect of approximately 3 months.\n"
        },
        {
          "title": "+ What are the risks and potential side effects of botulinum toxin injections, and how can these be minimized?",
          "content": "- It is possible that the neurotoxin can enter a blood vessel and be circulated around the body. If this occurs, the primary concerning side effects are dysphagia, respiratory suppression, and weakness. The risk of side effects is significantly minimized by using EMG guidance, ultrasound guidance, or both in conjunction. Other risks include infection, bleeding, or pain at the injection site.\n"
        },
        {
          "title": "+ If the patient wished to not proceed with chemodenervation due to the risk of side effects, what would your recommendations be?",
          "content": "- I would ask what her understanding is of her diagnosis and purpose of neurotoxin in her case. I would offer to explain or answer any questions she may have regarding any of this. If she still wished to not proceed, she might consider physical therapy, though I would counsel she will likely not improve as well as she might with neurotoxin injections, if at all, and that the evidence indicates neurotoxin injections are the most appropriate first-line therapy for cervical dystonia.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "Ultimately the patient proceeds with botulinum toxin injections and her condition improves. You are seeing her in follow-up and are finishing the visit and preparing to exit the room. Pretend that I am the patient. This is the role-playing portion of this case.\n\nPatient: \u201cI like the way your butt looks in those pants. I\u2019ll be sure to watch as you leave. Hang on - you don\u2019t mind if I take a quick picture of you real quick?\u201d\n\n"
        },
        {
          "title": "+ Your response:",
          "content": "- While I have enjoyed caring for you and am so glad that your condition has improved, affording you a better quality of life, it\u2019s not appropriate to make such statements in a proper doctor-patient relationship, as trust and barriers can easily become impaired. I unfortunately will no longer be able to provide your care beyond this visit. I sincerely appreciate your understanding of this situation. I will be available for urgent/emergent care as needed, and will place a referral to another capable physician who can manage your care. What questions do you have for me?\n- Note: This is a profoundly uncomfortable situation that can occur in real life. You do not have to subject yourself to profoundly uncomfortable or inappropriate situations!\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "poststroke-shoulder-pain",
      "title": "Post-Stroke Shoulder Pain",
      "url": "https://www.pmrrecap.com/poststroke-shoulder-pain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 71 year-old female with a history of stroke is seen on rounds during her inpatient rehabilitation stay. She complains of significant shoulder pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Is the pain unilateral or bilateral? If unilateral, which side is affected?\n- Onset, duration, radiation, quality, intensity, aggravating/alleviating factors for the pain?\n- Is there injury/trauma history?\n- Any specific shoulder pathology history? Has this pain happened before?\n- Are there any neck pain, sensory or bowel/bladder changes? Any fever, chills?\n- Does the patient have a history of diabetes?\n- What is the patient\u2019s stroke history and treatment?\n- Does the patient have spasticity? Is it treated?\n- Functional history and current functional status, including equipment usage?\n- Social history?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Range of motion of neck, shoulders, elbows\n- Modified Ashworth Scale scores of upper limbs\n- Manual muscle testing, sensation, reflex examination of bilateral upper limbs\n- Special testing: Spurling, Neer, Hawkins, Empty Can, Speed, Yergason, O\u2019Brien, Scarf\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Why look at Modified Ashworth Scale scores?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- A patient with a history of stroke and elevated MAS scores in the setting of shoulder pain could be experiencing shoulder pain secondary to uncontrolled spasticity. In such a case, identifying and controlling the spasticity is key to improving the patient\u2019s shoulder pain and function.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 71 year-old female with a history of ischemic right middle cerebral artery (MCA) stroke 3 months ago, resulting in left hemiparesis, who has been residing in a skilled nursing facility until presenting to your inpatient rehabilitation unit for functional recovery. She complains of 2 months of new gradual onset left shoulder pain, worse with range of motion. There is no specific injury history. Current medications include aspirin, atorvastatin, amlodipine, and baclofen. Physical examination reveals intact neuromuscular status on the right side with 3/5 strength throughout the left upper limb and 4/5 strength in the left lower limb. There is significant pain with Neer, Hawkins, and Scarf maneuvers.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's left shoulder pain?",
          "content": "- Rotator cuff tear, rotator cuff impingement, subacromial bursitis, glenohumeral joint arthritis, acromioclavicular joint arthritis, spasticity, adhesive capsulitis/frozen shoulder, shoulder subluxation, cervical radiculopathy, myofascial pain.\n"
        },
        {
          "title": "+ Further physical examination reveals the following:",
          "content": "- She has globally impaired range of motion in the left shoulder, notably in flexion and abduction, which are both limited to 60 degrees passively and cause significant pain when attempting to range. Her MAS scores are 1/4 in left shoulder abduction and elbow flexion. You detect half a fingerbreadth of shoulder subluxation.\n"
        },
        {
          "title": "+ What is the most likely etiology of this patient's shoulder pain?",
          "content": "- Adhesive capsulitis/frozen shoulder.\n"
        },
        {
          "title": "+ How would you manage this condition?",
          "content": "- I would discuss with her nurse, physical therapist, and occupational therapist on this inpatient rehabilitation unit the likely diagnosis and treatment plan which should include aggressive range of motion of the shoulder daily along with strength and activation exercises. I would also discuss this during weekly team conference so that all team members are aware of the diagnosis and plan. We need to encourage use of the shoulder. Heat, ice, ultrasound, and massage as needed. Oral acetaminophen and NSAIDs. Topical lidocaine and/or diclofenac could be trialed. I would educate the patient on the likely diagnosis and management plan, and ensure that all questions are answered satisfactorily.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient\u2019s inpatient rehabilitation stay and functional gains in therapy have become extremely limited due to her shoulder pain and impaired range of motion.\n\n"
        },
        {
          "title": "+ What would you recommend next?",
          "content": "- Glenohumeral corticosteroid injection to reduce inflammation and improve the range of motion deficit secondary to the adhesive capsulitis.\n"
        },
        {
          "title": "+ Take me through the steps of a glenohumeral joint injection and how you will minimize risk of harm and side effects for the patient.",
          "content": "- I would start with education and informed consent about the risks and benefits of a glenohumeral joint corticosteroid injection. Namely, I would discuss the risk of infection, bleeding, worsened pain, lack of efficacy, inaccuracy of needle placement, and blood sugar elevation, along with the intended benefit of pain relief. If informed written consent were obtained, I would ensure that the patient does not have any allergies to the proposed medications. I would plan to inject 4 mL of 1% lidocaine and 1 mL of injectable corticosteroid. I would draw up these medications into a sterile syringe and then attach a 25-gauge 1.5-2.0 inch needle to this syringe. With the patient seated, affected arm rested at her side, I would mark the needle entry point with a marker (the sulcus between the acromion and humeral head), sterilize the skin with alcohol swabs x3 or similar skin disinfectant, and pierce the skin with the needle, directing the needle towards the coracoid process. With the needle fully inserted, I would aspirate the syringe to confirm there is no blood present within the syringe, and if negative for blood, I would inject the entire contents of the syringe. After injection, I would withdraw the needle out of the skin, dispose of it in a sharps container, apply sterile gauze to the needle entry site while holding firm pressure, and then apply a sterile bandage over the needle entry site. I would educate that it may take up to 3 days for the patient to begin noticing benefit from the steroid injection.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The following week, the patient\u2019s physical therapist approaches you after team conference. The patient has 1 week remaining in her inpatient rehabilitation stay and her therapist wants to maximize functional gains before patient is discharged home with family. Her therapist has read that a high-volume shoulder injection can help to distend the shoulder capsule and restore range of motion. This is not something you are familiar with until now. Pretend that I am the patient\u2019s therapist.\n\nPhysical therapist: \u201cHere is the paper I\u2019m talking about. The high-volume shoulder injection seems to really help range of motion quickly, and is superior to standard shoulder injections! The best part is it\u2019s the same exact thing as a typical shoulder injection, only you add in 5-6 mL of normal saline for the volume.\u201d\n\n"
        },
        {
          "title": "+ How would you respond?",
          "content": "- Thank you for bringing this technique to my attention! You are such a strong advocate for our patient, and I know you have been helping her tremendously in her functional recovery. I will happily review this paper and consider adding this procedure to my skillset in the future, but unfortunately at this time I do not feel comfortable proceeding with this procedure, though it is certainly something I will consider for her in the future.\n"
        },
        {
          "title": "+ The therapist responds:",
          "content": "- \u201cBut she doesn\u2019t need it in the future. She needs it now. You know as well as I do that her rehab progress will significantly slow once she is home, and we need to maximize every inpatient rehab day that we can while she is here. Please do this injection so that I can help her!\u201d\n"
        },
        {
          "title": "+ Your response:",
          "content": "- Unfortunately I cannot proceed with a procedure that I am uncomfortable with, having not yet learned of its details, risks, benefits, and data supporting or refuting it. I am certainly interested in reviewing this option for her, and I could indeed potentially perform this in the future for her and other patients with frozen shoulder. We will continue her physical therapy and I will of course place an order for this to continue outside our hospital. She may ultimately experience thawing of the shoulder which itself may resolve the frozen shoulder. If not, I will see her in follow-up routinely, so will keep a close eye on how the shoulder is doing and if she needs further treatments for it. Does that sound like an acceptable plan?\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "progressiveweakness",
      "title": "Progressive Weakness",
      "url": "https://www.pmrrecap.com/progressiveweakness",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 46 year-old female presents with 3 months of progressive weakness.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Onset of symptoms?\n- Please describe the weakness. Where exactly does she feel weak? What functional tasks or activities of daily living (ADLs) does she have difficulty performing?\n- Was there injury/trauma?\n- Is there pain? If so, where exactly is the pain? Quality, duration, aggravating/alleviating factors, radiation?\n- Has this ever happened before?\n- Is there stiffness, fever, rash, gait dysfunction, dysphagia, numbness, or tingling?\n- Any bowel or bladder deficits?\n- What has she tried so far to alleviate the problem? Medications, therapy, bracing, injections, surgery?\n- Has she had any workup already for this problem?\n- Is she typically physically active?\n- What is her work history and current working status?\n- Functional history and current functional status?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Gait observation\n- Skin, heart, lungs examination\n- Manual muscle testing of bilateral upper and lower extremities\n- Sensory and reflex testing of bilateral upper and lower extremities\n- Special testing: As directed by history. Consider Spurling, Straight leg raise, Tinel.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient\u2019s symptoms began gradually over the past few months without trauma. She has no significant past medical history other than hypertension and hyperlipidemia for which she takes lisinopril and atorvastatin. She is functionally independent. She notes progressive weakness most noticeable when climbing the stairs or carrying bags of soil while gardening. She denies numbness, tingling, or bowel or bladder deficits. Her muscles feel sore especially towards the end of the day, even if she has not exercised. On examination, her vital signs are normal. She exhibits marked difficulty when rising from a chair. She is tender to palpation over her bilateral thighs. Manual muscle testing reveals 4/5 strength in bilateral shoulder flexion and abduction, bilateral hip flexion and knee extension, and 5/5 distally in the upper and lower extremities.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Polymyositis (PM), dermatomyositis (DM), inclusion body myositis (IBM), Lambert-Eaton Myasthenic Syndrome (LEMS), Myasthenia Gravis (MG), statin myopathy, Guillain-Barre Syndrome (GBS/AIDP), CIDP, systemic lupus erythematosus (SLE), cervical myelopathy, polymyalgia rheumatica (PMR).\n"
        },
        {
          "title": "+ What would be your next steps in managing this patient?",
          "content": "- I would start physical therapy for functional rehabilitation, as this patient is having difficulty performing ADLs and I want to ensure she can maintain independence. I also need to reach a diagnosis in her so we can tailor her treatment appropriately. Thus, I would like to order some labs and an EMG/nerve conduction study to start.\n"
        },
        {
          "title": "+ What specific labs would you order?",
          "content": "- I would order a complete blood count (CBC), CK, ESR, CRP, AST/ALT, aldolase, and LDH. I would consider adding ANA, anti-smith antibodies, and anti-Jo-1 antibodies depending on these results.\n"
        },
        {
          "title": "+ EMG returns, showing evidence of a myopathic process. Describe the findings of myopathy on EMG.",
          "content": "- Increased insertional activity, possibly fibrillations. Early recruitment of short-duration, small-amplitude motor unit action potentials (SDSA MUAPs). May see presence of complex repetitive discharges (CRDs).\n"
        },
        {
          "title": "+ Laboratory studies reveal the following:",
          "content": "- CBC: normal\n- CK: elevated\n- ESR: elevated\n- CRP: elevated\n- Aldolase: elevated\n- LDH: elevated\n- AST/ALT: elevated\n"
        },
        {
          "title": "+ You receive these results, but your patient is not able to get in to see you in follow-up for another 3 months. What is your next step?",
          "content": "- I would either add her onto my schedule in an extra patient slot in the very near future, or would call her personally and discuss her test results and next steps.\n"
        },
        {
          "title": "+ The patient does not want to come into the office but wants direction on what to do next. What is your next step?",
          "content": "I would call her, verify her identifying information, and explain the test results and next steps which should be a referral to a neuromuscular specialist or rheumatologist. I would also recommend getting a muscle biopsy.\n\n"
        },
        {
          "title": "+ Muscle biopsy of the quadriceps (the side not studied on EMG) reveals the following:",
          "content": "- Inflammatory cell load within muscle fibers.\n- Perifascicular atrophy.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is the role-playing portion of this case. Pretend that I am the patient.\n\n"
        },
        {
          "title": "+ Doctor, what does this all mean? I don\u2019t understand why I am so weak and getting all these tests without answers.",
          "content": "- I would be happy to discuss this with you. Based on your pattern of weakness, laboratory tests, EMG, and muscle biopsy, I am concerned that you are suffering from a condition that causes muscle inflammation and weakness, specifically a condition called polymyositis. Essentially, inflammation enters the muscles due to an unknown cause, and this can cause significant muscle weakness as a result.\n"
        },
        {
          "title": "+ What can we do to fix it?",
          "content": "- Unfortunately we will likely not be able to completely cure the condition, but we have treatments available that can manage it for you. It starts with physical therapy to help maintain your function and independence so you can keep doing the activities that you enjoy doing without assistance. We also need to treat the inflammation so your strength can improve. This is done by using medicine called steroids (corticosteroids/glucocorticoids), and possibly more specific medications for your immune system as well. That is where the guidance of a rheumatologist or neuromuscular specialist will help us.\n"
        },
        {
          "title": "+ Are there side effects of using steroids like this? What should I worry about?",
          "content": "- Yes. Longterm steroid usage can cause a condition called osteoporosis, which is essentially bones that are not as strong as normal. This is why it\u2019s important to order a bone scan for you called a DEXA scan, which can measure your bone density levels prior to starting these steroids. I would also ask you to consult with an endocrinologist for recommendations on how to limit bone loss during this period of steroid usage. I will personally notify all the physicians involved in your care so that everyone is on the same page and up to date with our management. These are excellent questions you ask. What other questions do you have for me today?\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "rightelbowpain",
      "title": "Right Elbow Pain",
      "url": "https://www.pmrrecap.com/rightelbowpain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 16 year-old male baseball player presents with right elbow pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Onset, location, duration, radiation, quality, intensity, aggravating/alleviating factors?\n- Was there any recent injury or prior injury to that arm?\n- Any numbness, tingling, weakness, fever/chills, neck pain, or pain elsewhere in the limb?\n- Was/is there any pop/swelling/discoloration to the elbow?\n- What position does the patient play?\n- If he is a pitcher, does he have a pitch count/limit?\n- What is the patient\u2019s dominant hand? Is the pain in the patient\u2019s throwing arm or other arm?\n- What is his performance and training schedule/regimen like? What kind of league does he play in?\n- Has he been worked up or treated for this problem yet? If so, what has been done? Consultations, imaging, therapy, medications, injections, etc.?\n- Past medical/surgical history?\n- Social history? Supportive family?\n- Sports history? Is baseball his only sport? What else does he play?\n- Does he enjoy sports/baseball/his team/etc?\n- What are his future career and athletic plans?\n- How is he doing in school? What kind of grades does he get?\n- What medications does the patient take?\n- Allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection of bilateral upper limbs\n- Palpation of bilateral upper limbs including elbows\n- Range of motion of bilateral shoulders and elbows\n- Manual muscle testing, sensation, reflex testing of bilateral upper limbs\n- Special testing: Empty can, Neer, Hawkins, Speed, Yergason, Hook, varus/valgus stress testing of elbow in slight flexion and full extension, Tinel at medial elbow, milking maneuver, grip strength, distal interphalangeal joint flexion strength of digits 2,3 vs. 4,5; brachial artery, ulnar artery, radial artery pulse check, Hoffman, Spurling\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Why do you want to test isolated flexion strength of the distal phalanges?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- This would be one way to test the patient\u2019s neurologic status in that limb. With elbow injuries can come the presence of peripheral nerve injury or entrapment, which may manifest as numbness, tingling, pain, or weakness in the affected limb. By testing DIP flexion in digits 2-5, I am testing the anterior interosseous nerve (digits 2,3) compared to the ulnar nerve (digits 4,5). If I detect weakness in one set of digits vs. the other, it will help diagnose if a nerve injury is present, which will need to be treated.\n"
        },
        {
          "title": "+ Anything else you would like to know about the history?",
          "content": "- No, thank you. That will be all.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 16 year-old right-handed male pitcher who plays on a competitive baseball team for 9 months out of the year. His performance is regularly monitored by college scouts, as he routinely throws 90+ miles-per-hour fastballs. He presents with 2 weeks of right elbow pain, worst during his throwing motion. He has tried icing his elbow and taking ibuprofen with minimal relief. He denies trauma. On examination his strength and sensation are intact, except for 4/5 strength in his distal finger flexors which causes him to grimace during testing. Empty can and Neer tests are negative. He has pain with Speed, Yergason, and varus/valgus stress testing.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for his right elbow pain?",
          "content": "- Right medial collateral ligament/ulnar collateral ligament (UCL) sprain, medial or lateral epicondyle stress fracture, valgus extension overload syndrome (VEO), medial epicondylitis (Golfer\u2019s Elbow), lateral epicondylitis (Tennis Elbow), common flexor tendon strain, common extensor tendon strain, medial or lateral epicondyle avulsion fracture, distal biceps tendonitis/tear, median nerve injury, ulnar nerve injury, right shoulder injury/rotator cuff tear, cervical radiculopathy.\n"
        },
        {
          "title": "+ What workup would you arrange for this patient?",
          "content": "- Right elbow x-rays (AP, lateral)\n- Diagnostic ultrasound scan of right elbow if I possess the skills to perform this scan in this scenario. If not, I may refer out for this\n- MRI right elbow\n"
        },
        {
          "title": "+ What else would you order?",
          "content": "- Nothing else at this time. Thank you.\n"
        },
        {
          "title": "+ Your workup reveals the following:",
          "content": "- Right elbow x-ray: normal\n- Diagnostic ultrasound scan: excessive widening of the medial elbow joint space with valgus stress testing when compared to the lateral elbow during varus stress testing.\n- MRI right elbow: partial tear of the right ulnar collateral ligament (UCL)\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would counsel and educate the patient on the diagnosis, management plan, and prognosis. I would start with rest, ice, and oral NSAIDs as needed. The patient would need to refrain from pitching activity for several weeks while the ligament heals. I would start gentle, progressive physical therapy to rehabilitate the ligament and correct pitching mechanics once the patient is able to participate without pain. If the patient fails physical therapy I would offer a referral to an orthopedic surgeon for UCL repair or reconstruction.\n"
        },
        {
          "title": "+ What are the implications, and how would your management change if the patient complained of numbness and tingling in the medial forearm and digits 4,5 with impaired strength of distal interphalangeal joint flexion in digits 4,5, first dorsal interosseous, and abductor digit minimi?",
          "content": "- I would suspect electrodiagnostically significant ulnar nerve injury at the elbow in this case, which would warrant an EMG/nerve conduction study of the right upper extremity as well as likely a referral to an orthopedic surgeon for ulnar nerve transposition. The surgeon may elect to perform UCL repair/reconstruction at that time as well, given the patient\u2019s high-level pitching and anticipated future in college/professional athletics.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "You notice that this is your 6th case of UCL injury in baseball players in the past 3 weeks. These players are all part of competitive leagues.\n\n"
        },
        {
          "title": "+ What actions would you take upon discovering this?",
          "content": "- I would inquire and discuss with each of these patients the particulars of their training regimens, league schedules, pitch counts (or lack thereof), play schedule, return to play protocols, coaching strategies and beliefs, and the presence of any other injuries that they have noticed in their leagues. With the patient and their parents\u2019 permission I would reach out to the coaches of these players to discuss my findings and my concerns about overuse injuries in their athletes.\n- I would inquire about the coaches\u2019 thoughts regarding these injuries and their overrepresentation in my clinic, and would ask the same questions above to the coaches. My goal would be to come to a mutual understanding and action plan for how to prevent further accumulation of injuries in this baseball population in order to protect these players. I would also seek guidance from national youth sports organizations regarding baseball players and their sporting activity. I would ask all parties if they have any questions for me, and of course remind them that I am here to assist with any sport-related injuries that may occur to these players.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient returns for followup after completing 3 months of physical therapy. He has no pain with pitching, and is throwing his highest velocity ever. This is the role-playing portion of our encounter. I will be acting as the patient.\n\nPatient: \u201cThanks, doctor! I feel better than ever. I hit 95 mph on the radar the other day. I\u2019d say the anabolics are doing their job. I\u2019m hoping to play professionally within a year or two!\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I am so glad to hear that you are doing better without pain! 95 mph is very impressive! You have a bright future ahead of you. May I ask you to clarify what you mean by \u201canabolics\u201d?\n"
        },
        {
          "title": "+ The patient responds:",
          "content": "- Oxandrolone. It\u2019s similar to testosterone. All the pros take it. You pretty much have to take it in order to compete and make it to the big leagues. It\u2019s the reality of competitive sports. My brother says it\u2019s going to be legal soon, so I wanted to stay ahead of the game. It\u2019s clearly working!\n"
        },
        {
          "title": "+ Your response?",
          "content": "- I commend your competitive spirit. As I said, you no doubt have a bright future ahead of you. However, I am concerned about your health and safety. Anabolic steroids are unfortunately very dangerous and should only be used in a supervised medical setting for certain medical conditions, prescribed by a trained physician. Does anyone else know that you are taking anabolic steroids?\n- Patient: I haven't told anybody yet.\n"
        },
        {
          "title": "+ You continue, saying...",
          "content": "- Unfortunately anabolic steroids have a number of health risks associated with them, including the risk for heart attack. I don\u2019t say this to scare you, but to educate you on the risks. I do strongly advise that you abstain from using performance-enhancing drugs such as anabolic steroids to help with athletic performance. I know you are concerned about having a competitive disadvantage to other players, but in reality, nowadays steroid usage is a lot less common than you might think. How do you feel about discussing this with your parents? Do you feel supported by them and comfortable enough to talk about this with them? I want you to know that I am always here to help you through your athletics, and your health, safety, and sports performance are important to me. What questions do you have for me today? Is there anything else I can help to explain or clarify?\n- Note: If a patient confides in you that they use anabolic steroids, this can be a difficult discussion and even a difficult set of decisions for the physician to make. In reality you can always check state and national laws regarding anabolic steroid or illegal substance use and what your actions must be from a legal standpoint. In this case, the most important thing to highlight is the act of maintaining a relationship of trust between you and your patient. You don\u2019t want to shame the patient and make them discharge themselves from your care. You want to be source of guidance for the patient and someone whom they feel safe talking to. You should also encourage they develop a healthy line of communication with their parents.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "rightfootdrop",
      "title": "Right Foot Drop",
      "url": "https://www.pmrrecap.com/rightfootdrop",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 61 year-old male presents with 3 months of right foot drop.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this begin? Has it happened before?\n- Any history of trauma or injury?\n- Has he fallen?\n- Is the foot drop worsening?\n- Is there associated pain, numbness, or tingling? If so, where?\n- Is there weakness anywhere else?\n- Any other functional changes? E.g. bowel/bladder changes, balance problems.\n- Past medical/surgical history?\n- Family history?\n- Functional history?\n- Medications and allergies?\n- Social history? What is the patient\u2019s work situation and environment? Is he able to perform his job duties safely and satisfactorily?\n- Has he sought care or had this problem evaluated by another doctor before?\n- What has he done to help treat the problem so far, if anything?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection (gait, ?foot slap, ?too many toes sign, muscle atrophy, skin changes, bruising)\n- Manual muscle testing of bilateral lower extremities, and upper extremities if indicated by the history or remainder of physical examination\n- Sensory and reflex testing of bilateral lower extremities\n- Special testing: Tinel at tarsal tunnel and fibular head, straight leg raise, slump sit\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 61 year-old male accountant with a past medical history of hypertension, hyperlipidemia, and GERD. He takes amlodipine and atorvastatin for these conditions. He has been active for most of his adult life, and enjoys running in long distance races. He denies numbness, tingling, or bowel or bladder changes. He does feel like his grip strength is reduced and finds himself fumbling with his car keys more often than usual, occasionally dropping them. His foot drop has progressively worsened over the past 3-4 months. On exam, his right foot exhibits 3+/5 dorsiflexion strength and there is an audible foot slap when he walks. There is hyperreflexia in bilateral biceps, brachioradialis, and patellar reflexes. There is hand musculature atrophy bilaterally.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for the foot drop?",
          "content": "- Anterior horn cell disease (ALS and its variants), cervical myelopathy/stenosis, cervical radiculopathy, lumbar radiculopathy, lumbar spinal stenosis, AIDP (Guillain-Barre Syndrome), CIDP, Charcot-Marie-Tooth (CMT) disease, postpolio syndrome, stroke\n"
        },
        {
          "title": "+ What type of workup would you arrange for this patient?",
          "content": "- This patient demonstrates notable weakness and atrophy with upper motor neuron findings (hyperreflexia) in both upper and lower limbs, so an MRI of the brain and cervical spine is a reasonable place to start in working him up. Consideration could be given to MRI of thoracic and lumbar spine.\n- Depending on the results of the imaging, EMG/NCS of all 4 limbs would be considered.\n"
        },
        {
          "title": "+ What are your initial management recommendations for this patient?",
          "content": "- Prescribing a right ankle-foot orthosis (AFO) would be appropriate for the patient\u2019s safety and re-establishing proper gait mechanics. He may be prescribed an assistive device such as a cane as needed. Physical and occupational therapy prescriptions directed toward his functional rehabilitation are appropriate as well.\nMRI of the brain and cervical spine reveal no significant stroke or cervical spine stenosis.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- The MRI of the brain and cervical spine did not reveal any structural reason for the patient's weakness, so we need to keep searching to find out what is causing his symptoms. An EMG/nerve conduction study is an appropriate test at this point. I would educate and explain to the patient my rationale, and ensure that all questions are answered satisfactorily.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "EMG/NCS reveals increased insertional activity, fibrillations and positive sharp waves, and polyphasic motor unit action potentials in bilateral tibialis anterior, medial hamstrings, rectus femoris, first dorsal interosseus of the hand, biceps brachii, and thoracic paraspinals.\n\n"
        },
        {
          "title": "+ What is your leading diagnosis and next step?",
          "content": "- ALS (amyotrophic lateral sclerosis) and its variants, such as PLS. I would explain to the patient why a neurology referral is appropriate so that the patient can receive the most up-to-date medical treatment for his condition and possibly be enrolled in any clinical trials.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient states, \u201cI don\u2019t understand, doctor. I\u2019ve been active my whole life. There\u2019s no reason my body should be weak like this. What is going on? Am I going to die or become crippled?\u201d\n\n"
        },
        {
          "title": "+ How would you respond? This is our role-playing portion of the case. Pretend that I'm the patient.",
          "content": "- The most important thing is to align yourself with the patient, counsel on the likely diagnosis and prognosis, and explain the treatment plan from your perspective going forward. Always ask if there are any questions or anything you can help explain before they leave the office. Always send a copy of your note to the patient\u2019s primary care physician and neurologist so that all managing parties are on the same page.\n- A reasonable response would be, \u201cI am so sorry that you are going through this. I can\u2019t imagine how difficult this must be for you. I want you to know that I will be here for you every step of the way, starting with your rehabilitation. I am always here to help answer questions or clarify anything about your diagnosis. ALS is unfortunately your most likely diagnosis right now, and this disease most commonly leads to progressive disability and death over roughly 3 years. There are things we can do to maintain your function or slow down your functional loss, including bracing and submaximal exercise. I would also like to ask one of my neurologist colleagues to see you and offer you the most up-to-date treatments for ALS, including exploring if there are any clinical trials you might be able to participate in. This diagnosis is devastating to learn, and I would be more than happy to help you identify counseling services that might benefit you as you go through this process. I will send a copy of my office note today to your primary care physician as well as to your neurologist so that they are aware of our findings and plan. I would like to see you back in 6-8 weeks to see how you are doing with your rehabilitation needs. What other questions do you have for me today?\u201d\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "righthandnumbness",
      "title": "Right Hand Numbness",
      "url": "https://www.pmrrecap.com/righthandnumbness",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 58 year-old female presents with 2 months of right hand numbness and tingling.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Is there pain?\n- Is there specifically neck pain?\n- What are the pain characteristics?\n- Where exactly in the right hand is the numbness and tingling?\n- Onset/duration/radiation/aggravating and alleviating factors?\n- Is there numbness, tingling, or pain anywhere else on the body, such as the other hand or the lower extremities?\n- Is there any bowel/bladder/gait dysfunction?\n- What has she tried so far to alleviate the problem?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Manual muscle testing (i.e. \u201cmyotome scan\u201d of the upper limbs more so than lower limbs)\n- Sensory examination\n- Reflex testing\n- Special testing: Spurling, Tinel at wrist and medial epicondyle, Phalen, Reverse Phalen, Carpal Compression Test, Froment, \u201cOK\u201d sign, Hoffman\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- How does one correctly perform the Phalen test?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The examiner asks the patient to extend his/her elbows while fully flexing the wrists, and to hold this position for 30-60 seconds. If the patient\u2019s typical hand paresthesias/pain are reproduced, then the test is positive and suggestive of Carpal Tunnel Syndrome (median neuropathy at the wrist).\n"
        },
        {
          "title": "Domain B: Problem Solving",
          "content": "The patient exhibits normal strength and reflexes. However, there is decreased sensation to light touch in the 3rd and 4th digits of the right hand. The Tinel tests at the right elbow and wrist are positive.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis?",
          "content": "- Carpal tunnel syndrome (median neuropathy at the wrist), ulnar neuropathy at the elbow, cervical radiculopathy, peripheral neuropathy, brachial plexopathy, polyneuropathy, cervical myelopathy, stroke.\nThe patient tries your suggested treatment program for 4 weeks. She sees you in follow-up, noting that her numbness has worsened and she is having trouble buttoning her shirt each day.\n\n"
        },
        {
          "title": "+ What would be your next action in the workup of this problem?",
          "content": "- Electrodiagnostic studies (EMG/NCS)\n- Consider MRI of cervical spine depending on EMG/NCS results\n"
        },
        {
          "title": "Domain C: Patient Management",
          "content": "EMG/NCS of the right upper extremity reveals median neuropathy at the wrist of moderate severity. She has failed wrist braces and NSAIDs.\n\n"
        },
        {
          "title": "+ How would you proceed with treatment?",
          "content": "- Offer right carpal tunnel injection\n- Discuss potential surgical intervention on the flexor retinaculum via potential hand surgeon referral\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are some of the electrodiagnostic findings you would expect to see in moderate or severe carpal tunnel syndrome as opposed to mild disease?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Increased involvement of the median motor fibers, including prolonged motor latency, reduced motor amplitude, and evidence of active denervation on needle exam as indicated by the presence of fibrillations and positive sharp waves.\n"
        },
        {
          "title": "Domain D: Systems-Based Practice",
          "content": "The patient\u2019s insurance company denies the request for a carpal tunnel injection.\n\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- Call the insurance company and perform a peer-to-peer discussion, ask them for the reason for denying the request, and explain the conservative treatment already tried and failed. Explain the medical necessity and rationale for the next step (injection).\n- Appeal the decision.\n"
        },
        {
          "title": "Domain E: Interpersonal and Communication Skills",
          "content": "Your peer-to-peer discussion is successful, and the insurance company approves the carpal tunnel injection. The patient agrees to proceed with the carpal tunnel injection. However, 2 days after the injection your office receives a phone call from the patient, who is upset. She states, \u201cI just looked up what you injected into me. You never told me you were going to inject steroids into my body! I know how bad those mess you up! You are just trying to line your pockets so you can buy your next car!\u201d\n\n"
        },
        {
          "title": "+ How would you respond?",
          "content": "- A good example response would be: \u201cFirstly, I want to say that I am so sorry that you are going through this in the first place. This is a difficult problem for you to suffer with, and I also know that it\u2019s not easy to sort through the treatment options. I sincerely apologize for any miscommunications or misunderstandings that may have taken place. I want to assure you that you and I are on the same team. If you have time, I would be more than happy to discuss the treatment we have tried so far, and the most reasonable next steps we could take to help alleviate your hand numbness, as well as why these steps are necessary, and what might happen if we don\u2019t attempt to treat this problem appropriately. Additionally, you are correct, a carpal tunnel injection would involve corticosteroids; again, I apologize for not discussing that aspect in more detail with you at your visit, but I would be happy to discuss the reasoning for corticosteroid usage in your case, as well as any potential side effects we may see from this procedure. You can always reach out to me in the future with any questions or concerns. Additionally, I will send a copy of my note to your primary care physician so that we are all on the same page. Is there anything else you would like to talk about today, or any other questions you might have?\u201d\n- Naturally your answer will vary greatly, but something along these lines will suffice. Always \u201cally yourself\u201d with the patient, and present the situation as \u201cyou and the patient vs. the problem\u201d, instead of \u201cyou vs. the patient\u201d. Never \u201cgo head to head\u201d with the patient, as the examiners will see you as combative, rather than collaborative. Always ask if there are any further questions the patient has, and always keep the patient\u2019s primary care physician in the loop.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "rightkneepain",
      "title": "Right Knee Pain",
      "url": "https://www.pmrrecap.com/rightkneepain",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 60 year-old male presents to your outpatient clinic with 3 months of right knee pain.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What are the pain characteristics? E.g. onset, location, duration, aggravating/alleviating factors, severity, radiation, timing, quality\n- Was there injury or trauma?\n- Was there a pop? Is there swelling? Redness?\n- Is there any locking or clicking? Does the knee give out?\n- Any constitutional symptoms? Fever/chills?\n- Has this happened before? Any history of knee problems?\n- What has the patient tried so far to help with the pain? Specifically, physical therapy, oral medications, injections, or surgery? Has the patient sought care or had a workup?\n- Is there pain anywhere else, notably back or hip pain? Is there numbness/tingling/weakness?\n- Past Medical/Past Surgical History?\n- Functional History? Is patient physically active?\n- Social History? What is the patient\u2019s work situation? Can he work with the pain?\n- Does the patient have any allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Manual muscle testing of bilateral lower extremities (myotome scan)\n- Sensory and reflex testing of bilateral lower extremities\n- Gait observation/analysis\n- Special testing: Patellar grind, patellar excursion, varus/valgus stress testing, anterior and posterior drawer, Lachman, McMurray, Bounce Home, Thessaly, Apley Grind, Pivot Shift, medial and lateral Joint Line Tenderness, Ballottement, Fulcrum, Straight Leg Raise\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are you trying to assess by performing the Thessaly test?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The Thessaly test is intended to assess for a medial or lateral meniscus tear in the knee. A positive test (knee pain reproduced during the test) indicates a meniscus tear.\nThe Thessaly test is intended to assess for a medial or lateral meniscus tear in the knee. A positive test (knee pain reproduced during the test) indicates a meniscus tear.\n\n- Note: Always be prepared to explain how to perform a test, why you are performing it in a particular patient, and what the test is intended to diagnose.\nNote: Always be prepared to explain how to perform a test, why you are performing it in a particular patient, and what the test is intended to diagnose.\n\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient has been taking acetaminophen and ibuprofen with only mild relief. Vital signs are within normal limits. There is mild swelling of the right knee. The patient exhibits normal sensation and reflexes. Knee extension strength is 4/5 on the right with pain upon testing, and 5/5 on the left. There is pain in the right knee with varus and valgus stress testing, Thessaly test, and Joint Line Tenderness. Lachman is negative.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Medial or lateral meniscus tear, medial/lateral collateral ligament sprain, patellofemoral pain syndrome, quadriceps tendonitis, patellar tendonitis, ACL/PCL tear, quadriceps muscle strain, pes anserine bursitis, primary hip joint pathology, iliotibial band syndrome (IT band syndrome), femoral stress fracture, Segond fracture, osteoarthritis, rheumatoid arthritis, lumbar radiculopathy.\n"
        },
        {
          "title": "+ MRI confirms a degenerative tear of the medial meniscus of the right knee. How would you proceed with treatment?",
          "content": "- Offer NSAID prescription (meloxicam, celecoxib, high-dose ibuprofen) as long as renal and GI history are not prohibitive for NSAID use. Consider topical diclofenac, heat, ice, meniscus offloader brace, or patellar tracking brace. Offer physical therapy referral. Offer corticosteroid injection into the right knee. Consider orthopedic surgery referral depending on clinical response to the above interventions.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient undergoes a course of physical therapy along with a corticosteroid injection into the knee with no significant improvement. He is referred to an orthopedic surgeon who plans to perform a knee arthroscopy with meniscus repair. The patient states, \u201cThanks for all your care, doctor. I also have an upcoming partial colectomy. Is it ok to go ahead with the meniscus surgery around the same time as the colectomy?\u201d\n\n"
        },
        {
          "title": "+ What is your recommendation?",
          "content": "- That is a great question. What I would like to do is personally reach out to your primary care physician as well as your colorectal surgeon and orthopedic surgeon to determine an optimal surgical plan for you. With two surgeries, we want to make sure we minimize the risks to your health while maximizing your recovery. I will also send a copy of my note today to each of these physicians, detailing my thoughts today. What other questions do you have for me today?\nThat is a great question. What I would like to do is personally reach out to your primary care physician as well as your colorectal surgeon and orthopedic surgeon to determine an optimal surgical plan for you. With two surgeries, we want to make sure we minimize the risks to your health while maximizing your recovery. I will also send a copy of my note today to each of these physicians, detailing my thoughts today. What other questions do you have for me today?\n\n- Note: If you are asked a question such as this one, it\u2019s important to \u201cdo the work yourself\u201d. Don\u2019t tell the patient to ask his primary care physician himself, or to ask the surgeon himself. Take care of the patient to maximize safety, rather than push this task onto him.\nNote: If you are asked a question such as this one, it\u2019s important to \u201cdo the work yourself\u201d. Don\u2019t tell the patient to ask his primary care physician himself, or to ask the surgeon himself. Take care of the patient to maximize safety, rather than push this task onto him.\n\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "During your initial discussion with the patient about his treatment options, you suggest physical therapy and a meloxicam prescription. The patient states, \u201cNo, doctor. Physical therapy doesn\u2019t work. I need something stronger for my pain. I tried one of my wife\u2019s oxycodone pills which helped a lot. Can\u2019t you just prescribe me that? I feel like I could actually live my life again if I had that instead of wasting my time with useless stretches.\u201d\n\n"
        },
        {
          "title": "+ What is your response? This is the role-playing portion of our case, so please pretend that I am the patient.",
          "content": "- A proper response should involve foremost compassion, followed by education and finding out how much the patient knows about his injury and disease process. A reasonable response may look like the following:\nA proper response should involve foremost compassion, followed by education and finding out how much the patient knows about his injury and disease process. A reasonable response may look like the following:\n\n- \u201cI\u2019m sorry that you are dealing with such a difficult issue. Knee pain can be very disabling. My goal is to do my best to reduce your pain and improve your function in your daily activities. Please tell me what you understand about your knee condition.\u201d Following the patient\u2019s response, a reasonable continuation might look something like the following: \u201cWhat we want to do is address your pain using the most conservative, safest treatments at our disposal, only involving more invasive or stronger interventions if the more conservative options are not working for you. That is why I have laid out the treatment plan that we discussed. Furthermore, taking opioid medications that are not prescribed to you is against the law, and I recommend against doing so. Finally, I\u2019m sorry that it sounds like physical therapy has not helped you in the past. The goal of physical therapy in your case is to strengthen the muscles that control the knee so that you can function better with less pain. Stretching some of the muscles around the knee can help with this process, but it is primarily strength and functional improvement that we are aiming to establish with physical therapy. Further, should the physical therapy and meloxicam not benefit you, I would be more than happy to discuss a corticosteroid injection vs. discussing your case with an orthopedic surgeon. Unfortunately, however, opioid pain medication for this condition would not be appropriate at this time, as you may find benefit from our standard treatment options without the risk for addiction. I understand that this is very disabling and painful for you, and I will be here for you every step of the way. What other questions could I help answer today?\u201d\n\u201cI\u2019m sorry that you are dealing with such a difficult issue. Knee pain can be very disabling. My goal is to do my best to reduce your pain and improve your function in your daily activities. Please tell me what you understand about your knee condition.\u201d Following the patient\u2019s response, a reasonable continuation might look something like the following: \u201cWhat we want to do is address your pain using the most conservative, safest treatments at our disposal, only involving more invasive or stronger interventions if the more conservative options are not working for you. That is why I have laid out the treatment plan that we discussed. Furthermore, taking opioid medications that are not prescribed to you is against the law, and I recommend against doing so. Finally, I\u2019m sorry that it sounds like physical therapy has not helped you in the past. The goal of physical therapy in your case is to strengthen the muscles that control the knee so that you can function better with less pain. Stretching some of the muscles around the knee can help with this process, but it is primarily strength and functional improvement that we are aiming to establish with physical therapy. Further, should the physical therapy and meloxicam not benefit you, I would be more than happy to discuss a corticosteroid injection vs. discussing your case with an orthopedic surgeon. Unfortunately, however, opioid pain medication for this condition would not be appropriate at this time, as you may find benefit from our standard treatment options without the risk for addiction. I understand that this is very disabling and painful for you, and I will be here for you every step of the way. What other questions could I help answer today?\u201d\n\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "shortnessofbreath",
      "title": "Shortness of Breath",
      "url": "https://www.pmrrecap.com/shortnessofbreath",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 24 year-old female with history of spinal cord injury complains of shortness of breath and headache. You are the on-call physician on the inpatient rehabilitation unit.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What is the context of the shortness of breath and headache? Acute? Chronic? What was the patient doing when these symptoms arose?\n- Is there associated cough, other pains, fever, chills, vision or hearing changes, nausea, vomiting, sensation changes, rash?\n- Is the patient requiring oxygen?\n- Has this ever happened before?\n- What is the complete etiology and history of the SCI? What is the most recent ASIA test result?\n- Functional history and current functional status, including equipment usage?\n- Past Medical and Surgical History?\n- Medications?\n- Allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- What are the vital signs?\n- Cardiopulmonary exam\n- Integumentary exam\n- Brief neurological and musculoskeletal exam\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 24 year-old female with a history of T4 ASIA B injury after a 15 foot fall off scaffolding approximately 1 month ago. She presents with acute onset shortness of breath and a \u201cpounding\u201d headache. She feels anxious. This has not happened before. Her heart rate is 40 beats per minute and her blood pressure is significantly elevated above her baseline. On exam she is neurologically stable and there are no skin abnormalities.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient's shortness of breath?",
          "content": "- Autonomic dysreflexia, myocardial infarction, angina, pulmonary embolism, pain response, cardiac dysrhythmia, urinary tract infection, sepsis, pneumonia, fatigue, cardiac overload, anemia, anxiety, thyroid disease, subarachnoid hemorrhage.\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- I am concerned most immediately with autonomic dysreflexia. Thus, I would proceed as follows:\n- Stat vital signs check if not already performed. Recheck 5 minutes after the most recent check.\n- Sit the patient up, loosen clothing, straight catheterize the bladder, empty bowels.\n- If not improving vital signs and symptoms with these acute measures, apply topical nitroglycerin ointment to the chest. If blood pressure does not sufficiently decrease, give nifedipine chew, and consider adding clonidine or captopril. If blood pressure is still not improving, would order a rapid response, as her symptoms are very consistent with autonomic dysreflexia, which can cause stroke, seizure, subarachnoid hemorrhage, myocardial infarction, and/or death. She will require IV blood pressure medication at that point.\n"
        },
        {
          "title": "DOMAIN C: PATIENT MANAGEMENT",
          "content": "The patient improves after being sat up and emptying her bladder, which contained 900 milliliters of urine.\n\n"
        },
        {
          "title": "+ How would you manage the patient at this point?",
          "content": "- I would educate the patient on the diagnosis of autonomic dysreflexia, what it entails, why it is serious and important to prevent and/or treat, and what the patient can do now and in the future to prevent its occurrence or treat it if it does occur. I would specifically educate her on avoiding common triggers such as tight clothing, overfull bladder or bowels, skin breakdown, and poor toenail care. In her case I would specifically spend time discussing her bladder output of 900cc of urine, which was likely her trigger for this episode of autonomic dysreflexia. I would educate on proper catheterization volumes and a bladder emptying schedule to maintain good bladder health and prevent further autonomic dysreflexia.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "You notice during your month of call on this inpatient rehabilitation unit that you receive a larger-than-expected number of phone calls per night for suspected autonomic dysreflexia.\n\n"
        },
        {
          "title": "+ How would you address or attempt to correct this issue?",
          "content": "- I would take the time to educate the nursing staff about the diagnosis, causes, sequelae/complications, and treatment for autonomic dysreflexia, including how to properly identify it (AD commonly presents with elevated blood pressure 20 mmHg or greater above baseline, sweating, bradycardia, and headache), and how to reflexively treat it (sit the patient up, loosen clothing, empty bladder, check skin, empty bowel, call doctor). With improved education and training, call volume should reduce for cases of inappropriately suspected autonomic dysreflexia. I would ensure that all questions asked by nursing staff are answered satisfactorily. I would emphasize that if there is any hesitation whatsoever on whether or not AD is taking place, please call the on-call physician stat for guidance.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "During your next overnight call, you are called by a nurse taking care of one of your patients with spinal cord injury. Pretend I am the patient\u2019s nurse.\n\n\u201cDoctor, you need to get here now. The patient is having autonomic dysreflexia and it won\u2019t stop. I applied Nitropaste and he is still having a headache and high blood pressure.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I would ask for a stat set of vital signs, if not already taken; if available, I would ask what the full set of vital signs is. I would ask for the patient\u2019s full set of symptoms, including specifically headache, sweating, chest pain, and shortness of breath. I would ask if any immediate action has been taken to treat the suspected AD except for applying nitropaste.\n"
        },
        {
          "title": "+ The nurse responds:",
          "content": "- \u201cWe emptied his bladder and only 200cc of urine came out. The nitropaste isn\u2019t helping. You need to get here now because your directions are not working.\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- It sounds like you are rightfully concerned about this patient. Thank you for bringing him to my attention; please tell me more about what you\u2019ve already tried.\n- Nurse: \"That's it.\"\n"
        },
        {
          "title": "+ Your response?",
          "content": "- Ok, then we need to take further action together. Please sit the patient up, loosen his clothing, check his skin for signs of breakdown, and if not improving, evacuate his bowels.\n- Nurse: \u201cHis clothing looks loose enough, but we will sit him up. There was no report of any wounds from the day shift nurse. I will call and see if there is anyone available for bowel emptying.\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- Please take care of checking his skin directly for breakdown, loosen his clothing directly, sit the patient up, and then empty his bowels, as full bowel may cause autonomic dysreflexia and this needs to be addressed for his safety. There is no time to call for anyone else and you must take immediate action to address all of these steps, with the final step being bowel emptying.\n- Nurse: \u201cWell I can tell you that\u2019s definitely not within my job duties, so he will have to wait while I call for an aide.\u201d\n"
        },
        {
          "title": "+ Your response?",
          "content": "- This patient\u2019s clinical status is an emergency right now. We need to act immediately. The patient is not safe while we delay care. Is there another nurse in your immediate vicinity whom I could speak to right now? If not, I will call for a rapid response and will direct the rapid response team via telephone.\n- Note: You may occasionally encounter individuals who are reluctant to perform unsavory tasks. It is your job to maintain patient safety above personal ego at all times. You must remain firm and professional in the name of patient safety, and do not accept \u201cno\u201d when directing treatment. In reality, during daytime hours it would be appropriate to approach this nurse in person and discuss what happened overnight. If the nurse is still disagreeable, it would be appropriate to bring up this nurse\u2019s refusal to provide care with the nurse manager in the name of patient safety.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "tachycardia",
      "title": "Tachycardia",
      "url": "https://www.pmrrecap.com/tachycardia",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 40 year-old female with a recent history of traumatic spinal cord injury develops an elevated heart rate.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How elevated is the heart rate, and what is the patient\u2019s baseline heart rate?\n- What is the complete history and hospital course of this patient\u2019s SCI?\n- Were there any other injuries sustained during their SCI?\n- What is the documented ASIA status in this patient?\n- Are there any other vital sign changes?\n- Has there been any trauma?\n- What was the patient doing when the tachycardia was noticed?\n- What have the patient\u2019s most recent lab values been? Specifically hemoglobin, platelets, white blood cell count, electrolytes, creatinine, BUN.\n- Is the patient experiencing any other symptoms, such as dyspnea, pain, vision or hearing changes, mental status changes, skin changes, bowel or bladder changes, bleeding, fever, chills, nausea, vomiting?\n- Functional history and current functional status, including equipment usage?\n- Past Medical and Surgical History?\n- Medications?\n- Allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs. Specifically trending vital signs over the past several days.\n- Inspection\n- Cardiopulmonary exam\n- Integumentary exam\n- Brief neurological and musculoskeletal exam\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- Why perform an integumentary and musculoskeletal exam?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- The integumentary exam will indicate if there is any skin breakdown, rashes, or cyanosis. The musculoskeletal exam serves to identify any edema, deformities/fractures, or sources of pain.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 40 year-old female who was ejected out of a windshield in a motor vehicle accident 7 days ago. She sustained a C7 ASIA A injury and a subdural hematoma in the process. She subsequently underwent cervical spinal decompression and fusion, and the subdural hematoma was managed nonoperatively by the neurosurgery team. Her baseline heart rate is 90 bpm, but for the past 24 hours she has maintained a heart rate of 130 bpm. Her blood pressure, temperature, oxygen saturation, and respiratory rate are normal and unchanged. She denies pain. Her nurse performs straight catheterization every 4 hours. On examination, there is no rash, skin breakdown, edema, or deformities. Brief exam demonstrates stable neurologic status.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for the patient\u2019s elevated heart rate?",
          "content": "- Pulmonary embolism, pain, sepsis, physiologic, urinary tract infection, pressure injury, autonomic dysreflexia, pneumonia, cardiac dysrhythmia, intracranial bleeding.\n"
        },
        {
          "title": "+ How would you proceed with this patient?",
          "content": "- An acutely and prolonged elevated heart rate requires further investigation; thus, I would proceed with a diagnostic workup for this problem. I would start with an EKG, CBC with differential, BMP, urinalysis, and D-dimer. I would consider a head CT, chest x-ray, or thyroid studies depending on these results.\n"
        },
        {
          "title": "+ The results of your decision are as follows:",
          "content": "- EKG: sinus tachycardia\n- CBC: hemoglobin 12.4, white blood cell count 5.6, platelets 224,000\n- BMP: within normal limits\n- Urinalysis: 3 WBCs/hpf\n- D-dimer: 600 ng/ml (elevated)\n"
        },
        {
          "title": "+ The patient develops shortness of breath and her blood pressure drops to 90/60 mmHg. What would be your next steps?",
          "content": "- The patient is hemodynamically unstable. I am concerned about pulmonary embolism, but the first priority is to stabilize the patient. I would start supportive care intravenous fluids and supplemental oxygen with continuous oxygen saturation monitoring and regular vital sign checks. I would consider starting vasopressors. I would call a rapid response as well at this point, given the patient\u2019s hemodynamic instability.\n"
        },
        {
          "title": "+ Your actions result in the patient achieving hemodynamic stability. How would you now proceed?",
          "content": "- I would obtain a stat chest CT with pulmonary angiogram.\n"
        },
        {
          "title": "+ Your next steps result in the following:",
          "content": "- The chest CT returns positive for pulmonary embolism. The patient is hemodynamically stable.\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- I would like to initiate anticoagulation with heparin, but this patient\u2019s concurrent subdural hematoma is likely at least a relative contraindication to anticoagulation. I would initiate a stat transfer to internal medicine or the ICU, with recommendations to obtain a stat head CT and place a stat consult to neurosurgery for their input regarding anticoagulation in the setting of a subdural hematoma.\n"
        },
        {
          "title": "+ Your actions result in the following:",
          "content": "- The patient is ultimately anticoagulated and presents to your inpatient rehabilitation unit 3 weeks later for ongoing functional recovery. Your screening doppler scans of the lower extremities reveal a large deep vein thrombosis (DVT) in the right lower extremity. The patient remains on anticoagulation.\n"
        },
        {
          "title": "+ How would you proceed?",
          "content": "- I would consult interventional radiology to consider placing an inferior vena cava filter (IVC filter). I want to avoid another pulmonary embolism. I would also discuss this option and its rationale with the patient to identify what her wishes would be. In addition, I would consult hematology for a hypercoagulability workup, as this patient manifests essentially an unprovoked DVT at this point in the setting of active anticoagulation.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "This is the role-playing portion of this case. You are making rounds on the inpatient rehabilitation unit when you encounter this patient in her room. Pretend that I am the patient.\n\n"
        },
        {
          "title": "+ \u201cDoctor, am I ever going to walk again?\u201d",
          "content": "- This is a great question, and I am glad you are invested in your recovery. Your neurologic testing (ASIA exam) shows what is called a C7 ASIA A injury. I am happy to discuss the details of that testing and what everything means for you in more understandable terms. Your injury occurred in the spinal cord in your neck, which means your body below that level will have difficulty performing its usual functions, like moving your legs, feeling your skin, and controlling your bowel and bladder. While no one can predict the future, unfortunately your type and level of injury do not typically lead to the ability to walk independently, though you may see some neurologic and functional recovery in some capacity. I want to reassure you that we will repeat your neurologic testing (ASIA exam) prior to your discharge from this facility, and we will plan to repeat the testing on an annual basis to monitor your neurologic recovery. We can always hope for more recovery beyond what is expected based on your test results. In the meantime, let\u2019s hope for the best, but prepare you for the skills to take care of yourself with the highest level of independence that you can, so that, should you need those skills, you will have them. I want you to be as independent as possible, which is what your rehabilitation stay will facilitate, and which will likely include the goal of being independent at a wheelchair level. We will support you in every way that we can as you rehabilitate. Are there other questions you have for me, or is there perhaps anything else I can help to explain or clarify?\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "urinaryincontinence",
      "title": "Urinary Incontinence",
      "url": "https://www.pmrrecap.com/urinaryincontinence",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 23 year-old female with a history of spina bifida presents with new urinary incontinence.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- What level and subtype of spina bifida does the patient have? How has it been treated in the past? Is there a ventriculoperitoneal shunt and history of hydrocephalus?\n- What was the patient\u2019s birth history and neonatal course?\n- How long has this been going on?\n- Has this ever happened before?\n- Describe the urinary incontinence episodes and how they occur. Does the patient have the sensation of bladder fullness typically? How about now?\n- Does the patient have a spastic (upper motor neuron) or flaccid (lower motor neuron) bladder?\n- What is the patient\u2019s usual urinary continence regimen? Does she self-catheterize? What are her typical urine volumes? How often does she catheterize per day?\n- Are there any other symptomatic changes, including bowel function, strength, sensation, headaches, nausea, muscle tone, vomiting, pain, posture, vision/hearing, cognition, memory?\n- Any functional changes? What is the patient\u2019s baseline and current functional status?\n- Has she sustained any falls?\n- What equipment does the patient require? How is the condition of this equipment?\n- How was/is school? What grades did the patient receive? Is she studying in postsecondary education, or has she in the past?\n- What is the patient\u2019s social history and work status? Does she live with anyone else?\n- Full past medical and surgical history?\n- Medications?\n- Allergies?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Cranial nerve testing\n- Orientation questions\n- Observation\n- Range of motion, muscle tone analysis\n- Manual muscle testing, sensation, reflexes of bilateral upper and lower limbs\n- Gait, if applicable\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient is a 23 year-old female with L1-L2 myelomeningocele treated by neurosurgery at birth and status post ventriculoperitoneal shunt (VPS) placement for hydrocephalus. At baseline she self-catheterizes her bladder when she senses bladder fullness, and typically empties her bladder of about 400 ml of urine. Currently when she senses bladder fullness she empties 900 ml of urine out of her bladder. She uses a manual wheelchair for mobility. She lives with her boyfriend in single-level house. She has also felt increasingly fatigued and has made an optometrist appointment for some blurry vision she is having.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for her changes as described?",
          "content": "- VP shunt malfunction, hydrocephalus, Chiari malformation, tethered cord, cervical myelopathy, stroke, cervical/thoracolumbar spinal stenosis, cauda equina syndrome, syringomyelia, urinary tract infection.\n"
        },
        {
          "title": "I would order the following tests:",
          "content": "- CT scan of brain, cervical spine, thoracic spine, lumbar spine\n- Urinalysis +/- urine culture\n- CBC (complete blood count)\n- CMP (complete metabolic profile)\n"
        },
        {
          "title": "+ Your workup reveals the following:",
          "content": "- Imaging of brain/spine: ventriculomegaly, increased from prior scans\n- Urinalysis: yellow color, clear turbidity, negative leukocyte esterase, 2 white blood cells per high powered field\n- CBC/CMP: normal\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would arrange for the patient to proceed to the emergency department immediately. I would call the ED and discuss her case with the ED physician and advise a stat neurosurgery consult, as the patient likely has hydrocephalus as a result of VP shunt malfunction. I would counsel and educate the patient on the rationale for these steps, the diagnosis, and the likely need for surgical intervention.\n"
        },
        {
          "title": "+ If the patient were to strongly oppose receiving a CT scan due to the exposure to ionizing radiation, how would you proceed?",
          "content": "- First I would counsel the patient on the risks and benefits of obtaining a CT scan against the risk of disease progression, continued and permanent functional loss, and death with delay of care. Second, the patient has an existing VP shunt in place. I would need to quickly confirm whether or not her VP shunt is MRI-compatible by asking if she carries any information with her regarding her specific device brand, name, and model. She may also have a company representative that I can call to see if they are available for quick answer. After calling for assistance in transporting the patient promptly to the emergency department, I would attempt to quickly search for a product information page on the company website to determine whether or not her model is MRI-compatible. If I could find no immediate answer, I would counsel the patient that the CT scan is in her best immediate interest despite the exposure to ionizing radiation.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient returns to your clinic following VP shunt revision. She is doing well functionally. You notice some bruising of various ages on her bilateral forearms over her ulnae and rib cage. She denies falls or trauma. This is the role-playing portion of our encounter. I will act as the patient.\n\nPatient: \u201cI am doing pretty well, hanging in there. You saved me, so I\u2019m very thankful for your care.\u201d\n\n"
        },
        {
          "title": "+ What is your response?",
          "content": "- I am so glad to see you doing better! You had a serious situation going on at the time, so I am just glad we were able to get you help quickly. I know you mentioned you have not had any accidents lately, but I am concerned about the bruising I see on you. I want to make sure you and all my patients are safe. Do you feel safe at home and at work?\n"
        },
        {
          "title": "+ The patient responds:",
          "content": "- Actually, I\u2019ve kind of been dealing with some issues with my boyfriend. He\u2019s thrown a couple of dishes at me. It\u2019s ok, though, he doesn\u2019t mean to hurt me, it\u2019s just \u201ccouples\u201d stuff that happens in any relationship.\n"
        },
        {
          "title": "+ Your response?",
          "content": "- I am so sorry to hear about your issues with your boyfriend. That can be incredibly difficult for anyone. However, I am concerned about your health and safety. It is not normal to be hit or struck in any healthy relationship. We need to ensure your safety. Please allow me to provide you with resources to achieve this end, including arranging for a safe space for you to live (whether that\u2019s your current home or another location), and proper involvement of the authorities regarding your boyfriend. I will get in touch with a social worker and help to provide you with social services to achieve these goals. Please allow me to work on this for you. In the meantime, you are safe and free to remain here. I am more than happy to discuss my thoughts further with you. I know that this is incredibly difficult, and that what you have been enduring is likewise incredibly difficult. I am here for you. What questions or thoughts do you have for me at this moment?\n- Note: The goal is to separate the patient from her abuser while providing social services for her and involving the appropriate authorities in this case.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "weaknessinachild",
      "title": "Weakness in a Child",
      "url": "https://www.pmrrecap.com/weaknessinachild",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 5 year-old boy presents with his mother for weakness and impaired gait.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- Is there pain, numbness, or tingling?\n- How long has this occurred for?\n- How did this begin?\n- Has there been injury or trauma?\n- Please describe the weakness and impaired gait in more detail.\n- Has the child fallen?\n- Any rashes, bowel or bladder deficits, vision or hearing changes, shortness of breath, fever/chills, cognitive changes?\n- What is the child\u2019s functional history, including usage of any assistive devices?\n- Has he been meeting his motor, cognitive, social, language milestones?\n- Prenatal history, method of delivery, hospital course as a newborn?\n- Past medical/surgical history?\n- Family history?\n- Any siblings? How is their health if so?\n- School/kindergarten performance?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Observation of play, interaction with mother\n- Inspection (atrophy, skin, symmetry)\n- Cranial nerve examination\n- Gait analysis\n- Manual muscle testing, sensory testing, reflex testing if able\n- Rise from the floor\n- Language/speech evaluation\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are you looking for in analyzing the patient's gait?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- In this patient, a variety of causes could be contributing to weakness. The type of gait he manifests may provide clues towards his diagnosis, if any.\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "The patient has had an uneventful history until approximately 1 year ago when his mother noticed him gradually and progressively start to lose his balance when walking. She noticed he often has difficulty rising from the floor without help. He does not complain of any numbness or bowel or bladder deficits. On examination, his calf muscles appear large in proportion to the rest of his body. Using his arms, he pushes on his legs and \u201cwalks\u201d up them to rise to a standing position.\n\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What is the name of the observation that this patient uses his arms to walk up his legs and rise to a standing position?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- This is known as the Gower sign. It indicates proximal lower extremity weakness.\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Duchenne muscular dystrophy, limb-girdle muscular dystrophy, spinal muscular atrophy (SMA) type 2/3, Becker muscular dystrophy, cerebral palsy, Emery-Dreifuss muscular dystrophy, Friedreich ataxia, spina bifida, intracranial neoplasm, spinal cord neoplasm, cervical myelopathy, lumbosacral radiculopathy, lumbosacral plexopathy, facioscapulohumeral (FSH) dystrophy. His gait is hyperlordotic, Trendelenburg, with toe-walking noted.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- I would start with a discussion on my concerns regarding the patient\u2019s abnormal gait, calf hypertrophy/pseudohypertrophy, and Gower sign. I would recommend genetic testing at this point with suspicion for Duchenne Muscular Dystrophy (DMD). I would also check a serum Creatinine Kinase (CK).\n"
        },
        {
          "title": "+ Genetic testing confirms an xp21 mutation leading to extremely minimal dystrophin protein produced. CK is markedly elevated. How would you continue to manage this patient?",
          "content": "- I would offer counseling and support group services for the patient and mother/family, as this diagnosis can be devastating. I would recommend physical and occupational therapy, specifically noting the restriction of submaximal exercise. I would recommend speech/language therapy evaluation, as cognitive deficits often accompany this diagnosis. I would advise a referral to a neuromuscular specialist in neurology. I would place a referral to a cardiologist for a baseline EKG and echocardiogram, as cardiomyopathy is common. I would refer the patient to a pulmonologist for respiratory function surveillance. I would potentially prescribe lower extremity bracing in the form of ankle-foot orthoses (AFOs) or knee-ankle-foot orthoses (KAFOs) to improve balance and gait independence. I would recommend routine followup visits to monitor the child\u2019s function over time. In time, a manual wheelchair, and ultimately a power wheelchair will likely be needed. Ultimately I would inform the patient\u2019s pediatrician of my findings and my plan. All physicians involved in this patient\u2019s care would receive a copy of my clinical note from today\u2019s office visit. I would ask the mother and patient if there are any other questions today, and I would be more than happy to discuss in detail.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "The patient (with his mother) returns to your office 6 months later. He has been working with his neurologist, pulmonologist, and therapists and has an improved gait and functional independence with AFOs. He has not seen the cardiologist. You note otherwise no new problems and plan to followup with the patient in another 6 months, or sooner as needed.\n\n"
        },
        {
          "title": "+ What is your next step?",
          "content": "- I would ask if he has been contacted by the cardiologist\u2019s office yet. If so, I would inquire about his appointment - potentially it has been pushed off for other reasons that the mother can explain. If not, I would inform the patient and mother that I will place another referral, and I will personally call the cardiologist\u2019s office to ensure that this appointment will be made and confirm that the referral has been received. I would apologize for the lack of appointment. I would provide the mother with the cardiologist\u2019s office phone number. I would ask if there are any questions remaining that I can help answer today, and I would ensure that all questions are answered.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "Before you can end the encounter, the patient states, \u201cMy friend\u2019s brother said I\u2019m gonna die.\u201d\n\n"
        },
        {
          "title": "+ What is your response? Pretend I am the patient. This is the role-playing portion of this case.",
          "content": "- You are dealing with a problem that is very hard, and that most other children do not have to worry about. I am so sorry for this, but I will tell you that I will be by your side every step of the way, and that you can always ask your mother to call me if you ever have any questions or think there is something I can help you with. Also, please keep working with your therapists, and this will help make sure you can keep doing the things you like to do. Do you have any questions for me today?\nYou are dealing with a problem that is very hard, and that most other children do not have to worry about. I am so sorry for this, but I will tell you that I will be by your side every step of the way, and that you can always ask your mother to call me if you ever have any questions or think there is something I can help you with. Also, please keep working with your therapists, and this will help make sure you can keep doing the things you like to do. Do you have any questions for me today?\n\n- Note: if you have not already discussed the likelihood of early death by teenage years or the patient\u2019s twenties, now is not the time to broach that subject, especially as the child is only 5 years old. It is best to discuss this first with the mother with the patient not present, to learn first what she has told her son about his prognosis. Maintaining a harmonious relationship and trust with the patient\u2019s family should remain a priority.\nNote: if you have not already discussed the likelihood of early death by teenage years or the patient\u2019s twenties, now is not the time to broach that subject, especially as the child is only 5 years old. It is best to discuss this first with the mother with the patient not present, to learn first what she has told her son about his prognosis. Maintaining a harmonious relationship and trust with the patient\u2019s family should remain a priority.\n\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    },
    {
      "id": "wristdrop",
      "title": "Wrist Drop",
      "url": "https://www.pmrrecap.com/wristdrop",
      "sections": [
        {
          "title": "Chief Complaint",
          "content": "A 39 year-old male presents with right wrist drop.\n"
        },
        {
          "title": "Relevant History:",
          "content": "- How did this start? Context? Onset? Was there trauma/injury?\n- Unilateral or bilateral?\n- Any other motor or sensory deficits?\n- Any neck pain, bowel or bladder dysfunction?\n- Is there pain?\n- Is there a history of diabetes or alcohol consumption?\n- Is the patient right hand dominant or left hand dominant?\n- What is the patient\u2019s work status?\n- Has the patient sought care or workup for this problem before seeing me?\n- Functional history and current functional status, including equipment usage?\n- Social history?\n- Family history?\n- Past Medical and Surgical History?\n- Medications?\n"
        },
        {
          "title": "Relevant Physical Examination:",
          "content": "- Vital signs\n- Inspection\n- Palpation\n- Gait analysis\n- Range of motion of neck, shoulder, elbow, wrist, fingers\n- Manual muscle testing, sensation, reflex examination of bilateral upper limbs\n- Special testing: Spurling, Tinel at elbow and wrist\n"
        },
        {
          "title": "DOMAIN B: PROBLEM SOLVING",
          "content": "This patient is a 39 year-old right-handed male who suffers from a right wrist drop that began shortly after he tripped on a dog toy and fell onto his right shoulder 1 month ago; he has not sought care for this problem before this appointment. He works a desk job answering phone calls. He complains of constant aching pain with numbness and tingling in the right dorsal forearm and thumb. Ibuprofen has not helped the pain. On physical examination he has intact strength, sensation, and reflexes, except for 1/5 right wrist extension and impaired sensation to light touch over the dorsal right forearm and thumb.\n\n"
        },
        {
          "title": "+ What is your differential diagnosis for this patient?",
          "content": "- Brachial plexopathy, cervical radiculopathy, radial neuropathy, vitamin B12 deficiency, alcoholic neuropathy, diabetic polyneuropathy, peripheral polyneuropathy, shoulder/humerus/elbow fracture, cervical myelopathy, stroke, lead toxicity, wrist extensor tendon rupture.\n"
        },
        {
          "title": "+ What workup would you order to help narrow your differential diagnosis?",
          "content": "- EMG/NCS right upper extremity\n- Labs: CMP, CBC, B12, Hemoglobin A1C\n- X-ray of right shoulder, humerus, elbow\n- Diagnostic ultrasound scan of the right radial nerve\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What are the electrodiagnostic differences and implications of neurapraxia vs. axonotmesis vs. neurotmesis?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- These are three different Seddon nerve injury classifications.\n- Neurapraxia is defined as a conduction block. This is the failure of an action potential to travel beyond a particular location along a nerve while the ability to conduct impulses beyond that spot is normal. This is revealed on nerve conduction studies as loss of amplitude of a CMAP (compound motor action potential) when stimulating proximal to the point of conduction block, and normal amplitude distal to that location. A spot of focal demyelination (conduction block) should resolve within a few weeks and thus carries a good functional prognosis, improving the patient\u2019s strength and nerve conduction study findings (CMAP repair).\n- Axonotmesis is defined as axon loss due to crush or stretch injury to a nerve, leaving the epineurium intact but axons destroyed within a nerve (low-amplitude CMAP). Axonotmesis carries a more severe functional prognosis than neurapraxia, as destroyed axons need to regenerate down the nerve path toward their distal muscle fiber targets in order to reinnervate them \u201cfrom scratch\u201d. This is more difficult and less certain for the body to accomplish. Regeneration typically occurs with axons growing approximately 1 inch per month, so this is a much slower functional recovery, and recovery may only be partial. The CMAP can be electrodiagnostically \u201crepaired\u201d with enough time.\n- Neurotmesis is defined as complete nerve transection/severing through the epineurium, and carries the worst functional prognosis of these three nerve injuries. Complete weakness and absent CMAPs of the affected nerve in muscles distal to the site of injury are typically observed. Functional prognosis is very poor, as there is essentially no nerve path for the damaged axons to regrow along to find their distal targets again.\n"
        },
        {
          "title": "+ Radiology, EMG/NCS, and laboratory workup reveals the following:",
          "content": "- CMP: normal\n- CBC: normal\n- Vitamin B12: normal\n- A1C: 5.8%\n- EMG/NCS: Absent SNAP (sensory nerve action potential) to right thumb snuffbox, diminished CMAP to the extensor indicis proprius. Fibrillations and positive sharp waves in the right extensor indicis proprius, extensor digitorum, brachioradialis, supinator. Normal EMG of right triceps, deltoid, pronator teres, abductor pollicis longus, and cervical paraspinals.\n- X-rays reveal no acute or subacute bony injury to the right shoulder, humerus, or elbow.\n- Diagnostic ultrasound scan of the right radial nerve reveals enlargement and hypoechogenicity of the radial nerve at the spiral groove of the humerus without irregularities of the humeral cortex.\n"
        },
        {
          "title": "+ How would you manage this patient?",
          "content": "- Occupational therapy with bracing to start.\n"
        },
        {
          "title": "+ Challenge Question",
          "content": "- What type of bracing and wearing schedule do you recommend?\n"
        },
        {
          "title": "+ Challenge Answer",
          "content": "- Wrist cock-up splint to improve wrist extension and enable tenodesis effect for grip. Wear during daytime \u201coperational\u201d hours for functional assistance during manual tasks. May remove during sleep. Generally avoid wearing for longer than several hours at a time, and always check skin for rash or breakdown.\n"
        },
        {
          "title": "+ Is there anything else you would do for this patient?",
          "content": "- Repeat EMG/NCS in 3 months to monitor clinical and electrodiagnostic recovery.\n- Gabapentin for neuropathic pain, uptitrate as tolerated, caution against sedation.\n"
        },
        {
          "title": "+ Anything else?",
          "content": "- Not at this time, thank you.\n"
        },
        {
          "title": "DOMAIN D: SYSTEMS-BASED PRACTICE",
          "content": "Patient reports he is not improving in terms of wrist extension function. He has attended occupational therapy diligently with home exercise program and bracing daily. His pain is improved with gabapentin.\n\nRepeat EMG/NCS shows fibrillations and positive sharp waves with reduced CMAP in a similar study to the initial EMG/NCS. There is markedly decreased recruitment of the extensor indicis proprius, brachioradialis, extensor digitorum, and supinator.\n\n"
        },
        {
          "title": "+ How would you advise the patient to proceed?",
          "content": "- I would continue monitoring for another 3 months, given that his injury was only 4 months ago at this point and has not stabilized neurologically. Continue OT/home exercise program and medications as directed.\nThe patient returns to your clinic 6 months later. On examination he has 1/5 right wrist extension strength.\n\n"
        },
        {
          "title": "+ How would you manage the patient at this point in time?",
          "content": "- I would recommend orthopedic surgery consult for consideration of tendon transfer surgery. I would discuss with the patient the rationale for this procedure and goals. I would answer all questions to the best of my ability and ask if the patient is agreeable to this plan.\n"
        },
        {
          "title": "+ Explain the purpose and principles of tendon transfer surgery in this patient's case.",
          "content": "- The purpose of a tendon transfer is to utilize intact neuromuscular structures to perform the functions of weak muscles. In other words, one can transfer the tendon from a strong muscle with intact, healthy innervation to the tendon attachment site of a muscle which has been denervated. For example in this case, one might consider transferring the flexor carpi radialis tendon over to the dorsal aspect of the wrist in order to convert the muscle into a wrist extensor, as this patient lacks radial nerve-innervated active wrist extension. This procedure is performed by an orthopedic surgeon. Typically 1 grade of strength is lost in the donor tendon following transfer surgery. For example, a 5/5 grade flexor carpi radialis muscle/tendon may only maintain 4/5 strength after it is transferred over to become a wrist extensor. Tendon transfer surgery is generally considered for functional improvement in cases that have stabilized neurologically and electrodiagnostically.\n"
        },
        {
          "title": "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS",
          "content": "The patient undergoes successful tendon transfer surgery and regains active wrist extension. He has minimal pain. He sees you in 6 month follow up. Pretend that I am the patient.\n\n"
        },
        {
          "title": "+ \u201cDoctor, I still can\u2019t work and need to stay on disability. I need you to fill out my disability paperwork.\u201d",
          "content": "- I am so glad to hear your surgery went well, you have regained wrist function, and that you are having minimal pain. If you are still feeling disabled then we need to discuss this further and possibly investigate further. Could you please explain why you can no longer work your previous job?\n"
        },
        {
          "title": "+ It just doesn\u2019t feel right anymore. Like it\u2019s not how it used to feel when I moved my wrist around.\u201d",
          "content": "- I am so sorry to hear that. Thank you for sharing that with me. If you could please explain further, I am ready to listen. Are you experiencing numbness or tingling? Any new symptoms since we last talked? What you have described so far is common after such a surgery, and can be improved with physical and occupational therapy, a work hardening program to help get you back up to speed with work-related tasks, and even a functional capacity evaluation to see what sorts of tasks you are able to complete, and which ones give you trouble. Let\u2019s continue working together to maximize your function. I want you to know I am here and ready to listen.\nCopyright 2025 PM&R Recap LLC. All rights reserved.\n\n"
        }
      ]
    }
  ];
