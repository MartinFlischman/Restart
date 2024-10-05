//
//  CircleGroupView.swift
//  Restart
//
//  Created by Martin on 2024/10/02.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - Property
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimated: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimated ? 0 : 10)
        .opacity(isAnimated ? 1 : 0)
        .scaleEffect(isAnimated ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimated)
        .onAppear(perform: {
            isAnimated = true
        })
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea(.all, edges: .all)
        
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
