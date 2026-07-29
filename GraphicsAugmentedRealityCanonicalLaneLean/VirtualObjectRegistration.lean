import GraphicsAugmentedRealityCanonicalLaneLean.SpatialMappingPipeline

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure VirtualObjectRegistrationPackage {C: CameraProjectionPackage}
    {S: SpatialMappingPackage C} where
  anchorPoints: Type
  poseEstimation: Type
  occlusionHandling: Prop
  lightingConsistency: Prop
  physicsInteraction: Prop
  anchorPointsTerm: anchorPoints
  poseEstimationTerm: poseEstimation

structure RegistrationEvidence {C: CameraProjectionPackage}
    {S: SpatialMappingPackage C}
    (R: VirtualObjectRegistrationPackage C S) where
  occlusionHandlingClosed: R.occlusionHandling
  lightingConsistencyClosed: R.lightingConsistency
  physicsInteractionClosed: R.physicsInteraction

def RegistrationClosed {C: CameraProjectionPackage}
    {S: SpatialMappingPackage C}
    (R: VirtualObjectRegistrationPackage C S) : Prop :=
  R.occlusionHandling ∧ R.lightingConsistency ∧ R.physicsInteraction

theorem registration_closed_from_evidence {C: CameraProjectionPackage}
    {S: SpatialMappingPackage C} (R: VirtualObjectRegistrationPackage C S)
    (E: RegistrationEvidence R) : RegistrationClosed R := by
  exact And.intro E.occlusionHandlingClosed (And.intro E.lightingConsistencyClosed E.physicsInteractionClosed)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse