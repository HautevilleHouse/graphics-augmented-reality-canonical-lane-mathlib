import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure FiducialMarkerPackage where
  markerLibrary : Type u
  detectionAlgorithm : Type v
  markerPatternsValid : Prop
  poseEstimationAccuracy : Prop
  occlusionHandling : Prop
  detectionRobustness : Prop

structure FiducialMarkerEvidence (F : FiducialMarkerPackage) where
  markerPatternsValidClosed : F.markerPatternsValid
  poseEstimationAccuracyClosed : F.poseEstimationAccuracy
  occlusionHandlingClosed : F.occlusionHandling
  detectionRobustnessClosed : F.detectionRobustness

def FiducialMarkerClosed (F : FiducialMarkerPackage) : Prop :=
  F.markerPatternsValid ∧ F.poseEstimationAccuracy ∧
  F.occlusionHandling ∧ F.detectionRobustness

theorem fiducial_marker_closed_from_evidence (F : FiducialMarkerPackage) (E : FiducialMarkerEvidence F) :
    FiducialMarkerClosed F := by
  exact And.intro E.markerPatternsValidClosed
    (And.intro E.poseEstimationAccuracyClosed
      (And.intro E.occlusionHandlingClosed E.detectionRobustnessClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse