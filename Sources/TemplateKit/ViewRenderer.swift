import Foundation

/// Renders raw template data (bytes), which can be specified as Encodable structures, to `View`s.
public protocol ViewRenderer: class {

    /// For view renderers that use a cache to optimize view loads, use this variable to toggle whether or not cache should be implemented
    ///
    /// Normally, cache is disabled in development so views can be tested w/o recompilation.
    /// - note: In production, cache is enabled to optimize view serving speed.
    var shouldCache: Bool { get set }

    /// Renders the template bytes into a view using the supplied `Encodable` object as context.
    ///
    /// - parameters:
    ///     - path: Path to file contianing raw template bytes.
    ///     - context: `Encodable` item that will be encoded to `TemplateData` and used as template context.
    /// - returns: `Future` containing the rendered `View`.
    func render<E>(_ path: String, _ context: E) -> Future<View> where E: Encodable
}
