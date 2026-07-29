import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure RenderingCompositingPackage where
  virtualContentRendering : Prop
  realWorldBackground : Prop
  occlusionHandling : Prop
  lightingIntegration : Prop
  shadowReceivers : Prop

structure RenderingCompositingEvidence (R : RenderingCompositingPackage) where
  virtualContentRenderingClosed : R.virtualContentRendering
  realWorldBackgroundClosed : R.realWorldBackground
  occlusionHandlingClosed : R.occlusionHandling
  lightingIntegrationClosed : R.lightingIntegration
  shadowReceiversClosed : R.shadowReceivers

def RenderingCompositingClosed (R : RenderingCompositingPackage) : Prop :=
  R.virtualContentRendering ∧ R.realWorldBackground ∧ R.occlusionHandling ∧ R.lightingIntegration ∧ R.shadowReceivers

theorem rendering_compositing_closed_from_evidence (R : RenderingCompositingPackage) (E : RenderingCompositingEvidence R) : RenderingCompositingClosed R :=
  And.intro E.virtualContentRenderingClosed (And.intro E.realWorldBackgroundClosed (And.intro E.occlusionHandlingClosed (And.intro E.lightingIntegrationClosed E.shadowReceiversClosed)))

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse