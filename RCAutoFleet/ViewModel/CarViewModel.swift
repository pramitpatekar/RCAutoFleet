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
    
    @Published var currentCarIndex: Int
    
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
    
    var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    init() {
        let cars = CarDataService.cars
        self.cars = cars
        self.currentCarIndex = 0
        self.carMapLocation = cars.first!
        self.updateMapRegion(cars: carMapLocation)
    }
    
    
    func updateMapRegion(cars: CarDataModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: cars.coordinates, span: mapSpan)
        }
    }
    
    
    func showCar(cars: CarDataModel) {
        withAnimation(.easeInOut) {
            carMapLocation = cars
        }
    }
    
}
