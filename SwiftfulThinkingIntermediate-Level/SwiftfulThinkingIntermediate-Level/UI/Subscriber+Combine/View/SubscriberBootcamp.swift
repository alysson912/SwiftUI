//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 17/05/24.
//

import SwiftUI

struct SubscriberBootcamp: View {
     @StateObject private var viewModel = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            
            
            TextField( "Type something here...", text: $viewModel.textFieldText)
                .frame(height: 55)
                .font(.headline)
                .foregroundStyle(Color.white)
                .background(Color(UIColor.systemGray4))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                viewModel.textFieldText.count < 1 ? 0.0 :
                                viewModel.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(viewModel.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.headline)
                        .padding(.trailing)
                    , alignment: .trailing
                )
            Button {
                
            } label: {
                Text("enviar".uppercased())
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .opacity(viewModel.showButton ? 1.0 : 0.5)
            }
            .disabled(!viewModel.showButton)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SubscriberBootcamp()
}

