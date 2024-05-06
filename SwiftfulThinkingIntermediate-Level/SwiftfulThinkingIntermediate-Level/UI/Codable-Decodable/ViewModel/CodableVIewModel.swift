//
//  CodableVIewModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 03/05/24.
//

import Foundation

class CodableViewModel: ObservableObject {
    
    @Published var custumer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJsonData() else  { return }
        self.custumer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    }
    
    func getJsonData() -> Data? {
        
        let customer = CustomerModel(id: "111", name: "Emily", points: 23, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
        return jsonData
    }
}
