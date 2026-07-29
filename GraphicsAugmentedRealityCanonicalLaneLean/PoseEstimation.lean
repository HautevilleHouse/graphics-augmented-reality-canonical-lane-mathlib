import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure PoseEstimationPackage where
  rotationMatrix : Type u
  translationVector : Type v
  correspondencesEstablished : Prop
  poseUnique : Prop
  correspondencesClosed : correspondencesEstablished
  poseUniqueClosed : poseUnique

structure PoseEstimationEvidence (P : PoseEstimationPackage) where
  correspondencesClosed : P.correspondencesEstablished
  poseUniqueClosed : P.poseUnique

def PoseEstimationClosed (P : PoseEstimationPackage) : Prop :=
  P.correspondencesEstablished ∧ P.poseUnique

theorem pose_estimation_closed_from_evidence (P : PoseEstimationPackage)
    (E : PoseEstimationEvidence P) : PoseEstimationClosed P := by
  exact And.intro E.correspondencesClosed E.poseUniqueClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse