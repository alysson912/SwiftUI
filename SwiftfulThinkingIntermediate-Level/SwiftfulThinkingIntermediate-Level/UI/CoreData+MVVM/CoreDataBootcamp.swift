//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 27/04/24.
//

import SwiftUI

struct CoreDataBootcamp: View {
    @StateObject var viewModel = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20) {
                TextField("Add fruits here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 10)
                
                Button(action: {
                    guard !textFieldText.isEmpty else { return } // certificando q nao ta vazio
                    viewModel.addFruits(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Button")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 10)
                })
            }
            .padding(.horizontal)
            
            List {
                ForEach(viewModel.saveEntities) { entity in
                    Text(entity.name ?? "No Name")
                        .onTapGesture {
                            viewModel.updateFruit(entity: entity)
                        }
                }
                .onDelete(perform:  viewModel.deleteFruit)
                    
            }
            .listStyle(PlainListStyle())
            
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}
