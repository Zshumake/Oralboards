import '../../models/case_model.dart';
import 'stroke_mca_right_hemiplegia.dart';
import 'stroke_ich_spasticity.dart';
import 'stroke_dysphagia.dart';
import 'stroke_neglect.dart';
import 'stroke_depression_pba.dart';
import 'stroke_wallenberg.dart';
import 'stroke_shoulder_subluxation.dart';
import 'stroke_young_adult_pfo.dart';
import 'sci_t6_complete.dart';
import 'sci_neurogenic_bowel.dart';
import 'sci_heterotopic_ossification.dart';
import 'sci_pressure_injury.dart';
import 'sci_brown_sequard.dart';
import 'sci_high_cervical_vent.dart';
import 'tbi_moderate_return_work.dart';
import 'tbi_concussion_return_play.dart';
import 'tbi_pituitary_dysfunction.dart';
import 'geriatric_hip_fracture.dart';
import 'geriatric_deconditioning.dart';
import 'geriatric_tka_rehab.dart';
import 'geriatric_polypharmacy.dart';
import 'neuro_ms_relapsing.dart';
import 'neuro_parkinsons.dart';
import 'neuro_post_polio.dart';
import 'msk_frozen_shoulder.dart';
import 'msk_rotator_cuff.dart';
import 'msk_acl_rehab.dart';
import 'msk_cervical_radiculopathy.dart';
import 'msk_myofascial_pain.dart';
import 'pain_chronic_low_back.dart';
import 'pain_fibromyalgia.dart';
import 'pain_phantom_limb.dart';
import 'peds_brachial_plexus.dart';
import 'peds_tethered_cord.dart';
import 'peds_jia.dart';
import 'cardiopulm_copd_rehab.dart';
import 'cardiopulm_cardiac_rehab.dart';
import 'cardiopulm_post_covid.dart';
import 'cancer_cipn.dart';
import 'cancer_spinal_cord_compression.dart';
import 'burn_major_rehab.dart';
import 'polytrauma_blast_injury.dart';
import 'nm_myasthenia_gravis.dart';
import 'nm_cmt.dart';
import 'nm_cubital_tunnel.dart';
import 'special_wheelchair_seating.dart';
import 'special_ime.dart';
import 'special_opioid_taper.dart';
import 'special_itb_pump.dart';
import 'special_dysvascular_amputation.dart';

const List<CaseModel> allCases = [
  // Stroke (8)
  caseStrokeMcaRightHemiplegia,
  caseStrokeIchSpasticity,
  caseStrokeDysphagia,
  caseStrokeNeglect,
  caseStrokeDepressionPba,
  caseStrokeWallenberg,
  caseStrokeShoulderSubluxation,
  caseStrokeYoungAdultPfo,
  // Spinal Cord Injury (6)
  caseSciT6Complete,
  caseSciNeurogenicBowel,
  caseSciHeterotopicOssification,
  caseSciPressureInjury,
  caseSciBrownSequard,
  caseSciHighCervicalVent,
  // TBI (3)
  caseTbiModerateReturnWork,
  caseTbiConcussionReturnPlay,
  caseTbiPituitaryDysfunction,
  // Geriatric (4)
  caseGeriatricHipFracture,
  caseGeriatricDeconditioning,
  caseGeriatricTkaRehab,
  caseGeriatricPolypharmacy,
  // Neurodegenerative (3)
  caseNeuroMsRelapsing,
  caseNeuroParkinsons,
  caseNeuroPostPolio,
  // MSK/Sports (5)
  caseMskFrozenShoulder,
  caseMskRotatorCuff,
  caseMskAclRehab,
  caseMskCervicalRadiculopathy,
  caseMskMyofascialPain,
  // Pain (3)
  casePainChronicLowBack,
  casePainFibromyalgia,
  casePainPhantomLimb,
  // Pediatric (3)
  casePedsBrachialPlexus,
  casePedsTetheredCord,
  casePedsJia,
  // Cardiac/Pulmonary (3)
  caseCardiopulmCopdRehab,
  caseCardiopulmCardiacRehab,
  caseCardiopulmPostCovid,
  // Cancer (2)
  caseCancerCipn,
  caseCancerSpinalCordCompression,
  // Burn/Trauma (2)
  caseBurnMajorRehab,
  casePolytraumaBlastInjury,
  // Neuromuscular (3)
  caseNmMyastheniaGravis,
  caseNmCmt,
  caseNmCubitalTunnel,
  // Special Topics (5)
  caseSpecialWheelchairSeating,
  caseSpecialIme,
  caseSpecialOpioidTaper,
  caseSpecialItbPump,
  caseSpecialDysvascularAmputation,
];
