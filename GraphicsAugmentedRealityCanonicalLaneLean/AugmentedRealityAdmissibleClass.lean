import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure AugmentedRealitySpace where
  realWorldPoints : Type
  virtualOverlay : Type
  cameraProjection : Type
  spatialMapping : Prop
  trackingQuality : Prop
  spatialMappingTerm : spatialMapping
  trackingQualityTerm : trackingQuality

structure ARAdmittedObject where
  arSpace : AugmentedRealitySpace
  constrainedToDevice : Prop
  viewpointConstraint : Prop
  deviceCapability : Prop
  registrationClosed : Prop
  conclusion : registrationClosed

structure AdmissibleClass where
  object : ARAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ARWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ARWitnessClosed (O : ARAdmittedObject) : Prop :=
  O.registrationClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse