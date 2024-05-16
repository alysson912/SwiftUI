//
//  TimerBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 16/05/24.
//

import SwiftUI

struct TimerBootcamp: View {
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    //MARK: Current Time
    /*
    
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
         return formatter
    }
    */
    
    //MARK: COUNTDOWN
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    //MARK: COUNTDOWN to DATE
    /*
    @State var timeRemaning: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaning() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaning = " \(hour): \(minute): \(second)"
    }
    */
    
    //MARK: ANIMATION COUNTER
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(.systemPink), Color(.black)]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
            .ignoresSafeArea()
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.pink)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer, perform: { _ in
            
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
