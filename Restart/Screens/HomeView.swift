//
//  HomeView.swift
//  Restart
//
//  Created by Martin on 2024/09/30.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
