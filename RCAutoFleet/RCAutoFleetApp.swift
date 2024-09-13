//
//  RCAutoFleetApp.swift
//  RCAutoFleet
//
//  Created by Pramit Patekar on 12/09/24.
//

import SwiftUI

@main
struct RCAutoFleetApp: App {
    
    @StateObject private var vm = CarViewModel()
    
    var body: some Scene {
        WindowGroup {
            CarLocationView()
                .environmentObject(vm)
        }
    }
}
