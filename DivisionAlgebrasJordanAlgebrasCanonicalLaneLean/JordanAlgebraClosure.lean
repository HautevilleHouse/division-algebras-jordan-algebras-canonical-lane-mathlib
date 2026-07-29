import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraStructure

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.division.hasInverse (0 := A.object.division.zeroNotOne)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    -- Since A.object.division is a division ring, every nonzero element has an inverse.
    -- We need to show that the element (0 := A.object.division.zeroNotOne) has an inverse.
    -- In a division ring, the nonzero element zeroNotOne has an inverse.
    -- Use the fact that division rings have inverses for nonzero elements.
    have h : A.object.division.zeroNotOne ≠ 0 := by
      -- zeroNotOne is defined as a term that is not zero, so this is true by construction.
      exact A.object.division.zeroNotOne_ne_zero
    have hinv : ∃ b : A.object.division, A.object.division.zeroNotOne * b = 1 ∧ b * A.object.division.zeroNotOne = 1 :=
      A.object.division.mul_inv_cancel h
    rcases hinv with ⟨b, hb1, hb2⟩
    exact ⟨b, hb1, hb2⟩

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedJordanClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_jordan_endgame (A : AdmissibleClass) :
    ConstrainedJordanClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse