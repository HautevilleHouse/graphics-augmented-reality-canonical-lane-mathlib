import canonicalLaneMathlib.AdmissibleClass
import GraphicsAugmentedRealityCanonicalLaneLean.CalibrationPipeline
import GraphicsAugmentedRealityCanonicalLaneLean.SLAMLocalization
import GraphicsAugmentedRealityCanonicalLaneLean.LightingEstimation

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlib

structure ARAdmittedObject where
  calibration : CalibrationPipelinePackage
  slam : SLAMLocalizationPackage
  lighting : LightingEstimationPackage
  deviceCamera : Type
  display : Type
  trackingReady : Prop
  renderingReady : Prop
  conclusion : trackingReady ∧ renderingReady

structure ARAdmissibleClass where
  object : ARAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : ARAdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : ARAdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : ARAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ARAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedARClosure (A : ARAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ar_endgame (A : ARAdmissibleClass) : ConstrainedARClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse
