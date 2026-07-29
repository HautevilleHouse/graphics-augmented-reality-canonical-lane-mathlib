import canonicalLaneMathlib.AdmissibleClass

/-!
# Calibration Pipeline Package

This module captures the camera calibration and sensor fusion pipeline
that underlies augmented reality tracking systems.
-/

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure CalibrationPipelinePackage where
  intrinsicMatrix : Type u
  distortionCoeffs : Type v
  extrinsics : Type w
  reprojectionError : Prop
  jointOptimization : Prop
  calibrationComplete : Prop

structure CalibrationPipelineEvidence (C : CalibrationPipelinePackage) where
  intrinsicMatrixComputed : C.intrinsicMatrix
  distortionCoeffsComputed : C.distortionCoeffs
  extrinsicsComputed : C.extrinsics
  reprojectionErrorClosed : C.reprojectionError
  jointOptimizationClosed : C.jointOptimization
  calibrationCompleteClosed : C.calibrationComplete

def CalibrationPipelineClosed (C : CalibrationPipelinePackage) : Prop :=
  C.reprojectionError ∧ C.jointOptimization ∧ C.calibrationComplete

theorem calibration_pipeline_closed_from_evidence
    (C : CalibrationPipelinePackage) (E : CalibrationPipelineEvidence C) :
    CalibrationPipelineClosed C := by
  exact And.intro E.reprojectionErrorClosed
    (And.intro E.jointOptimizationClosed E.calibrationCompleteClosed)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse
