import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsAugmentedRealityCanonicalLaneLean

structure RenderingPipelinePackage where
  shaderProgram : Type u
  framebuffer : Type v
  realtimePerformance : Prop
  visualFidelity : Prop
  performanceClosed : realtimePerformance
  fidelityClosed : visualFidelity

structure RenderingPipelineEvidence (R : RenderingPipelinePackage) where
  performanceClosed : R.realtimePerformance
  fidelityClosed : R.visualFidelity

def RenderingPipelineClosed (R : RenderingPipelinePackage) : Prop :=
  R.realtimePerformance ∧ R.visualFidelity

theorem rendering_pipeline_closed_from_evidence (R : RenderingPipelinePackage)
    (E : RenderingPipelineEvidence R) : RenderingPipelineClosed R := by
  exact And.intro E.performanceClosed E.fidelityClosed

end GraphicsAugmentedRealityCanonicalLaneLean
end HautevilleHouse