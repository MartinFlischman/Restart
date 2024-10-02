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
            // MARK: - Header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            // MARK: - Body
            Text("The time that leads to mastery is dependant on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            Spacer()
            
            Button(action: {
                isOnboardingViewActive = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .padding(.bottom, 20)
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
