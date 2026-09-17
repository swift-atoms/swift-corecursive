public import SwiftSyntax
import Base_Functor_Macro_Core

public enum Derivation {
    public static func expansion(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Base_Functor_Macro_Core.Derivation.base(of: declaration)
            + operation(of: declaration)
    }

    public static func operation(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Base_Functor_Macro_Core.Derivation.embed(of: declaration)
    }
}
