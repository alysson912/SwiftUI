//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 16/04/24.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        //        GeometryReader { geometry in // custa muito poder de processamento do devie
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width:  geometry.size.width * 0.6)
        //
        //                Rectangle().fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
        
        ScrollView(.horizontal, showsIndicators:  false, content:  {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                                      axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
    }
}
#Preview {
    GeometryReaderBootcamp()
}
