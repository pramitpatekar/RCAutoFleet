//
//  CarMapAnnotationView.swift
//  RCAutoFleet
//
//  Created by Samit Patekar on 12/09/24.
//

import SwiftUI

struct CarMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "car.fill")               // for more symbols check SF symbols
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.black)
                .padding(10)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.orange, Color.pink]), startPoint: .top, endPoint: .bottom)
                )
            //.cornerRadius(36)       any one we can use corner radius or clip shape to make a circle
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.pink)
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    CarMapAnnotationView()
}
