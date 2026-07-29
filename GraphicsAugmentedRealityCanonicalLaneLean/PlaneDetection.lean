import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure PlaneDetectionPackage where
  horizontalPlane : Prop
  verticalPlane : Prop
  planeExtent : Prop
  planeGeometry : Prop
  classification : Prop

structure PlaneDetectionEvidence (P : PlaneDetectionPackage) where
  horizontalPlaneClosed : P.horizontalPlane
  verticalPlaneClosed : P.verticalPlane
  planeExtentClosed : P.planeExtent
  classificationClosed : P.classification

def PlaneDetectionClosed (P : PlaneDetectionPackage) : Prop :=
  P.horizontalPlane ∧ P.verticalPlane ∧ P.planeExtent ∧ P.classification

theorem plane_detection_closed_from_evidence (P : PlaneDetectionPackage) (E : PlaneDetectionEvidence P) : PlaneDetectionClosed P :=
  And.intro E.horizontalPlaneClosed (And.intro E.verticalPlaneClosed (And.intro E.planeExtentClosed E.classificationClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse