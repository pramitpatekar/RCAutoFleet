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
            
//            VStack(spacing: 10) {
//                HStack {
//                    previousButton
//                    nextButton
//                }
//                reserveCarButton
//            }
        }
        .padding(20)
        .background(Color.clear)
        
//        .background(
//            LinearGradient(colors: [.white.opacity(0.5),.blue.opacity(0.6),.green], 
//               startPoint: .top, endPoint: .bottom)
//        )
//        .background(.ultraThinMaterial)
        .frame(width: UIScreen.main.bounds.width)
     //   .frame(height: UIScreen.main.bounds.height/2.5)
        .cornerRadius(10)
        
    }
}


#Preview {
    CarDetailsView(cars: CarDataService.cars.first!)
        .padding()
        .environmentObject(CarViewModel())
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
                    // Show a loading indicator while the image is being loaded
                    // ProgressView().frame(width: 100, height: 100)
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }
                
            } else {
                // If the URL is invalid, display a default placeholder image
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
            }
            
        }
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
    
    
//    private var reserveCarButton: some View {
//        Button(action: {
//            
//        }, label: {
//            Text("Reserve This Car")
//                .font(.headline)
//                .frame(width: UIScreen.main.bounds.width - 80, height: 35)
//                //.padding(.horizontal)
//        })
//        .buttonStyle(.borderedProminent)
//        
//        
//        
//    }
//    
//    private var nextButton: some View {
//        Button(action: {
//            vm.nextButtonPressed()
//        }, label: {
//            Text("Next")
//                .foregroundStyle(Color.white)
//                .font(.headline)
//                .frame(width: 125, height: 30)
//        })
//        .buttonStyle(.borderedProminent)
//        
//    }
//    
//    private var previousButton: some View {
//        Button(action: {
//            vm.previousButtonPressed()
//        }, label: {
//            Text("Previous")
//                .foregroundStyle(Color.white)
//                .font(.headline)
//                .frame(width: 125, height: 30)
//        })
//        .buttonStyle(.borderedProminent)
//        
//    }
//    
}


