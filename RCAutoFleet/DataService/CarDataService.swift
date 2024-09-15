//
//  CarDataService.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//

import Foundation
import MapKit

class CarDataService {
    
    static let cars: [CarDataModel] = [
    
        CarDataModel(id: 84, isActive: true, isAvailable: true, licensePlateNumber: "7LVF807", lat: 37.779816, lng: -122.395447, pool: "active", remainingMileage: 91, remainingRangeInMeters: 146000, transmissionMode: "park", vehicleMake: "BMW i3 Van", vehiclePic: "/media/uploads/vehicles/display_pics/739c2443-5c6b-405a-9eb1-b70f30debe34.png", vehiclePicAbsoluteURL: "https://d16vxu8318b851.cloudfront.net/uploads/vehicles/display_pics/739c2443-5c6b-405a-9eb1-b70f30debe34.png", vehicleType: "BMW i3 Van", vehicleTypeID: 11, vehicleAddr: "Address 1"),
        
        CarDataModel(id: 1102, isActive: true, isAvailable: true, licensePlateNumber: "7LKJ997", lat: 47.61328, lng: -122.342385, pool: "active", remainingMileage: 37, remainingRangeInMeters: 59000, transmissionMode: "park", vehicleMake: "BMW i3 Van", vehiclePic: "/media/uploads/vehicles/display_pics/5b96f5f8-2342-4448-8bfc-745275389988.png", vehiclePicAbsoluteURL: "https://d16vxu8318b851.cloudfront.net/uploads/vehicles/display_pics/5b96f5f8-2342-4448-8bfc-745275389988.png", vehicleType: "BMW i3 Van", vehicleTypeID: 11, vehicleAddr: "Address 2"),
        
        CarDataModel(id: 4770, isActive: true, isAvailable: true, licensePlateNumber: "plate627", lat: 43.65320, lng: -79.383285, pool: "active", remainingMileage: 0, remainingRangeInMeters: 0, transmissionMode: "park", vehicleMake: "BMW i3 Van", vehiclePic: "/media/uploads/vehicles/display_pics/739c2443-5c6b-405a-9eb1-b70f30debe34.png", vehiclePicAbsoluteURL: "https://d16vxu8318b851.cloudfront.net/uploads/vehicles/display_pics/739c2443-5c6b-405a-9eb1-b70f30debe34.png", vehicleType: "BMW i3 Van", vehicleTypeID: 11, vehicleAddr: "Address 3")
        
    ]
    
}
