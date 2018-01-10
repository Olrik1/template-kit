import Async
import Foundation

/// Parses template data into AST.
public protocol TemplateParser {
    func parse(template: Data, file: String) throws -> [TemplateSyntax]
}