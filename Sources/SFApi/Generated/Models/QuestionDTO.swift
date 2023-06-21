//
// QuestionDTO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuestionDTO: Codable, JSONEncodable, Hashable {

    public var questionnaireId: String
    public var id: String
    public var index: Int
    public var text: String
    public var type: QuestionAnswerTypeDTO
    public var multiChoice: MultiChoiceQuestionDTO?
    public var multiChoiceSelectedIds: [Int]?
    public var numeric: NumericQuestionDTO?
    public var numericSelected: Double?

    public init(questionnaireId: String, id: String, index: Int, text: String, type: QuestionAnswerTypeDTO, multiChoice: MultiChoiceQuestionDTO? = nil, multiChoiceSelectedIds: [Int]? = nil, numeric: NumericQuestionDTO? = nil, numericSelected: Double? = nil) {
        self.questionnaireId = questionnaireId
        self.id = id
        self.index = index
        self.text = text
        self.type = type
        self.multiChoice = multiChoice
        self.multiChoiceSelectedIds = multiChoiceSelectedIds
        self.numeric = numeric
        self.numericSelected = numericSelected
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case questionnaireId
        case id
        case index
        case text
        case type
        case multiChoice
        case multiChoiceSelectedIds
        case numeric
        case numericSelected
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(questionnaireId, forKey: .questionnaireId)
        try container.encode(id, forKey: .id)
        try container.encode(index, forKey: .index)
        try container.encode(text, forKey: .text)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(multiChoice, forKey: .multiChoice)
        try container.encodeIfPresent(multiChoiceSelectedIds, forKey: .multiChoiceSelectedIds)
        try container.encodeIfPresent(numeric, forKey: .numeric)
        try container.encodeIfPresent(numericSelected, forKey: .numericSelected)
    }
}

