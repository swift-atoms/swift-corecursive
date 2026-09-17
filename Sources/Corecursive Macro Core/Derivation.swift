public import SwiftSyntax
import Functor_Base_Macro_Core

public enum Derivation {
    public static func expansion(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Functor_Base_Macro_Core.Derivation.base(of: declaration)
            + operation(of: declaration)
    }

    public static func operation(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        Functor_Base_Macro_Core.Derivation.embed(of: declaration)
    }
}
