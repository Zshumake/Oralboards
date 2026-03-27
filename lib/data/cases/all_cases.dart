import '../../models/case_model.dart';
// Stroke (12)
import 'stroke_mca_right_hemiplegia.dart';
import 'stroke_ich_spasticity.dart';
import 'stroke_dysphagia.dart';
import 'stroke_neglect.dart';
import 'stroke_depression_pba.dart';
import 'stroke_wallenberg.dart';
import 'stroke_shoulder_subluxation.dart';
import 'stroke_young_adult_pfo.dart';
import 'stroke_bilateral.dart';
import 'stroke_thalamic_pain.dart';
import 'stroke_locked_in.dart';
import 'stroke_pediatric.dart';
// Spinal Cord Injury (12)
import 'sci_t6_complete.dart';
import 'sci_neurogenic_bowel.dart';
import 'sci_heterotopic_ossification.dart';
import 'sci_pressure_injury.dart';
import 'sci_brown_sequard.dart';
import 'sci_high_cervical_vent.dart';
import 'sci_autonomic_dysreflexia.dart';
import 'sci_central_cord.dart';
import 'sci_cauda_equina.dart';
import 'sci_pregnancy.dart';
import 'sci_domestic_violence.dart';
// TBI (7)
import 'tbi_moderate_return_work.dart';
import 'tbi_concussion_return_play.dart';
import 'tbi_pituitary_dysfunction.dart';
import 'tbi_penetrating.dart';
import 'tbi_post_traumatic_seizures.dart';
import 'tbi_substance_abuse.dart';
import 'tbi_abusive_head_trauma.dart';
// Geriatric (8)
import 'geriatric_hip_fracture.dart';
import 'geriatric_deconditioning.dart';
import 'geriatric_tka_rehab.dart';
import 'geriatric_polypharmacy.dart';
import 'geriatric_dementia_caregiver.dart';
import 'geriatric_vertebral_fracture.dart';
import 'geriatric_frailty_surgical.dart';
import 'geriatric_elder_abuse.dart';
// Neurodegenerative (6)
import 'neuro_ms_relapsing.dart';
import 'neuro_parkinsons.dart';
import 'neuro_post_polio.dart';
import 'neuro_als.dart';
import 'neuro_huntingtons.dart';
import 'neuro_progressive_ms.dart';
// MSK/Sports (9)
import 'msk_frozen_shoulder.dart';
import 'msk_rotator_cuff.dart';
import 'msk_acl_rehab.dart';
import 'msk_cervical_radiculopathy.dart';
import 'msk_myofascial_pain.dart';
import 'msk_spinal_stenosis.dart';
import 'msk_crps.dart';
import 'msk_lateral_epicondylitis.dart';
import 'msk_plantar_fasciitis.dart';
import 'msk_cervical_neurapraxia.dart';
// Pain (6)
import 'pain_chronic_low_back.dart';
import 'pain_fibromyalgia.dart';
import 'pain_phantom_limb.dart';
import 'pain_failed_back.dart';
import 'pain_cancer_palliative.dart';
import 'pain_pediatric_fnd.dart';
import 'pain_sickle_cell.dart';
// Pediatric (6)
import 'peds_brachial_plexus.dart';
import 'peds_tethered_cord.dart';
import 'peds_jia.dart';
import 'peds_cp_spasticity.dart';
import 'peds_duchenne.dart';
import 'peds_spina_bifida_transition.dart';
// Cardiac/Pulmonary (5)
import 'cardiopulm_copd_rehab.dart';
import 'cardiopulm_cardiac_rehab.dart';
import 'cardiopulm_post_covid.dart';
import 'cardiopulm_transplant.dart';
import 'cardiopulm_post_pe.dart';
// Cancer (5)
import 'cancer_cipn.dart';
import 'cancer_spinal_cord_compression.dart';
import 'cancer_head_neck.dart';
import 'cancer_lymphedema.dart';
import 'cancer_prehab_fatigue.dart';
// Burn/Trauma (4)
import 'burn_major_rehab.dart';
import 'polytrauma_blast_injury.dart';
import 'burn_facial_psychosocial.dart';
import 'burn_electrical.dart';
// Neuromuscular (6)
import 'nm_myasthenia_gravis.dart';
import 'nm_cmt.dart';
import 'nm_cubital_tunnel.dart';
import 'nm_icu_weakness.dart';
import 'nm_carpal_tunnel.dart';
import 'nm_gbs_recovery.dart';
// Special Topics (12)
import 'special_wheelchair_seating.dart';
import 'special_ime.dart';
import 'special_opioid_taper.dart';
import 'special_itb_pump.dart';
import 'special_dysvascular_amputation.dart';
import 'special_bilateral_tfa.dart';
import 'special_oud_rehab.dart';
import 'special_limb_length.dart';
import 'special_adaptive_sports.dart';
import 'special_capacity_determination.dart';
import 'special_transgender_care.dart';
import 'special_medical_error.dart';
import 'special_post_suicide_rehab.dart';

const List<CaseModel> allCases = [
  // Stroke (12)
  caseStrokeMcaRightHemiplegia,
  caseStrokeIchSpasticity,
  caseStrokeDysphagia,
  caseStrokeNeglect,
  caseStrokeDepressionPba,
  caseStrokeWallenberg,
  caseStrokeShoulderSubluxation,
  caseStrokeYoungAdultPfo,
  caseStrokeBilateral,
  caseStrokeThalamicPain,
  caseStrokeLockedIn,
  caseStrokePediatric,
  // Spinal Cord Injury (12)
  caseSciT6Complete,
  caseSciNeurogenicBowel,
  caseSciHeterotopicOssification,
  caseSciPressureInjury,
  caseSciBrownSequard,
  caseSciHighCervicalVent,
  caseSciAutonomicDysreflexia,
  caseSciCentralCord,
  caseSciCaudaEquina,
  caseSciPregnancy,
  caseSciDomesticViolence,
  // TBI (7)
  caseTbiModerateReturnWork,
  caseTbiConcussionReturnPlay,
  caseTbiPituitaryDysfunction,
  caseTbiPenetrating,
  caseTbiPostTraumaticSeizures,
  caseTbiSubstanceAbuse,
  caseTbiAbusiveHeadTrauma,
  // Geriatric (8)
  caseGeriatricHipFracture,
  caseGeriatricDeconditioning,
  caseGeriatricTkaRehab,
  caseGeriatricPolypharmacy,
  caseGeriatricDementiaCaregiver,
  caseGeriatricVertebralFracture,
  caseGeriatricFrailtySurgical,
  caseGeriatricElderAbuse,
  // Neurodegenerative (6)
  caseNeuroMsRelapsing,
  caseNeuroParkinsons,
  caseNeuroPostPolio,
  caseNeuroAls,
  caseNeuroHuntingtons,
  caseNeuroProgressiveMs,
  // MSK/Sports (9)
  caseMskFrozenShoulder,
  caseMskRotatorCuff,
  caseMskAclRehab,
  caseMskCervicalRadiculopathy,
  caseMskMyofascialPain,
  caseMskSpinalStenosis,
  caseMskCrps,
  caseMskLateralEpicondylitis,
  caseMskPlantarFasciitis,
  caseMskCervicalNeurapraxia,
  // Pain (7)
  casePainChronicLowBack,
  casePainFibromyalgia,
  casePainPhantomLimb,
  casePainFailedBack,
  casePainCancerPalliative,
  casePainPediatricFnd,
  casePainSickleCell,
  // Pediatric (6)
  casePedsBrachialPlexus,
  casePedsTetheredCord,
  casePedsJia,
  casePedsCpSpasticity,
  casePedsDuchenne,
  casePedsSpinaBifidaTransition,
  // Cardiac/Pulmonary (5)
  caseCardiopulmCopdRehab,
  caseCardiopulmCardiacRehab,
  caseCardiopulmPostCovid,
  caseCardiopulmTransplant,
  caseCardiopulmPostPe,
  // Cancer (5)
  caseCancerCipn,
  caseCancerSpinalCordCompression,
  caseCancerHeadNeck,
  caseCancerLymphedema,
  caseCancerPrehabFatigue,
  // Burn/Trauma (4)
  caseBurnMajorRehab,
  casePolytraumaBlastInjury,
  caseBurnFacialPsychosocial,
  caseBurnElectrical,
  // Neuromuscular (6)
  caseNmMyastheniaGravis,
  caseNmCmt,
  caseNmCubitalTunnel,
  nmIcuWeakness,
  nmCarpalTunnel,
  nmGbsRecovery,
  // Special Topics (12)
  caseSpecialWheelchairSeating,
  caseSpecialIme,
  caseSpecialOpioidTaper,
  caseSpecialItbPump,
  caseSpecialDysvascularAmputation,
  caseSpecialBilateralTfa,
  specialOudRehab,
  specialLimbLength,
  specialAdaptiveSports,
  specialCapacityDetermination,
  specialTransgenderCare,
  specialMedicalError,
  specialPostSuicideRehab,
];
