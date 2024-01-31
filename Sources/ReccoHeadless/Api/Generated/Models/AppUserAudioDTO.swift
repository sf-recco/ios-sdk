//
// AppUserAudioDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal struct AppUserAudioDTO: Codable, JSONEncodable, Hashable {

    internal enum CategoryDTO: String, Codable, CaseIterable {
        case exercise = "exercise"
        case meditation = "meditation"
        case relaxation = "relaxation"
    }
    internal var id: ContentIdDTO
    internal var rating: RatingDTO
    internal var status: StatusDTO
    internal var bookmarked: Bool
    internal var headline: String
    internal var description: String?
    internal var category: CategoryDTO
    internal var dynamicImageResizingUrl: String?
    internal var imageAlt: String?
    internal var audioUrl: String
    /** The estimated duration in seconds to read this article */
    internal var duration: Int
    internal var transcription: Bool

    internal init(id: ContentIdDTO, rating: RatingDTO, status: StatusDTO, bookmarked: Bool, headline: String, description: String? = nil, category: CategoryDTO, dynamicImageResizingUrl: String? = nil, imageAlt: String? = nil, audioUrl: String, duration: Int, transcription: Bool) {
        self.id = id
        self.rating = rating
        self.status = status
        self.bookmarked = bookmarked
        self.headline = headline
        self.description = description
        self.category = category
        self.dynamicImageResizingUrl = dynamicImageResizingUrl
        self.imageAlt = imageAlt
        self.audioUrl = audioUrl
        self.duration = duration
        self.transcription = transcription
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case rating
        case status
        case bookmarked
        case headline
        case description
        case category
        case dynamicImageResizingUrl
        case imageAlt
        case audioUrl
        case duration
        case transcription
    }

    // Encodable protocol methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(rating, forKey: .rating)
        try container.encode(status, forKey: .status)
        try container.encode(bookmarked, forKey: .bookmarked)
        try container.encode(headline, forKey: .headline)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(category, forKey: .category)
        try container.encodeIfPresent(dynamicImageResizingUrl, forKey: .dynamicImageResizingUrl)
        try container.encodeIfPresent(imageAlt, forKey: .imageAlt)
        try container.encode(audioUrl, forKey: .audioUrl)
        try container.encode(duration, forKey: .duration)
        try container.encode(transcription, forKey: .transcription)
    }
}
