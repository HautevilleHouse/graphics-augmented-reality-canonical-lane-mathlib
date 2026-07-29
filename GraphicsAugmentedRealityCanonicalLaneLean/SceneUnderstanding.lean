import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure SceneUnderstandingPackage where
  cameraCalibration : Prop
  featureDetection : Prop
  poseEstimation : Prop
  spatialMapping : Prop

structure SceneUnderstandingEvidence (P : SceneUnderstandingPackage) where
  cameraCalibrationClosed : P.cameraCalibration
  featureDetectionClosed : P.featureDetection
  poseEstimationClosed : P.poseEstimation
  spatialMappingClosed : P.spatialMapping

def SceneUnderstandingClosed (P : SceneUnderstandingPackage) : Prop :=
  P.cameraCalibration ∧ P.featureDetection ∧ P.poseEstimation ∧ P.spatialMapping

theorem scene_understanding_closed_from_evidence
    (P : SceneUnderstandingPackage) (E : SceneUnderstandingEvidence P) :
    SceneUnderstandingClosed P := by
  exact And.intro E.cameraCalibrationClosed
    (And.intro E.featureDetectionClosed
      (And.intro E.poseEstimationClosed E.spatialMappingClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse