import Foundation

struct PresentationError: Error, Equatable {
    let reason: String
    
    init(reason: String) {
        self.reason = reason
    }
}

extension PresentationError {
    /// Describes an empty hero list error
    /// - Returns: an object of type (`PresentationError`) that encapsulate an error message
    static func emptyList() -> Self {
        PresentationError(reason: "Empty entity list")
    }
    
    /// Describes an empty hero error
    /// - Returns: an object of type (`PresentationError`) that encapsulate an error message
    static func notFound() -> Self {
        PresentationError(reason: "Entity not found")
    }
    
    /// Describes an empty hero error
    /// - Returns: an object of type (`PresentationError`) that encapsulate an error message
    static func session(_ message: String) -> Self {
        PresentationError(reason: message)
    }
    
    /// Describes a network error in the api client
    /// - Parameter error: an object of type (`String`) that represents an api error
    /// - Returns: an object of type (`PresentationError`) that encapsulate an error message
    static func network(_ errorMessage: String) -> Self {
        PresentationError(reason: errorMessage)
    }
    
    /// Describes an unknow login error
    /// - Returns: - Returns: an object of type (`PresentationError`) that encapsulate an error message
    static func uknown() -> Self {
        PresentationError(reason: "Unknown error")
    }
}
