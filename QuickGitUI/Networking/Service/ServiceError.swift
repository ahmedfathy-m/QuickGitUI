//
//  NetworkingError.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

enum ServiceError: Error {
    case serverError(Int)
    case clientError(Int)
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .serverError(let code): return "Server Error CODE \(code)"
            case .clientError(let code): return "Client Error CODE \(code)"
        }
    }
}
