import HautevilleHouse.GraphicsAugmentedRealityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure AdmissibleClass where
  object : GraphicsAugmentedRealityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GraphicsAugmentedRealityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse