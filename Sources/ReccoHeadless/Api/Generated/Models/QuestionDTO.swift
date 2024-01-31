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

internal struct QuestionDTO: Codable, JSONEncodable, Hashable {

    internal var questionnaireId: String
    internal var id: String
    internal var index: Int
    internal var text: String
    internal var type: QuestionAnswerTypeDTO
    internal var multiChoice: MultiChoiceQuestionDTO?
    internal var multiChoiceSelectedIds: [Int]?
    internal var numeric: NumericQuestionDTO?
    internal var numericSelected: Double?

    internal init(questionnaireId: String, id: String, index: Int, text: String, type: QuestionAnswerTypeDTO, multiChoice: MultiChoiceQuestionDTO? = nil, multiChoiceSelectedIds: [Int]? = nil, numeric: NumericQuestionDTO? = nil, numericSelected: Double? = nil) {
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

    internal enum CodingKeys: String, CodingKey, CaseIterable {
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

    internal func encode(to encoder: Encoder) throws {
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
