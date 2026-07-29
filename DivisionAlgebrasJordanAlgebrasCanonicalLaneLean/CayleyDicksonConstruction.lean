import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Algebra.Quaternion

/-!
# Cayley-Dickson Construction Package
-/

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure CayleyDicksonPackage where
  baseField : Type u
  dimension : ℕ
  algebraStr : JordanAlgebraPackage
  doublingProcess : Prop
  powerAssociative : Prop
  alternativity : Prop
  doublingProcessClosed : doublingProcess
  powerAssociativeClosed : powerAssociative
  alternativityClosed : alternativity

structure CayleyDicksonEvidence (C : CayleyDicksonPackage) where
  doublingProcessClosed : C.doublingProcess
  powerAssociativeClosed : C.powerAssociative
  alternativityClosed : C.alternativity

def CayleyDicksonClosed (C : CayleyDicksonPackage) : Prop :=
  C.doublingProcess ∧ C.powerAssociative ∧ C.alternativity

theorem cayley_dickson_closed_from_evidence (C : CayleyDicksonPackage) (E : CayleyDicksonEvidence C) :
    CayleyDicksonClosed C := by
  exact And.intro E.doublingProcessClosed
    (And.intro E.powerAssociativeClosed E.alternativityClosed)

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse