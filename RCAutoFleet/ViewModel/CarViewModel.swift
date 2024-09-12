//
//  CarViewModel.swift
//  RCAutoFleet
//
//  Created by Samit Patekar on 12/09/24.
//

import Foundation
import MapKit
import SwiftUI

class CarViewModel: ObservableObject {
    
    //All loaded cars
    @Published var cars: [CarDataModel]
    
    //Only current car location on map
    @Published var mapLocation: CarDataModel {
        didSet{
            updateMapRegion(cars: mapLocation)
        }
    }
    
    //current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    init() {
        let cars = CarDataService.cars
        self.cars = cars
        self.mapLocation = cars.first!
        
        self.updateMapRegion(cars: mapLocation)
    }
    
    private func updateMapRegion(cars: CarDataModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: cars.coordinates, span: mapSpan)
        }
        
    }
    
//    func toggleLocationsList() {
//        withAnimation(.easeInOut) {
//            showLocationsList.toggle()
//        }
//    }
    
    func showNextCar(cars: CarDataModel) {
        withAnimation(.easeInOut) {
            mapLocation = cars
//            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        //get the current index
        guard let currentIndex = cars.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find the current index in the locations array and this should never happen.")
            return
            
        }
        //Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard cars.indices.contains(nextIndex) else {
            
            //next index is not valid and we will restart from zero
        
            guard let firstCar = cars.first else { return }
            showNextCar(cars: firstCar)
            return
        }
        
        //Next index is valid
        let nextCar = cars[nextIndex]
        showNextCar(cars: nextCar)
        
    }
    
}
