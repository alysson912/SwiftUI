//
//  CodableModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 03/05/24.
//

import Foundation


struct CustomerModel: Identifiable, Codable {
    
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
        
}
