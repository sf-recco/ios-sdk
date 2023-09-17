import Foundation

public protocol QuestionnaireRepository {
    func getOnboardingQuestionnaire() async throws -> [Question]
    func getQuestionnaire(topic: ReccoTopic) async throws -> [Question]
    func sendQuestionnaire(_ answers: [CreateQuestionnaireAnswer]) async throws
    func sendOnboardingQuestionnaire(_ answers: [CreateQuestionnaireAnswer]) async throws
}

final class LiveQuestionnaireRepository: QuestionnaireRepository {
    func getQuestionnaire(topic: ReccoTopic) async throws -> [Question] {
        try await QuestionnaireAPI.getQuestionnaireByTopic(
            topic: .init(entity: topic)
        )
		.map(Question.init)
    }
    
    func sendQuestionnaire(_ answers: [CreateQuestionnaireAnswer]) async throws {
        try await QuestionnaireAPI.answers(
            createQuestionnaireAnswerDTO: answers.map(CreateQuestionnaireAnswerDTO.init)
        )
    }
    
    func getOnboardingQuestionnaire() async throws -> [Question] {
        try await QuestionnaireAPI
            .onboarding()
            .map(Question.init)
    }
    func sendOnboardingQuestionnaire(_ answers: [CreateQuestionnaireAnswer]) async throws {
        try await QuestionnaireAPI.onboardingAnswers(createQuestionnaireAnswerDTO: answers.map(CreateQuestionnaireAnswerDTO.init))
    }
}
