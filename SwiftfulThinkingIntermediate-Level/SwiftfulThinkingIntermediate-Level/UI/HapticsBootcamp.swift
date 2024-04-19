//
//  HapticsBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 19/04/24.
//

import SwiftUI



class HapticManager {
    static let instance = HapticManager() // Create Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack (spacing: 20){
            Button("success"){ HapticManager.instance.notification(type: .success)}
            Button("error"){ HapticManager.instance.notification(type: .error)}
            Button("warning"){ HapticManager.instance.notification(type: .warning)}
            Divider()
            
            Button("soft") {HapticManager.instance.impact(style: .soft)}
            Button("light") {HapticManager.instance.impact(style: .light)}
            Button("medium") {HapticManager.instance.impact(style: .medium)}
            Button("heavy") {HapticManager.instance.impact(style: .heavy)}
        }
    }
}

#Preview {
    HapticsBootcamp()
}
