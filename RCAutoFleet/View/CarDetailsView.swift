//
//  CarDetailsView.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//


import SwiftUI
import MapKit

struct CarDetailsView: View {
    
    //@EnvironmentObject private var vm: CarViewModel
    let cars: CarDataModel
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
                imageSection
                titleSection
        }
        .background(Color.clear)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, 5)
        
    }
}


#Preview {
    CarDetailsView(cars: CarDataService.cars.first!)
       // .environmentObject(CarViewModel())
}



extension CarDetailsView {
    
    
    private var imageSection: some View{
        VStack {
            if let imageURL = URL(string: cars.vehiclePicAbsoluteURL) {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                        .cornerRadius(10)
                } placeholder: {
                    // Shows a loading indicator while the image is being loaded
                    ProgressView().frame(width: 100, height: 100)
                }
                
            } else {
                // If the URL is invalid, display a default placeholder image
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }
            
        }
        
    }

    private var titleSection: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(cars.vehicleMake)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("\(cars.licensePlateNumber), \(cars.remainingMileage) km")
                .font(.subheadline)
                .fontWeight(.semibold)
        }

    }
    
}


