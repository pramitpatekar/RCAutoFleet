//
//  CarMapAnnotationView.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//

import SwiftUI

struct CarMapAnnotationView: View {
    
    let car: CarDataModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Car address text
            
            VStack(alignment: .center, spacing: 2) {
                VStack(alignment: .center, spacing: 2) {
                    Text(car.licensePlateNumber)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(car.vehicleAddr)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal,20)
                .background(Color.white)
                .cornerRadius(10)
                
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .zIndex(-1)
                    .frame(width: 35, height: 20)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(y: -7)
                
            }
            .background(Color.clear)
            .offset(y: 6)
        
            
            
            
            // Car location pin
            
            Image(systemName: "car.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.black)
                .padding(10)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.gray]), startPoint: .top, endPoint: .bottom)
                )
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 2)
            
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.85))
                .frame(width: 25, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 0)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 2)
            
        }
        .offset(y: -65)
        
    }
    
}


#Preview {
    CarMapAnnotationView(car: CarDataService.cars[0])
}
