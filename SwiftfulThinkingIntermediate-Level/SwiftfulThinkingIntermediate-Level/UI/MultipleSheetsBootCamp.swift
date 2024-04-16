//
//  MultipleSheetsBootCamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 16/04/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}
//MARK: 3 MANEIRAS DE RESOLVER
//1 - use a biding
//2 - user multiple .sheets
//3 - use $item

struct MultipleSheetsBootCamp: View {
    
    @State var selectedModel: RandomModel? = nil
 
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                        
                    }
                }
            }
            
            .sheet(item: $selectedModel) { model in
                NextScreen( selectModel: model)
            }
        }
    }
}

struct NextScreen: View {
    let selectModel: RandomModel
    
    var body: some View {
        Text(selectModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootCamp()
}
