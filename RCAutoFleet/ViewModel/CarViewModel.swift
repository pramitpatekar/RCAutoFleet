//
//  CarViewModel.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//

import Foundation
import MapKit
import SwiftUI

class CarViewModel: ObservableObject {
    
    //All loaded cars
    @Published var cars: [CarDataModel]
    
    //Only current car location on map
    @Published var carMapLocation: CarDataModel {
        didSet{
            updateMapRegion(cars: carMapLocation)
        }
    }
    
    //current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    init() {
        let cars = CarDataService.cars
        self.cars = cars
        self.carMapLocation = cars.first!
        
        self.updateMapRegion(cars: carMapLocation)
    }
    
    
    private func updateMapRegion(cars: CarDataModel) {
        //withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: cars.coordinates, span: mapSpan)
        //}
        
    }
    
    
//-----------------------------

//    func showCar(cars: CarDataModel) {
//        withAnimation(.easeInOut) {
//            mapLocation = cars
//        }
//    }
//    
//    func nextButtonPressed() {
//        //get the current index
//        guard let currentIndex = cars.firstIndex(where: { $0 == mapLocation }) else {
//            print("Could not find the current index in the locations array and this should never happen.")
//            return
//        }
//        //Check if the currentIndex is valid
//        let nextIndex = currentIndex + 1
//        guard cars.indices.contains(nextIndex) else {
//            //next index is not valid and we will restart from zero
//            guard let firstCar = cars.first else { return }
//            showCar(cars: firstCar)
//            return
//        }
//        
//        //Next index is valid
//        let nextCar = cars[nextIndex]
//        showCar(cars: nextCar)
//    }
    
//-----------------------------
    
    
    func showCar(cars: CarDataModel) {
        withAnimation(.easeInOut) {
            carMapLocation = cars
        }
    }
    
    
    func nextButtonPressed() {
        guard let currentIndex = cars.firstIndex(where: { $0 == carMapLocation }) else { return }
        let nextIndex = currentIndex + 1
        let nextCar = (cars.indices.contains(nextIndex)) ? cars[nextIndex] : cars.first
        if let nextCar = nextCar {
            showCar(cars: nextCar)
        }
    }
    
    func previousButtonPressed() {
        guard let currentIndex = cars.firstIndex(where: { $0 == carMapLocation }) else { return }
        let previousIndex = currentIndex - 1
        let previousCar = (cars.indices.contains(previousIndex)) ? cars[previousIndex] : cars.last
        if let previousCar = previousCar {
            showCar(cars: previousCar)
            
        }
    }
    
    
}
