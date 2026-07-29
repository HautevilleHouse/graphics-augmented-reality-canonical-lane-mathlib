import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure OcclusionHandlingPackage where
  depthMap : Type u
  occlusionMask : Type v
  objectsSegmented : Prop
  occlusionCorrect : Prop
  segmentationClosed : objectsSegmented
  occlusionClosed : occlusionCorrect

structure OcclusionHandlingEvidence (O : OcclusionHandlingPackage) where
  segmentationClosed : O.objectsSegmented
  occlusionClosed : O.occlusionCorrect

def OcclusionHandlingClosed (O : OcclusionHandlingPackage) : Prop :=
  O.objectsSegmented ∧ O.occlusionCorrect

theorem occlusion_handling_closed_from_evidence (O : OcclusionHandlingPackage)
    (E : OcclusionHandlingEvidence O) : OcclusionHandlingClosed O := by
  exact And.intro E.segmentationClosed E.occlusionClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse