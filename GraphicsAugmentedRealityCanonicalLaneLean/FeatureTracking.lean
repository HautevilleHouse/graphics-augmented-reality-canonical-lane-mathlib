import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure FeatureTrackingPackage where
  featureDescriptors : Type u
  matchingStrategy : Type v
  temporalConsistency : Prop
  outliersRemoved : Prop
  temporalClosed : temporalConsistency
  outliersClosed : outliersRemoved

structure FeatureTrackingEvidence (F : FeatureTrackingPackage) where
  temporalClosed : F.temporalConsistency
  outliersClosed : F.outliersRemoved

def FeatureTrackingClosed (F : FeatureTrackingPackage) : Prop :=
  F.temporalConsistency ∧ F.outliersRemoved

theorem feature_tracking_closed_from_evidence (F : FeatureTrackingPackage)
    (E : FeatureTrackingEvidence F) : FeatureTrackingClosed F := by
  exact And.intro E.temporalClosed E.outliersClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse