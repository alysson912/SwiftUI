//
//  BackgroundThreadViewModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 01/05/24.
//

import Foundation

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async { // thread que roda em segundo plano para baixar os dados
            let newData = self.downloadData()
           
            print("CHECK 01: \(Thread.isMainThread)") // verifica se estamos na main thread
            print("CHECK 01: \(Thread.current)") // obter a thread atual
            
            DispatchQueue.main.async { // usando a thread principal para atualizar os dados do array
                self.dataArray = newData
                
                print("CHECK 02: \(Thread.isMainThread)") // verifica se estamos na main thread
                print("CHECK 02: \(Thread.current)") // obter a thread atual
            }
        }
    }
    
   private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
    
    
}
