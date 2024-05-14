//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 14/05/24.
//

import SwiftUI

struct DownloadWithEscapingBootcamp: View {
    @StateObject var viewModel = DownloadWithEscapingBootcampViewModel()
    
    var body: some View {
        List {
            ForEach( viewModel.posts) { post in
                VStack (alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithEscapingBootcamp()
}
