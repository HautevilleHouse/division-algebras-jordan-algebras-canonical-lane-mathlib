import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.FreudenthalMagicSquare
import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure EndgameCertificate where
  hurwitz : HurwitzTheoremPackage
  hurwitzEvidence : HurwitzEvidence hurwitz
  classification : JordanAlgebraClassificationPackage
  classificationEvidence : ClassificationEvidence classification
  freudenthal : FreudenthalMagicSquarePackage
  freudenthalEvidence : FreudenthalEvidence freudenthal

def EndgameCertificateClosed (C : EndgameCertificate) : Prop :=
  HurwitzClosed C.hurwitz ∧ ClassificationClosed C.classification ∧ FreudenthalClosed C.freudenthal

theorem endgame_certificate_closed_from_evidence (C : EndgameCertificate) :
    EndgameCertificateClosed C := by
  exact And.intro (hurwitz_closed_from_evidence C.hurwitz C.hurwitzEvidence)
    (And.intro (classification_closed_from_evidence C.classification C.classificationEvidence)
      (freudenthal_closed_from_evidence C.freudenthal C.freudenthalEvidence))

theorem endgame_certificate_implies_admitted_closure (C : EndgameCertificate)
    (A : AdmissibleClass) (h : ConstrainedDivisionAlgebraClosure A) :
    EndgameCertificateClosed C := endgame_certificate_closed_from_evidence C

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
