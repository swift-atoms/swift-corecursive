public import SwiftSyntax
import Base_Functor_Derivation_Core

public enum Derivation {
    public static func expansion(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Base_Functor_Derivation_Core.Derivation.base(of: declaration)
            + operation(of: declaration)
    }

    public static func operation(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Base_Functor_Derivation_Core.Derivation.embed(of: declaration)
    }
}
