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
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    CarsPreviewStack
                        .offset(y: -30)
                        .padding(.bottom,5)
                    
                    reserveCarButton
                        .offset(y: 110)
                    
                }
                .frame(maxHeight: UIScreen.main.bounds.height/3.5)
                .background(
                    LinearGradient(colors: [.white.opacity(0.5),.blue.opacity(0.6),.green.opacity(0.9)],
                                   startPoint: .top, endPoint: .bottom)
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
                CarMapAnnotationView(car: car)
                    .onTapGesture {
                        if let index = vm.cars.firstIndex(where: { $0.id == car.id }) {
                            
                            // Update TabView index
                            vm.currentCarIndex = index
                            
                            // Update map region with animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(.easeInOut) {
                                    vm.updateMapRegion(cars: car)
                                }
                            }
                        }
                    }
                }
            }
        )
    }
    
    
    
    private var CarsPreviewStack: some View {
        
        TabView(selection: $vm.currentCarIndex) {
            ForEach(vm.cars.indices, id: \.self) { index in
                CarDetailsView(cars: vm.cars[index])
                    .shadow(color: .black.opacity(0.5), radius: 10)
                    .tag(index)  // Use the index for paging control
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onChange(of: vm.currentCarIndex) { newIndex in
            
            // Update map with animation when car index changes
            withAnimation(.easeInOut) {
                vm.updateMapRegion(cars: vm.cars[newIndex])
            }
        }
        
    }
    
    
    private var reserveCarButton: some View {
        Button(action: {
            showingAlert = true
        }, label: {
            Text("Reserve This Car")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width - 80, height: 35)
        })
        .buttonStyle(.borderedProminent)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Car Reserved"),
                  message: Text("The car has been reserved"),
                  dismissButton: .default(Text("OK")))
        }
    }
    
}



