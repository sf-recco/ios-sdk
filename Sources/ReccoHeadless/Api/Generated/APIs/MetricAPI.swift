//
// MetricAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal class MetricAPI {
    /**
     Log event.

     - parameter appUserMetricEventDTO: (body)
     - returns: Void
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func logEvent(appUserMetricEventDTO: AppUserMetricEventDTO) async throws {
        try await logEventWithRequestBuilder(appUserMetricEventDTO: appUserMetricEventDTO).execute().body
    }

    /**
     Log event.
     - POST /api/v1/me/metric
     - Bearer Token:
     - type: http
     - name: bearerAuth
     - parameter appUserMetricEventDTO: (body)
     - returns: RequestBuilder<Void>
     */
    internal class func logEventWithRequestBuilder(appUserMetricEventDTO: AppUserMetricEventDTO) -> RequestBuilder<Void> {
        let localVariablePath = "/api/v1/me/metric"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: appUserMetricEventDTO)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = OpenAPIClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true)
    }
}
