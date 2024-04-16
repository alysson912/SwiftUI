//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 16/04/24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            // botao para deslizar a tela ate o indice definido
                Button("Scroll Now") {
                    withAnimation(.spring()){ // definindo animacao
                        if let index = Int(textFieldText) {
                            scrollToIndex = index
                        }
                    }
                }
            
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item: \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index) // definindo indice em cada item
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        withAnimation(.spring()){ // definindo animacao
                            proxy.scrollTo(value, anchor: .center)
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
