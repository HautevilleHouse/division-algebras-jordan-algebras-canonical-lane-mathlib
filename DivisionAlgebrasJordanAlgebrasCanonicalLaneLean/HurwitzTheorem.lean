import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure HurwitzTheoremPackage where
  realDivisionAlgebras : List DivisionAlgebraObject
  classificationComplete : Prop
  dimensionRestriction : Prop
  dimOne : DivisionAlgebraObject
  dimTwo : DivisionAlgebraObject
  dimFour : DivisionAlgebraObject
  dimEight : DivisionAlgebraObject

structure HurwitzEvidence (H : HurwitzTheoremPackage) where
  classificationCompleteClosed : H.classificationComplete
  dimensionRestrictionClosed : H.dimensionRestriction

def HurwitzClosed (H : HurwitzTheoremPackage) : Prop :=
  H.classificationComplete ∧ H.dimensionRestriction

theorem hurwitz_closed_from_evidence (H : HurwitzTheoremPackage)
    (E : HurwitzEvidence H) : HurwitzClosed H := by
  exact And.intro E.classificationCompleteClosed E.dimensionRestrictionClosed

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
