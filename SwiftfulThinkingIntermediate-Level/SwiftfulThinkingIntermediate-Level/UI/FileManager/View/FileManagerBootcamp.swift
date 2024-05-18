//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 18/05/24.
//

import SwiftUI

struct FileManagerBootcamp: View {
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
               
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height:  200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
                HStack {
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save to FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Button {
                        viewModel.deleteImage()
                    } label: {
                        Text("Delete from FM")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                Text( viewModel.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
