import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure RenderingPackage where
  occlusionHandling : Type u
  shadingModel : Type v
  transparencyBlending : Prop
  antialiasing : Prop
  framerateStability : Prop
  visualFidelity : Prop

structure RenderingEvidence (R : RenderingPackage) where
  transparencyBlendingClosed : R.transparencyBlending
  antialiasingClosed : R.antialiasing
  framerateStabilityClosed : R.framerateStability
  visualFidelityClosed : R.visualFidelity

def RenderingClosed (R : RenderingPackage) : Prop :=
  R.transparencyBlending ∧ R.antialiasing ∧
  R.framerateStability ∧ R.visualFidelity

theorem rendering_closed_from_evidence (R : RenderingPackage) (E : RenderingEvidence R) :
    RenderingClosed R := by
  exact And.intro E.transparencyBlendingClosed
    (And.intro E.antialiasingClosed
      (And.intro E.framerateStabilityClosed E.visualFidelityClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse