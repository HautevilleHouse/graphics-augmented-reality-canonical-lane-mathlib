import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure AnchorManagementPackage where
  anchorPersistence : Prop
  anchorTracking : Prop
  worldSpaceTransform : Prop
  anchorRemoval : Prop
  anchorMerge : Prop

structure AnchorManagementEvidence (A : AnchorManagementPackage) where
  anchorPersistenceClosed : A.anchorPersistence
  anchorTrackingClosed : A.anchorTracking
  worldSpaceTransformClosed : A.worldSpaceTransform
  anchorRemovalClosed : A.anchorRemoval
  anchorMergeClosed : A.anchorMerge

def AnchorManagementClosed (A : AnchorManagementPackage) : Prop :=
  A.anchorPersistence ∧ A.anchorTracking ∧ A.worldSpaceTransform ∧ A.anchorRemoval ∧ A.anchorMerge

theorem anchor_management_closed_from_evidence (A : AnchorManagementPackage) (E : AnchorManagementEvidence A) : AnchorManagementClosed A :=
  And.intro E.anchorPersistenceClosed (And.intro E.anchorTrackingClosed (And.intro E.worldSpaceTransformClosed (And.intro E.anchorRemovalClosed E.anchorMergeClosed)))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse