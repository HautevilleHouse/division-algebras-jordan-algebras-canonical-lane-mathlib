import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Jordan.Classification

/-!
# Classification Package for Division Jordan Algebras
-/

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure ClassificationPackage where
  baseField : Type u
  classificationComplete : Prop
  realCase : Prop
  complexCase : Prop
  quaternionCase : Prop
  octonionCase : Prop
  exceptionalCases : Prop
  classificationCompleteProof : classificationComplete
  realCaseProof : realCase
  complexCaseProof : complexCase
  quaternionCaseProof : quaternionCase
  octonionCaseProof : octonionCase
  exceptionalCasesProof : exceptionalCases

structure ClassificationEvidence (C : ClassificationPackage) where
  classificationCompleteClosed : C.classificationComplete
  realCaseClosed : C.realCase
  complexCaseClosed : C.complexCase
  quaternionCaseClosed : C.quaternionCase
  octonionCaseClosed : C.octonionCase
  exceptionalCasesClosed : C.exceptionalCases

def ClassificationClosed (C : ClassificationPackage) : Prop :=
  C.classificationComplete ∧ C.realCase ∧ C.complexCase ∧ C.quaternionCase ∧ C.octonionCase ∧ C.exceptionalCases

theorem classification_closed_from_evidence (C : ClassificationPackage) (E : ClassificationEvidence C) :
    ClassificationClosed C := by
  exact And.intro E.classificationCompleteClosed
    (And.intro E.realCaseClosed
      (And.intro E.complexCaseClosed
        (And.intro E.quaternionCaseClosed
          (And.intro E.octonionCaseClosed E.exceptionalCasesClosed))))

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse