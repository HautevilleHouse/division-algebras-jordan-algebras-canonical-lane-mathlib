import DivisionAlgebrasJordanAlgebrasCanonicalLaneLean.JordanAlgebraClassification

namespace HautevilleHouse
namespace DivisionAlgebrasJordanAlgebrasCanonicalLaneLean

structure FreudenthalMagicSquarePackage where
  magicSquareEntries : Prop
  lieGroups : Prop
  exceptionalLieGroups : Prop
  freudenthalConstruction : Prop

structure FreudenthalEvidence (F : FreudenthalMagicSquarePackage) where
  magicSquareEntriesClosed : F.magicSquareEntries
  lieGroupsClosed : F.lieGroups
  exceptionalLieGroupsClosed : F.exceptionalLieGroups
  freudenthalConstructionClosed : F.freudenthalConstruction

def FreudenthalClosed (F : FreudenthalMagicSquarePackage) : Prop :=
  F.magicSquareEntries ∧ F.lieGroups ∧ F.exceptionalLieGroups ∧ F.freudenthalConstruction

theorem freudenthal_closed_from_evidence (F : FreudenthalMagicSquarePackage)
    (E : FreudenthalEvidence F) : FreudenthalClosed F := by
  exact And.intro E.magicSquareEntriesClosed
    (And.intro E.lieGroupsClosed
      (And.intro E.exceptionalLieGroupsClosed E.freudenthalConstructionClosed))

end DivisionAlgebrasJordanAlgebrasCanonicalLaneLean
end HautevilleHouse
