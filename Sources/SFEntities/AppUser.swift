import Foundation

public struct AppUser: Equatable, Hashable {
    public var id: String

    public init(id: String) {
        self.id = id
    }
}

