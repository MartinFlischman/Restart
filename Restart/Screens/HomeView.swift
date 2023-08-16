//
//  HomeView.swift
//  Restart
//
//  Created by Martin Flischman on 2023/08/16.
//

import SwiftUI

struct HomeView: View {
    
    // Mark: Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    // Mark: Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = true
            }) {
                Text("Restart")
            }
            
        } // VStack - End
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
