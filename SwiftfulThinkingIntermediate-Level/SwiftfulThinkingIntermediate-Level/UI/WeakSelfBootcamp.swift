//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 01/05/24.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage( "count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink( "Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 01")
        }
        
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.clipShape(RoundedRectangle(cornerRadius: 8)))
            ,alignment: .trailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var viewModel = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.headline)
                .foregroundStyle(.red)
                .navigationTitle("Screen 02")
            
            if let data = viewModel.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    deinit {
        print("DEINITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [ weak self] in
            self?.data = "New Data!"
            
            
            // self para criar referencia forte para classe atual
            // enquanto estiver executando essa tarefa, essa classe precisa absolutamente permanecer VIVA!
        }
    }
}

#Preview {
    WeakSelfBootcamp()
}
 
