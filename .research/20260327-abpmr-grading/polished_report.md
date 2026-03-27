# ABPMR Part II Grading Alignment Analysis

## How the Real Exam Works

The ABPMR Part II is a virtual oral exam: two 50-minute sessions, 4 vignettes per session (8 total), 4 different examiners. Each vignette is scored independently across **5 domains (A–E)**. Domains are scored independently — performance in one has no bearing on another.

---

## Official ABPMR Domain Criteria (from Supplemental Digital Content)

### Domain A: Data Acquisition
**Core question:** Did the candidate identify the appropriate data required to correctly diagnose and manage the patient?

Components:
- Patient history
- Physical examination components
- Functional evaluation
- Response to psychosocial aspects of illness and functional limitations

### Domain B: Problem Solving
**Core question:** Did the candidate, in an appropriately organized manner, collect data to select among reasonable alternative diagnoses while ensuring patient stabilization and anticipating future problems?

Components:
- Integration of medical knowledge with clinical data
- Prioritization of rehabilitation goals and medical issues / formulation of management plan
- Generation of a differential diagnosis
- Use of evidence-based medicine
- Application of research and statistical methods
- Use of information technology

### Domain C: Patient Management
**Core question:** Did the candidate treat or direct the appropriate treatment(s) at the appropriate times? Did the candidate efficiently arrive at an informed and appropriate management plan?

Components:
- Medication prescriptions
- Exercise and modality prescriptions
- Durable medical equipment prescriptions
- Therapeutic and diagnostic injections
- Use of evidence-based medicine
- Comprehensive therapeutic care plan including patient monitoring and followup
- Promotion of health and function and prevention of disease and injury
- Management of complex medical problems

### Domain D: Systems-Based Practice
**Core question:** Did the treatment plan include proper referral of the patient at an appropriate time? Did the candidate properly take risks and benefits into account?

Components:
- Knowledge of practice and delivery systems
- Evaluation of risks, benefits, limitations, and costs of available resources
- Outcomes
- Healthcare referrals
- Team management
- Resource use/justification

### Domain E: Interpersonal and Communication Skills
**Core question:** Is the candidate able to provide appropriate explanations and respond ethically and sensitively to the patient and/or family? Can the candidate communicate effectively and ethically with consultants, hospital staff, and other interested parties?

Components:
- Communication skills with patients, families, and health professionals
- Listening skills
- Demonstration of compassion, sensitivity, and respect
- Sensitivity to diversity issues
- Ethics/professionalism

---

## Current App Architecture vs. ABPMR Domains

### What Maps Well

| ABPMR Domain | App Implementation | Alignment |
|---|---|---|
| **Domain B** (Problem Solving) | Case sections titled "DOMAIN B: PROBLEM SOLVING" with differential diagnosis questions, diagnostic workup, challenge Q&A | **STRONG** — directly maps to differential diagnosis generation, medical knowledge integration |
| **Domain C** (Patient Management) | Case sections titled "DOMAIN C: PATIENT MANAGEMENT" with treatment/management questions | **STRONG** — covers medication, exercise, DME, injections |
| **Domain D** (Systems-Based Practice) | Case sections titled "DOMAIN D: SYSTEMS-BASED PRACTICE" with referral/insurance/system scenarios | **STRONG** — covers delivery systems, costs, referrals, team management |
| **Domain E** (Interpersonal/Communication) | Case sections titled "DOMAIN E: INTERPERSONAL AND COMMUNICATION SKILLS" with role-play scenarios | **STRONG** — covers communication, compassion, ethics, professionalism |

### What's MISSING: Domain A (Data Acquisition)

**This is the critical gap.** The real exam has 5 domains, but our app effectively only tests 4 (B through E). Here's why:

In the real exam, Domain A tests whether the candidate *asks the right questions* — what history they'd take, what physical exam maneuvers they'd perform, what functional assessments they'd order. The examiner presents a vignette and says "what would you like to know?" The candidate must *generate* the data acquisition strategy.

**In our app:** The case files *give* the history and physical exam findings as read-only text sections ("History & Systems Review:" and "Physical Examination Findings:"). The candidate reads this information passively — they don't have to ask for it. The AI examiner doesn't test whether the candidate would have thought to ask those questions.

**Impact:** Residents using our app never practice the skill of independently identifying what data to acquire. On the real exam, Domain A is scored independently and could cause a fail even if B–E are strong.

### Scoring Model Gap

The ABPMR uses a **per-domain rating** across all vignettes, not a simple percentage. Our app scores each *section* as a concept-hit percentage. The real exam scores each *domain* holistically across the entire encounter.

Our current scoring:
- Per-section: concepts_hit / (concepts_hit + concepts_missed) = percentage
- Overall: average of all section percentages
- Red flags: counted but not weighted

The real exam scoring:
- Each examiner rates each domain independently
- Two examiners per session = redundancy for reliability
- Per-domain rating (not per-section)
- Pass/fail determined by aggregate domain performance across all 8 vignettes

---

## Specific Gaps and Recommendations

### GAP 1: Domain A Not Tested (CRITICAL)
**Problem:** History and physical exam data are handed to the student, not elicited.

**Recommendation:** Add a "Data Acquisition" phase at the start of each case. Before revealing the history and exam findings, the AI examiner presents only the initial chief complaint and asks "What history would you like to obtain?" and "What would you examine?" The candidate's answers are scored against a rubric of key data points. Only after this phase are the findings revealed.

**Implementation:**
- Add new section type in case data: `dataAcquisitionRubric` containing expected history items and exam maneuvers
- Modify `_processExamSections()` to inject a Domain A phase before Domain B
- Modify the system prompt to handle the "what would you ask/examine?" interaction
- Score Domain A separately in the results

### GAP 2: Scoring Not Domain-Aligned (MAJOR)
**Problem:** Score card shows per-section percentages. Real exam scores per-domain (A–E).

**Recommendation:** Map each section to its ABPMR domain and aggregate scores by domain in the score card. The section title already contains "DOMAIN B/C/D/E" text — parse this and group accordingly.

**Implementation:**
- Add `domain` field to `ExamSection` (enum: A, B, C, D, E)
- In `_processExamSections()`, tag each section with its domain
- In score card, show domain-level scores with the official ABPMR descriptions
- Show overall assessment as domain ratings rather than a single percentage

### GAP 3: Functional Evaluation Not Explicitly Tested (MODERATE)
**Problem:** Domain A explicitly includes "functional evaluation" — FIM scores, activity limitations, participation restrictions. Our cases mention functional status in the presentation but don't test whether the candidate would assess it.

**Recommendation:** Include functional assessment questions in the Domain A data acquisition phase (e.g., "What functional outcome measures would you use?").

### GAP 4: Psychosocial Response Not Consistently Tested (MODERATE)
**Problem:** Domain A includes "response to psychosocial aspects of illness and functional limitations." Domain E tests communication, but the *identification* of psychosocial needs is a Domain A skill. Some cases test this in Domain E but not consistently.

**Recommendation:** Ensure every case's Domain A rubric includes psychosocial data acquisition items (caregiver burden, mood screening, home environment, vocational impact).

### GAP 5: Evidence-Based Medicine Not Explicitly Probed (MINOR)
**Problem:** Domains B and C both include "use of evidence-based medicine." Our probing strategy asks about reasoning but doesn't specifically probe for evidence citations (e.g., "What is the evidence level for that recommendation?").

**Recommendation:** Add an "evidence" probe type to the AI examiner's probing strategy. When a candidate recommends a treatment, occasionally probe for the evidence basis.

### GAP 6: No Domain-Level Feedback in Score Card (MINOR)
**Problem:** Score card shows section-by-section breakdown but doesn't tell the resident "Your Domain A (Data Acquisition) was weak — focus on asking the right questions."

**Recommendation:** After domain-level scoring, provide targeted domain-level feedback with the official ABPMR question for that domain.

---

## Summary: Alignment Status

| Domain | Currently Tested? | Quality | Priority Fix |
|---|---|---|---|
| A: Data Acquisition | **NO** — data given passively | Not tested | **CRITICAL** — add DA phase |
| B: Problem Solving | Yes — differential, workup, challenges | Good | Minor — add evidence probes |
| C: Patient Management | Yes — treatment, meds, DME, injections | Good | Minor — add evidence probes |
| D: Systems-Based Practice | Yes — referrals, insurance, teams | Good | No changes needed |
| E: Interpersonal/Communication | Yes — role-play scenarios | Good | No changes needed |
| **Scoring Model** | Per-section percentage | Misaligned | **MAJOR** — switch to per-domain |

---

## Sources
- [ABPMR Part II Overview](https://www.abpmr.org/Primary/PartII)
- [ABPMR Part II Scoring FAQ](https://www.abpmr.org/NewsCenter/Detail/part-ii-scoring-faq)
- [ABPMR Part II Domain A Q&A Video](https://www.abpmr.org/Research/Detail/domain-a-q-and-a)
- [Supplemental Digital Content: ABPMR Part II Examination Domains and Criteria](https://cdn-links.lww.com/permalink/phm/c/phm_00_00_2024_11_22_francisco_ajpmr-d-24-00457_sdc1.pdf) (PDF provided by user)
- [ABPMR Exam Statistics](https://www.abpmr.org/Primary/Statistics)
