//
//  DepartmentView.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 30/04/24.
//

import SwiftUI
import CoreData

struct DepartmentView: View {
    let entity: DepartmentEntity
    var body: some View {
        VStack (alignment: .leading,spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.businesses?.allObjects as? [ DepartmentEntity] {
                Text("Departments:")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
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
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 10)
    }
}

