//
//  DownloadWithCombine.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 15/05/24.
//

import SwiftUI

struct DownloadWithCombine: View {
    @StateObject var viewModel = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach( viewModel.posts) { post in
                VStack (alignment: .leading){
                    Text(post.title)
                        .font(.headline)
                    Text(post.title)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
