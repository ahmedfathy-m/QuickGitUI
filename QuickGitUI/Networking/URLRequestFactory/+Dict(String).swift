//
//  +String.swift
//  QuickGitUI
//
//  Created by Ahmed Samir on 03/11/2022.
//

import Foundation

extension [String: String] {
    func toQueryItems() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        self.forEach { key, value in
            items.append(URLQueryItem(name: key, value: value))
        }
        return items
    }
}
