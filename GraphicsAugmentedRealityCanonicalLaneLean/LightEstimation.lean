import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure LightEstimationPackage where
  ambientIntensity : Float
  ambientColorTemperature : Float
  directionality : Prop
  shadowsEnabled : Prop
  smoothShadows : Prop

structure LightEstimationEvidence (L : LightEstimationPackage) where
  ambientIntensityClosed : L.ambientIntensity = 1000.0
  ambientColorTemperatureClosed : L.ambientColorTemperature = 6500.0
  directionalityClosed : L.directionality
  shadowsEnabledClosed : L.shadowsEnabled

def LightEstimationClosed (L : LightEstimationPackage) : Prop :=
  L.ambientIntensity = 1000.0 ∧ L.ambientColorTemperature = 6500.0 ∧ L.directionality ∧ L.shadowsEnabled

theorem light_estimation_closed_from_evidence (L : LightEstimationPackage) (E : LightEstimationEvidence L) : LightEstimationClosed L :=
  And.intro E.ambientIntensityClosed (And.intro E.ambientColorTemperatureClosed (And.intro E.directionalityClosed E.shadowsEnabledClosed))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse