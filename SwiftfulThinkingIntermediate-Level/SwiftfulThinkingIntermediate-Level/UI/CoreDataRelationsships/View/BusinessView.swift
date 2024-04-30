//
//  BusinessView.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 30/04/24.
//

import SwiftUI

struct BusinessView: View {
    let entity: BusinessEntity
    var body: some View {
        VStack (alignment: .leading,spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.departments?.allObjects as? [ BusinessEntity] {
                Text("Departments:")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            if let employee = entity.employees?.allObjects as? [ EmployeeEntity] {
                Text("Employees:")
                    .bold()
                ForEach(employee) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 10)
    }
}
