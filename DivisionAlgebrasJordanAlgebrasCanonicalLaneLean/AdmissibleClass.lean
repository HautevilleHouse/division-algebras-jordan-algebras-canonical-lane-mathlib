import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure AdmissibleClass where
  object : DivisionAlgebraAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DivisionAlgebraWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
