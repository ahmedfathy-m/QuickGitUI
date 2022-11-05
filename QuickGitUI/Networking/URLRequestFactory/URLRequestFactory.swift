//
//  URLRequestFactory.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

struct URLRequestFactory {
    let endpoint: NetworkingRouter
    
    //User Inputs
    let method: HTTPMethod?
    let body: [String: String]?
    let path: [String: String]?
    let headers: [String: String]?
    let cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad
    
    func buildRequest() throws -> URLRequest {
        // Unwrapping URL (Checking for bad url strings)
        guard var targetURL = endpoint.targetURL else { throw FactoryError.badURL }
        
        // Inserting the path parameters into the URL
        targetURL = encodePathParametes(path ?? endpoint.defaultQueryParameters, into: targetURL)
        
        // Building the Request
        var request = URLRequest(url: targetURL)
        request.cachePolicy = cachePolicy
        
        // Assigning an HTTP Method
        request.httpMethod = method?.rawValue ?? endpoint.defaultMethod.rawValue
        
        // Adding the Headers
        request.allHTTPHeaderFields = headers ?? endpoint.defaultHeaders
        
        // Encoding the body parametrs into a jsno data object and into the request
        request.httpBody = (request.httpMethod == "GET") ? nil : encodeBodyParameters(body ?? endpoint.defaultBodyParameters)
        
        // Final URLRequest
        return request
    }
    
    private func encodePathParametes(_ path: [String: String], into targetURL: URL) -> URL {
        var endURL = URLComponents(url: targetURL, resolvingAgainstBaseURL: true)!
        endURL.queryItems = path.toQueryItems()
        return endURL.url!
    }
    
    private func encodeBodyParameters(_ body: [String: String]) -> Data? {
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        return jsonData
    }
}




