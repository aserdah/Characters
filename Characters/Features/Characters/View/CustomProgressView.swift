//
//  CustomProgressView.swift
//  Characters
//
//  Created by Ahmed Serdah on 05/01/2025.
//

import SwiftUI

struct CustomProgressView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(.blue)))
                    .position(x: geometry.size.width/2,y: geometry.size.height/2)
            }
        }
    }
}

#Preview {
    CustomProgressView()
}
