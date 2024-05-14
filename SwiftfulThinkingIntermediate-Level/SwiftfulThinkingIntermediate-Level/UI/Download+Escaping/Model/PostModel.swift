//
//  PostModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 14/05/24.
//

import Foundation
// MARK: - PostModel

struct PostModel: Identifiable, Codable {
        let userId, id: Int
        let title, body: String
}
