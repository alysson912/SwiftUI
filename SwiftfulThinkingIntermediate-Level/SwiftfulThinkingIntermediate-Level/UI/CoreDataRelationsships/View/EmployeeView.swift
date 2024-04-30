//
//  EmployeeView.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 30/04/24.
//

import SwiftUI
import CoreData

struct EmployeeView: View {
    
    let entity: EmployeeEntity
    var body: some View {
        VStack (alignment: .leading,spacing: 20){
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
                
            Text(" Date joined:\(entity.dataJoined ?? Date())")
            
            Text(entity.business?.name ?? "")
            
            Text("Business:")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department:")
                .bold()
            
            Text(entity.department?.name ?? "")
            
            
   
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 10)
    }
}
