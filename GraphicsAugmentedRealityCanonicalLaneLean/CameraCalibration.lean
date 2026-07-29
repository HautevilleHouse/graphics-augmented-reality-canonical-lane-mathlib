import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure CameraCalibrationPackage where
  intrinsicMatrix : Type u
  extrinsicMatrix : Type v
  distortionCoefficients : Type w
  calibrationPatternDetected : Prop
  reprojectionErrorBounded : Prop
  patternDetectedClosed : calibrationPatternDetected
  reprojectionClosed : reprojectionErrorBounded

structure CameraCalibrationEvidence (C : CameraCalibrationPackage) where
  patternDetectedClosed : C.calibrationPatternDetected
  reprojectionClosed : C.reprojectionErrorBounded

def CameraCalibrationClosed (C : CameraCalibrationPackage) : Prop :=
  C.calibrationPatternDetected ∧ C.reprojectionErrorBounded

theorem camera_calibration_closed_from_evidence (C : CameraCalibrationPackage)
    (E : CameraCalibrationEvidence C) : CameraCalibrationClosed C := by
  exact And.intro E.patternDetectedClosed E.reprojectionClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse