//
//  CarDetailsView.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//

import SwiftUI
import MapKit

struct CarDetailsView: View {
    
    @EnvironmentObject private var vm: CarViewModel
    let cars: CarDataModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .center) {
                imageSection
                titleSection
               
            }
            VStack(spacing: 10) {
                nextButton
                reserveCarButton
            }
        }
        .padding(20)
        .background(
            LinearGradient(colors: [.white.opacity(0.5),.blue.opacity(0.6),.green], startPoint: .top, endPoint: .bottom)
        )
        .frame(width: UIScreen.main.bounds.width)
        .frame(height: UIScreen.main.bounds.height/2)
        .cornerRadius(10)
        
    }
}


#Preview {
    CarDetailsView(cars: CarDataService.cars.first!).padding().environmentObject(CarViewModel())
}




extension CarDetailsView {
    
    private var imageSection: some View{
        ZStack {
            if let imageURL = URL(string: cars.vehiclePicAbsoluteURL) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()  // Show a loading indicator while the image is being loaded
                        .frame(width: 100, height: 100)
                }
            } else {
                // If the URL is invalid, display a default placeholder image
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
            }
        }
        .padding(10)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .center, spacing: 4) {
            Text(cars.vehicleMake)
                .font(.title2)
                .fontWeight(.bold)
            Text("\(cars.licensePlateNumber), \(cars.remainingMileage) km")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var reserveCarButton: some View {
        Button(action: {
            
        }, label: {
            Text("Reserve This Car")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width - 80, height: 35)
                .padding(.horizontal)
        })
        .buttonStyle(.borderedProminent)
        
        
    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next Vehicle")
                .foregroundStyle(Color.white)
                .font(.headline)
                .frame(width: 125, height: 30)
        })
        .buttonStyle(.bordered)
        
    }
}
