//
//  OnboardingView.swift
//  Restart
//
//  Created by Martin on 2024/09/30.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
