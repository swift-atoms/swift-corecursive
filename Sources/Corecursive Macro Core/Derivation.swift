import Type_Algebra_Syntax
public import SwiftSyntax
import SwiftSyntaxBuilder

public enum Derivation {
    public static func expansion(of declaration: EnumDeclSyntax) -> [DeclSyntax] {
        do { try RecursiveShape.validate(declaration) } catch {
            return [DeclSyntax(stringLiteral: "#error(\(String(reflecting: String(describing: error))))")]
        }
        let access = RecursiveShape.access(of: declaration)
        let branches = RecursiveShape.elements(of: declaration).map { element in
            let parameters = RecursiveShape.parameters(of: element)
            guard !parameters.isEmpty else {
                return "case .\(element.name.text): return .\(element.name.text)"
            }
            return "case let .\(element.name.text)(\(RecursiveShape.pattern(of: parameters))): return .\(element.name.text)(\(RecursiveShape.arguments(of: parameters)))"
        }.joined(separator: "\n")

        return ["""
            \(raw: access)static func embed(_ base: Base<Self>) -> Self {
                switch base {
                \(raw: branches)
                }
            }
            """]
    }

}
