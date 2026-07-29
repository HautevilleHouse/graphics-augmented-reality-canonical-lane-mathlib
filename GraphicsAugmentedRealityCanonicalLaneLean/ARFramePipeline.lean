import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure ARFramePipelinePackage where
  cameraImage : Type
  depthMap : Type
  featurePoints : Type
  frameTime : Type
  smoothingEnabled : Prop
  frameRate : Nat

structure ARFramePipelineEvidence (P : ARFramePipelinePackage) where
  cameraImageClosed : P.cameraImage
  depthMapClosed : P.depthMap
  featurePointsClosed : P.featurePoints
  smoothingEnabledClosed : P.smoothingEnabled

def ARFramePipelineClosed (P : ARFramePipelinePackage) : Prop :=
  P.cameraImage ∧ P.depthMap ∧ P.featurePoints ∧ P.smoothingEnabled

theorem ar_frame_pipeline_closed_from_evidence (P : ARFramePipelinePackage) (E : ARFramePipelineEvidence P) : ARFramePipelineClosed P :=
  And.intro E.cameraImageClosed (And.intro E.depthMapClosed (And.intro E.featurePointsClosed E.smoothingEnabledClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse