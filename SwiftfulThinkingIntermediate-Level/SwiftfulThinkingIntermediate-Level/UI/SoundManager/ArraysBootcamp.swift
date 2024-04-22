//
//  ArraysBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 22/04/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {// observar se ele muda
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    @Published var mappedArray: [String] = [] // converter arrau de users para string
    
    init(){
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
    //MARK: 3 maneiras para modificar dados

    //1 - sort - ordenar
        /* // compara um objeto com o outro (n necessariamente o primeiro com o segundo) , após isso retorna um bool
        filterArray = dataArray.sorted(by: {$0.points < $1.points})
      */
        
        //2 - filter
    /*
        filterArray = dataArray.filter({ $0.isVerified }) // verificando user pelo verified
      */
        
        //3 - map
        /*
        // convert user to String
        //mappedArray = dataArray.map({$0.name})
        //MARK:  caso o nao tenha nome no objeto mappedArray nao funciona pois ele é obrigado a retorna uma String, para resolver isso usa-se a seguinte func:
        
        //mappedArray = dataArray.compactMap({ (user) -> String? in
        //    return user.name ?? "ERROR"
            // estamos dizendo que o usuario pode ou nao ter colocado um nome
        
        // versao compactada:
        mappedArray = dataArray.compactMap({ $0.name })
        // nesse caso ele nao exibe os nomes que nao existem
     */
        
        //MARK: FILTRO TOP
        mappedArray = dataArray
            .sorted(by: {$0.points > $1.points}) // maioria de pontos
            .filter({$0.isVerified}) // exibe users verificados
            .compactMap({ $0.name}) // exibe o nomes que existem
    }
    
    
    func getUsers(){
        // fake users
        let user1 = UserModel(name: "Alysson", points: 4, isVerified: true)
        let user2 = UserModel(name: "Ana", points: 546, isVerified: false)
        let user3 = UserModel(name: "Clay", points: 3, isVerified: true)
        let user4 = UserModel(name: nil, points: 24, isVerified: false)
        let user5 = UserModel(name: nil, points: 54, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var viewModel = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
//                ForEach(viewModel.filterArray) { user in
//                    VStack (alignment: .leading){
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 8.0)))
//                    .padding(.horizontal)
//                }
                
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
