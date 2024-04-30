//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 29/04/24.
//

import SwiftUI
import CoreData

struct CoreDataRelationshipsBootcamp: View {
    @StateObject var viewModel = CoreDataRelationshipsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20){
                    Button(action: {
                        viewModel.deleteDepartment()
                  //      viewModel.getEmployees(forBusiness: viewModel.businesses[0])
                    }, label: {
                        Text("Perform Action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 8)))
                    })
                    ScrollView (.horizontal, showsIndicators:  true){
                        HStack(alignment: .top ) {
                            ForEach(viewModel.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    
                    ScrollView (.horizontal, showsIndicators:  true){
                        HStack(alignment: .top) {
                            ForEach(viewModel.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    
                    ScrollView (.horizontal, showsIndicators:  true){
                        HStack(alignment: .top) {
                            ForEach(viewModel.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationTitle("Relationships")
        }
        
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}




