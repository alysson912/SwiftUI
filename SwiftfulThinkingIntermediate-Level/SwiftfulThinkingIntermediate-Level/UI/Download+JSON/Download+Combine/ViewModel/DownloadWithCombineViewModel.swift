//
//  DownloadWithCombineViewModel.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 15/05/24.
//

import Foundation
import Combine

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [ PostModel] = []

    //MARK: criando backup de dados (passo 7)
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
                    //MARK:  0 - COMBINE PASSO A PASSO
        
            //MARK:  1 - sign up for monthly subscription for package to be delivered
            //MARK:  2 - the compan would make the package behind the scene
            //MARK:  3 - recieve the package at your front door
            //MARK:  4 - make sure the box ins't damaged
            //MARK:  5 - open and make sure the item is correct
            //MARK:  6 - user the item !!
            //MARK:  7 - cancellable at any time !!
        
        //MARK: passo 1 - criar um publisher
        URLSession.shared.dataTaskPublisher(for: url)
        //MARK: passo 2 - colocar esse publisher em uma thread de segundo plano
            .subscribe(on: DispatchQueue.global(qos: .background))
        
        //MARK: passo 3 - receber o pacote na thread principal
            .receive(on: DispatchQueue.main)
        //MARK: passo 4 - verificar se o pacote está ou nao danificado
            .tryMap(handleOutput)

        //MARK: passo 5 - abrir a caixa e verificar se os items estao corretos (decode data into PostModels)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
        
        //MARK: passo 6  - sincronizar os dados e adciona-los ao app
            .sink { (completion) in
           
        
            } receiveValue: { [ weak self ] (returnedPosts) in
                self?.posts = returnedPosts
            }
        //MARK: passo 7 - Cancelar o pedido a qualquer momento (caso queira)
            .store(in: &cancellables)
    }
    
    //MARK: passo 4.1 - funcao para organizar melhor o passo 4
    func handleOutput( output: URLSession.DataTaskPublisher.Output) throws -> Data {
        
            guard
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            //MARK:  Caso os dados estejam em bom estado retorne ele
        return output.data
        }
    
        
    
}
