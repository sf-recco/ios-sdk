//
// StyleDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal struct StyleDTO: Codable, JSONEncodable, Hashable {

    internal var darkColors: ColorsDTO
    internal var lightColors: ColorsDTO
    internal var iosFont: IOSFontDTO
    internal var androidFont: AndroidFontDTO

    internal init(darkColors: ColorsDTO, lightColors: ColorsDTO, iosFont: IOSFontDTO, androidFont: AndroidFontDTO) {
        self.darkColors = darkColors
        self.lightColors = lightColors
        self.iosFont = iosFont
        self.androidFont = androidFont
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case darkColors
        case lightColors
        case iosFont
        case androidFont
    }

    // Encodable protocol methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(darkColors, forKey: .darkColors)
        try container.encode(lightColors, forKey: .lightColors)
        try container.encode(iosFont, forKey: .iosFont)
        try container.encode(androidFont, forKey: .androidFont)
    }
}

