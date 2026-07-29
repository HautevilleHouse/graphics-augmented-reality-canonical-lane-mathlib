import GraphicsAugmentedRealityCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ARWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse