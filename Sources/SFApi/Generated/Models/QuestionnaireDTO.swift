//
// QuestionnaireDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuestionnaireDTO: Codable, JSONEncodable, Hashable {

    public var id: String
    public var questions: [QuestionDTO]

    public init(id: String, questions: [QuestionDTO]) {
        self.id = id
        self.questions = questions
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case questions
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(questions, forKey: .questions)
    }
}

