//
// AppUserDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal struct AppUserDTO: Codable, JSONEncodable, Hashable {

    internal var id: String
    internal var clientUserId: String
    internal var isOnboardingQuestionnaireCompleted: Bool
    internal var appStyle: StyleDTO?

    internal init(id: String, clientUserId: String, isOnboardingQuestionnaireCompleted: Bool, appStyle: StyleDTO? = nil) {
        self.id = id
        self.clientUserId = clientUserId
        self.isOnboardingQuestionnaireCompleted = isOnboardingQuestionnaireCompleted
        self.appStyle = appStyle
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case clientUserId
        case isOnboardingQuestionnaireCompleted
        case appStyle
    }

    // Encodable protocol methods

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(clientUserId, forKey: .clientUserId)
        try container.encode(isOnboardingQuestionnaireCompleted, forKey: .isOnboardingQuestionnaireCompleted)
        try container.encodeIfPresent(appStyle, forKey: .appStyle)
    }
}

