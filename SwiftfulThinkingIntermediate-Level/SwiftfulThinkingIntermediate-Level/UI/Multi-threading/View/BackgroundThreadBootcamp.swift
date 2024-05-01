//
//  BackgroundThreadBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 01/05/24.
//

import SwiftUI

struct BackgroundThreadBootcamp: View {
    
    @StateObject var viewModel = BackgroundThreadViewModel()
    
    
    
    var body: some View {
        ScrollView {
         LazyVStack(spacing: 10) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
