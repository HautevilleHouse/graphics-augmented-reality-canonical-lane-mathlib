import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure TrackingAndRegistrationPackage where
  featureTracking : Prop
  motionEstimation : Prop
  mapUpdate : Prop
  relocalization : Prop
  driftCorrection : Prop

structure TrackingAndRegistrationEvidence (T : TrackingAndRegistrationPackage) where
  featureTrackingClosed : T.featureTracking
  motionEstimationClosed : T.motionEstimation
  mapUpdateClosed : T.mapUpdate
  relocalizationClosed : T.relocalization
  driftCorrectionClosed : T.driftCorrection

def TrackingAndRegistrationClosed (T : TrackingAndRegistrationPackage) : Prop :=
  T.featureTracking ∧ T.motionEstimation ∧ T.mapUpdate ∧ T.relocalization ∧ T.driftCorrection

theorem tracking_and_registration_closed_from_evidence
    (T : TrackingAndRegistrationPackage) (E : TrackingAndRegistrationEvidence T) :
    TrackingAndRegistrationClosed T := by
  exact And.intro E.featureTrackingClosed
    (And.intro E.motionEstimationClosed
      (And.intro E.mapUpdateClosed
        (And.intro E.relocalizationClosed E.driftCorrectionClosed)))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse