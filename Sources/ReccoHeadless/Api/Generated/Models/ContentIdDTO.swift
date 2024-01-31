//
// ContentIdDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal struct ContentIdDTO: Codable, JSONEncodable, Hashable {

    internal var itemId: String
    internal var catalogId: String

    internal init(itemId: String, catalogId: String) {
        self.itemId = itemId
        self.catalogId = catalogId
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case itemId
        case catalogId
    }

    // Encodable protocol methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itemId, forKey: .itemId)
        try container.encode(catalogId, forKey: .catalogId)
    }
}
