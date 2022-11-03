//
//  FactoryErrors.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

enum FactoryError: Error {
    case badURL

}

extension FactoryError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL: return "Couldn't construct URL"
        }
    }
}
