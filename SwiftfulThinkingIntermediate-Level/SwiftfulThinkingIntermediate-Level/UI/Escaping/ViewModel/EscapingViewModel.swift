//
//  EscapingViewModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 02/05/24.
//

import Foundation

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult ) -> ()

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Olá Mundo"
    
    func getData() {
        downloadData5 { [ weak self ] (returnedResult) in
            self?.text = returnedResult.data
        }
        
    }
    
    func downloadData() -> String {
        return "NEW DATA"
    }
    
    func downloadData2(completion: (_ data: String ) -> ()) {
        completion("New Data")
    }
    
    func downloadData3(completion: @escaping (_ data: String ) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion( "New data !")
        }
        
    }
    
    
    func downloadData4(completion: @escaping (DownloadResult ) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "new Data ")
            completion( result)
        }
    }
    
    func downloadData5(completion: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "new Data ")
            completion( result)
        }
    }
}
