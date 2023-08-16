//
//  CircleGroupView.swift
//  Restart
//
//  Created by Martin Flischman on 2023/08/16.
//

import SwiftUI

struct CircleGroupView: View {
    
    // Mark: Property
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    // Mark: Body
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } // ZStack - End
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
