//
//  AppSingletons.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

@MainActor
struct AppSingletons {
    var dataManager: DataManager
    
    init(dataManager: DataManager? = nil) {
        self.dataManager = dataManager ?? DataManager()
    }
}

@MainActor var appSingletons = AppSingletons()

