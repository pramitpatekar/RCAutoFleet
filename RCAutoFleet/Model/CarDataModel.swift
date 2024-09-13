//
//  CarDataModel.swift
//  RCAutoFleet
//
//  Created by Samit Patekar on 12/09/24.
//

import Foundation
import MapKit

struct CarDataModel: Identifiable, Equatable {
    
    let id: Int
    let isActive, isAvailable: Bool
    let licensePlateNumber: String
    let lat: CLLocationDegrees
    let lng: CLLocationDegrees
    let pool: String
    let remainingMileage, remainingRangeInMeters: Int
    let transmissionMode, vehicleMake, vehiclePic: String
    let vehiclePicAbsoluteURL: String
    let vehicleType: String
    let vehicleTypeID: Int
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
    
    static func == (lhs: CarDataModel, rhs: CarDataModel) -> Bool {
        lhs.id == rhs.id
    }
    
}
