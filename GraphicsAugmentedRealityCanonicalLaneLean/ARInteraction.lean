import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure ARInteractionPackage where
  gestureRecognition : Prop
  touchInput : Prop
  gazeTracking : Prop
  voiceCommand : Prop
  hapticFeedback : Prop

structure ARInteractionEvidence (I : ARInteractionPackage) where
  gestureRecognitionClosed : I.gestureRecognition
  touchInputClosed : I.touchInput
  gazeTrackingClosed : I.gazeTracking
  voiceCommandClosed : I.voiceCommand
  hapticFeedbackClosed : I.hapticFeedback

def ARInteractionClosed (I : ARInteractionPackage) : Prop :=
  I.gestureRecognition ∧ I.touchInput ∧ I.gazeTracking ∧ I.voiceCommand ∧ I.hapticFeedback

theorem ar_interaction_closed_from_evidence
    (I : ARInteractionPackage) (E : ARInteractionEvidence I) :
    ARInteractionClosed I := by
  exact And.intro E.gestureRecognitionClosed
    (And.intro E.touchInputClosed
      (And.intro E.gazeTrackingClosed
        (And.intro E.voiceCommandClosed E.hapticFeedbackClosed)))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse