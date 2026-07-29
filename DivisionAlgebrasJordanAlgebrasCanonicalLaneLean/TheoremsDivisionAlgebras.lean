import canonicalLaneMathlib.AdmissibleClass
import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.FormalizationDivisionAlgebrasJordanAlgebras

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

theorem frobenius_theorem (A : DivisionAlgebra) : A.carrier ≃ ℝ ∨ A.carrier ≃ ℂ ∨ A.carrier ≃ ℍ := by
  sorry

theorem hurwitz_theorem (A : DivisionAlgebra) (h : FiniteDimensional ℝ A.carrier) : dim ℝ A.carrier ∈ {1, 2, 4, 8} := by
  sorry

theorem real_division_algebra_classification :
    ∀ A : DivisionAlgebra, FiniteDimensional ℝ A.carrier →
      (A.carrier ≃ ℝ) ∨ (A.carrier ≃ ℂ) ∨ (A.carrier ≃ ℍ) ∨ (A.carrier ≃ 𝕆) := by
  intro A h
  apply frobenius_theorem A

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse