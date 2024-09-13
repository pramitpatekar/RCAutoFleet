//
//  CarLocationView.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 13/09/24.
//



import SwiftUI
import MapKit

struct CarLocationView: View {
    
    @EnvironmentObject private var vm: CarViewModel
    let maxWidthForIpad: CGFloat = 700
    
   // @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                Spacer()
            
                ZStack {
                    CarsPreviewStack
                    
                    VStack(spacing: 10) {
                        HStack {
                            previousButton
                            Spacer()
                            nextButton
                        }
                        .opacity(0.5)
                        
                        
                        reserveCarButton
                            .offset(y: 85)
                            
                    }
                    
                }
                .frame(maxHeight: UIScreen.main.bounds.height/3.5)
                .background(
                    LinearGradient(colors: [.white.opacity(0.5),.blue.opacity(0.6),.green], 
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .background(.ultraThinMaterial)
            
                
            }
        }
    }
}

#Preview {
    CarLocationView()
        .environmentObject(CarViewModel())
}


extension CarLocationView {
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.cars,
            annotationContent: { car in
                MapAnnotation(coordinate: car.coordinates) {
                    CarMapAnnotationView()
                        .scaleEffect(vm.carMapLocation == car ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showCar(cars: car)
                        }
                }
            }
        )
        
    }
    
    
    private var CarsPreviewStack: some View {
        ZStack {
            ForEach(vm.cars) { car in
                if vm.carMapLocation == car {
                    
                    CarDetailsView(cars: car)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .frame(maxWidth: .infinity)
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxHeight: UIScreen.main.bounds.height/3.4)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                    
                }
                
            }
            
        }
        
    }
    
    private var reserveCarButton: some View {
        Button(action: {
            
        }, label: {
            Text("Reserve This Car")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width - 80, height: 35)
                //.padding(.horizontal)
        })
        .buttonStyle(.borderedProminent)
        
        
        
    }
    
    private var nextButton: some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text(">")
                .foregroundStyle(Color.white)
                .font(.headline)
                
        })
        .buttonStyle(.borderedProminent)
        
    }
    
    private var previousButton: some View {
        Button(action: {
            vm.previousButtonPressed()
        }, label: {
            Text("<")
                .foregroundStyle(Color.white)
                .font(.headline)
                
        })
        .buttonStyle(.borderedProminent)
        
    }
    
    
}



