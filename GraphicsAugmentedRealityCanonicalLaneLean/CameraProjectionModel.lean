import GraphicsAugmentedRealityCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure CameraProjectionPackage where
  intrinsicMatrix : Type
  extrinsicMatrix : Type
  distortionCoefficients : Type
  projectionEquation: Prop
  lensDistortionModel: Prop
  calibrationValidated: Prop

structure CameraProjectionEvidence (C: CameraProjectionPackage) where
  projectionEquationClosed: C.projectionEquation
  lensDistortionModelClosed: C.lensDistortionModel
  calibrationValidatedClosed: C.calibrationValidated

def CameraProjectionClosed (C: CameraProjectionPackage) : Prop :=
  C.projectionEquation ∧ C.lensDistortionModel ∧ C.calibrationValidated

theorem camera_projection_closed_from_evidence (C: CameraProjectionPackage)
    (E: CameraProjectionEvidence C) : CameraProjectionClosed C := by
  exact And.intro E.projectionEquationClosed (And.intro E.lensDistortionModelClosed E.calibrationValidatedClosed)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse