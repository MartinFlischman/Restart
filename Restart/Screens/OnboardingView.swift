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
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimated: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - Header
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give, but how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimated)
                
                // MARK: - Body
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimated ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimated)
                }
                
                Spacer()
                
                // MARK: - Footer
                ZStack {
                    // Parts of the custom button
                    
                    // 1. Background (Static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    
                    // 2. Call-to-Action (Static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. Capsule (Dynamic Width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    // 4. Circle (Draggable
                    HStack {
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                            
                            Capsule()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimated ? 1 : 0)
                .offset(y: isAnimated ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimated)
            }
        }
        .onAppear(perform: {
            isAnimated = true
        })
    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
