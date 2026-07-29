import GraphicsAugmentedRealityCanonicalLaneLean.CameraProjectionModel

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure SpatialMappingPackage {C: CameraProjectionPackage} where
  depthSensor: Type
  pointCloud: Type
  meshReconstruction: Type
  fusionAlgorithm: Prop
  loopClosure: Prop
  mapPersistence: Prop

structure SpatialMappingEvidence {C: CameraProjectionPackage}
    (S: SpatialMappingPackage C) where
  fusionAlgorithmClosed: S.fusionAlgorithm
  loopClosureClosed: S.loopClosure
  mapPersistenceClosed: S.mapPersistence

def SpatialMappingClosed {C: CameraProjectionPackage}
    (S: SpatialMappingPackage C) : Prop :=
  S.fusionAlgorithm ∧ S.loopClosure ∧ S.mapPersistence

theorem spatial_mapping_closed_from_evidence {C: CameraProjectionPackage}
    (S: SpatialMappingPackage C) (E: SpatialMappingEvidence S) :
    SpatialMappingClosed S := by
  exact And.intro E.fusionAlgorithmClosed (And.intro E.loopClosureClosed E.mapPersistenceClosed)

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse