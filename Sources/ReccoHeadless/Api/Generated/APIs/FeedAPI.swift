//
// FeedAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal class FeedAPI {

    /**
     Get feed sections.

     - returns: [FeedSectionDTO]
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func getFeed() async throws -> [FeedSectionDTO] {
        return try await getFeedWithRequestBuilder().execute().body
    }

    /**
     Get feed sections.
     - GET /api/v1/me/feed
     - Bearer Token:
     - type: http
     - name: bearerAuth
     - returns: RequestBuilder<[FeedSectionDTO]>
     */
    internal class func getFeedWithRequestBuilder() -> RequestBuilder<[FeedSectionDTO]> {
        let localVariablePath = "/api/v1/me/feed"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[FeedSectionDTO]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
