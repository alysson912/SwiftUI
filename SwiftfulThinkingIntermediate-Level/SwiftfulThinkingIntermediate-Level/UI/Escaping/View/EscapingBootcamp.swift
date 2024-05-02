//
//  EscapingBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 02/05/24.
//

import SwiftUI

struct EscapingBootcamp: View {
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                viewModel.getData() 
            }
    }
}

#Preview {
    EscapingBootcamp()
}
