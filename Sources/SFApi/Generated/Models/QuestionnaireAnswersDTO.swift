//
// QuestionnaireAnswersDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuestionnaireAnswersDTO: Codable, JSONEncodable, Hashable {

    public var id: String
    public var answers: [CreateQuestionnaireAnswerDTO]

    public init(id: String, answers: [CreateQuestionnaireAnswerDTO]) {
        self.id = id
        self.answers = answers
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case answers
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(answers, forKey: .answers)
    }
}

