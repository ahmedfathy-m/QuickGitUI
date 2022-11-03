//
//  Service.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

class NetworkService {
    // MARK: - SIGNLETON
    static let shared = NetworkService()
    private init() {}
    
    // MARK: - LOAD ENDPOINT
    func loadData<T: Codable>(from endpoint: NetworkingRouter,method: HTTPMethod? = nil, query: [String: String]? = nil, body: [String:String]? = nil , headers: [String: String]? = nil) async throws -> T {
        
        let factory = URLRequestFactory(endpoint: endpoint, method: method, body: body, path: query, headers: headers)
        let request = try factory.buildRequest()
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let error = validateResponse(response) {
            throw error
        }
        
        return try decodeData(data)
    }
    
    // MARK: - HELPER FUNCTIONS
    private func validateResponse(_ response: URLResponse) -> ServiceError? {
        let statusCode = (response as! HTTPURLResponse).statusCode
        switch statusCode {
        case 400...499: return ServiceError.clientError(statusCode)
        case 500...599: return ServiceError.serverError(statusCode)
        default: return nil
        }
    }
    
    private func decodeData<T: Codable>(_ data: Data) throws -> T {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}



