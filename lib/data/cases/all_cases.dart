import '../../models/case_model.dart';
import 'agitation.dart';
import 'amputee_care.dart';
import 'armswelling.dart';
import 'bilateralshoulderpain.dart';
import 'bilateralshoulderpain2.dart';
import 'burninghandpain.dart';
import 'calfdiscomfort.dart';
import 'chestpain.dart';
import 'difficultywalking.dart';
import 'disorderofconsciousness.dart';
import 'footdrop.dart';
import 'handclumsiness.dart';
import 'headache.dart';
import 'headaches.dart';
import 'leftanklepain.dart';
import 'lefthandpain.dart';
import 'leftlowerextremitypain.dart';
import 'leftshoulderpain.dart';
import 'legpain.dart';
import 'lethargy.dart';
import 'lowbackpain1.dart';
import 'lowbackpain2.dart';
import 'morningstiffness.dart';
import 'neckpain.dart';
import 'poststroke_shoulder_pain.dart';
import 'progressiveweakness.dart';
import 'rightelbowpain.dart';
import 'rightfootdrop.dart';
import 'righthandnumbness.dart';
import 'rightkneepain.dart';
import 'shortnessofbreath.dart';
import 'tachycardia.dart';
import 'toewalking.dart';
import 'urinaryincontinence.dart';
import 'weaknessinachild.dart';
import 'workaccident.dart';
import 'stroke_depression_pba.dart';
import 'stroke_dysphagia.dart';
import 'stroke_ich_spasticity.dart';
import 'stroke_mca_right_hemiplegia.dart';
import 'stroke_neglect.dart';
import 'stroke_shoulder_subluxation.dart';
import 'stroke_wallenberg.dart';
import 'stroke_young_adult_pfo.dart';
import 'sci_brown_sequard.dart';
import 'sci_heterotopic_ossification.dart';
import 'sci_high_cervical_vent.dart';
import 'sci_neurogenic_bowel.dart';
import 'sci_pressure_injury.dart';
import 'sci_t6_complete.dart';
import 'wristdrop.dart';
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
  caseAgitation,
  caseAmputeeCare,
  caseArmswelling,
  caseBilateralshoulderpain,
  caseBilateralshoulderpain2,
  caseCalfdiscomfort,
  caseDifficultywalking,
  caseDisorderofconsciousness,
  caseFootdrop,
  caseHeadache,
  caseHeadaches,
  caseLeftanklepain,
  caseLefthandpain,
  caseLeftlowerextremitypain,
  caseLeftshoulderpain,
  caseLegpain,
  caseLethargy,
  caseLowbackpain1,
  caseLowbackpain2,
  caseNeckpain,
  casePoststrokeShoulderPain,
  caseProgressiveweakness,
  caseRightelbowpain,
  caseRightfootdrop,
  caseRighthandnumbness,
  caseRightkneepain,
  caseShortnessofbreath,
  caseTachycardia,
  caseUrinaryincontinence,
  caseWeaknessinachild,
  caseWristdrop,
  caseChestpain,
  caseToewalking,
  caseHandclumsiness,
  caseBurninghandpain,
  caseMorningstiffness,
  caseWorkaccident,
  caseStrokeDepressionPba,
  caseStrokeWallenberg,
  caseStrokeShoulderSubluxation,
  caseStrokeYoungAdultPfo,
  caseStrokeMcaRightHemiplegia,
  caseStrokeIchSpasticity,
  caseStrokeDysphagia,
  caseStrokeNeglect,
  caseSciT6Complete,
  caseSciNeurogenicBowel,
  caseSciHeterotopicOssification,
  caseSciPressureInjury,
  caseSciBrownSequard,
  caseSciHighCervicalVent,
  caseTbiModerateReturnWork,
  caseTbiConcussionReturnPlay,
  caseTbiPituitaryDysfunction,
  caseGeriatricHipFracture,
  caseGeriatricDeconditioning,
  caseGeriatricTkaRehab,
  caseGeriatricPolypharmacy,
  caseNeuroMsRelapsing,
  caseNeuroParkinsons,
  caseNeuroPostPolio,
  caseMskFrozenShoulder,
  caseMskRotatorCuff,
  caseMskAclRehab,
  caseMskCervicalRadiculopathy,
  caseMskMyofascialPain,
  casePainChronicLowBack,
  casePainFibromyalgia,
  casePainPhantomLimb,
  casePedsBrachialPlexus,
  casePedsTetheredCord,
  casePedsJia,
  caseCardiopulmCopdRehab,
  caseCardiopulmCardiacRehab,
  caseCardiopulmPostCovid,
  caseCancerCipn,
  caseCancerSpinalCordCompression,
  caseBurnMajorRehab,
  casePolytraumaBlastInjury,
  caseNmMyastheniaGravis,
  caseNmCmt,
  caseNmCubitalTunnel,
  caseSpecialWheelchairSeating,
  caseSpecialIme,
  caseSpecialOpioidTaper,
  caseSpecialItbPump,
  caseSpecialDysvascularAmputation,
];
