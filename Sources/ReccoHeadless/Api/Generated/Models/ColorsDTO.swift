//
// ColorsDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/**      CSS Hex Codes     The AA value (alpha) in #RRGGBBAA can range from the lowest value possible (00) to the highest value possible (FF)  */
internal struct ColorsDTO: Codable, JSONEncodable, Hashable {

    internal var primary: String
    internal var onPrimary: String
    internal var background: String
    internal var onBackground: String
    internal var accent: String
    internal var onAccent: String
    internal var illustration: String
    internal var illustrationOutline: String

    internal init(primary: String, onPrimary: String, background: String, onBackground: String, accent: String, onAccent: String, illustration: String, illustrationOutline: String) {
        self.primary = primary
        self.onPrimary = onPrimary
        self.background = background
        self.onBackground = onBackground
        self.accent = accent
        self.onAccent = onAccent
        self.illustration = illustration
        self.illustrationOutline = illustrationOutline
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case primary
        case onPrimary
        case background
        case onBackground
        case accent
        case onAccent
        case illustration
        case illustrationOutline
    }

    // Encodable protocol methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(primary, forKey: .primary)
        try container.encode(onPrimary, forKey: .onPrimary)
        try container.encode(background, forKey: .background)
        try container.encode(onBackground, forKey: .onBackground)
        try container.encode(accent, forKey: .accent)
        try container.encode(onAccent, forKey: .onAccent)
        try container.encode(illustration, forKey: .illustration)
        try container.encode(illustrationOutline, forKey: .illustrationOutline)
    }
}

