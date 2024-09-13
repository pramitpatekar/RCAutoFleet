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
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.gray]), startPoint: .top, endPoint: .bottom)
                )
                
            //.cornerRadius(36)       any one we can use corner radius or clip shape to make a circle
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.6))
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 40)
        }
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    CarMapAnnotationView()
}
