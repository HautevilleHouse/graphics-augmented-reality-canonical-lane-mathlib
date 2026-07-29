import GraphicsAugmentedRealityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ARObjectState where
  object : ARAdmittedObject

def arProjection : Projection ARObjectState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem ar_projection_idempotent (x : ARObjectState) :
    arProjection.toFun (arProjection.toFun x) = arProjection.toFun x := by
  exact arProjection.idempotent x

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse