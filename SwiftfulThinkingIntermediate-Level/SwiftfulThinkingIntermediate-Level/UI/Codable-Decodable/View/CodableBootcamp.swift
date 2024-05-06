//
//  CodableBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 03/05/24.
//

import SwiftUI


struct CodableBootcamp: View {
    @StateObject var viewModel = CodableViewModel()
    
    var body: some View {
        VStack (spacing: 20){
            if let custumer = viewModel.custumer {
                Text(custumer.id)
                Text(custumer.name)
                Text("\(custumer.points)")
                Text(custumer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
