//
//  HashableBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 22/04/24.
//

import SwiftUI

//MARK: CRIANDO PROPRIO MODELO HASH
struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}


struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR")
    ]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 40){
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description) // valor hash de cada string
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
