//
//  SubscriberViewModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 17/05/24.
//

import Foundation
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
           // .assign(to: \.textIsValid, on: self)
        
            .sink(receiveValue: { [ weak self ] (isValid) in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        //MARK: criando um editor
         Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
        
        //MARK: assinando o editor
            .sink { [ weak self] _ in
                guard let self = self else { return } // verificando se self é valido
                self.count += 1
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [ weak self ](isValid, count) in
                guard let self = self else { return }
                
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables )
    }
    
}
