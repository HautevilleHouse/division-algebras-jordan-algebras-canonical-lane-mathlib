import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.HurwitzTheorem

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure JordanAlgebraClassificationPackage where
  simpleJordanAlgebras : List (Σ (A : DivisionAlgebraObject), JordanAlgebra A)
  classificationComplete : Prop
  exceptionalJordan : Prop
  spinFactor : Prop

structure ClassificationEvidence (C : JordanAlgebraClassificationPackage) where
  classificationCompleteClosed : C.classificationComplete
  exceptionalJordanClosed : C.exceptionalJordan
  spinFactorClosed : C.spinFactor

def ClassificationClosed (C : JordanAlgebraClassificationPackage) : Prop :=
  C.classificationComplete ∧ C.exceptionalJordan ∧ C.spinFactor

theorem classification_closed_from_evidence (C : JordanAlgebraClassificationPackage)
    (E : ClassificationEvidence C) : ClassificationClosed C := by
  exact And.intro E.classificationCompleteClosed
    (And.intro E.exceptionalJordanClosed E.spinFactorClosed)

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
