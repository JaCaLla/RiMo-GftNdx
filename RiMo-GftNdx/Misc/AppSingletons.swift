//
//  AppSingletons.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

@MainActor
struct AppSingletons {
    var dataManager: DataManager
    var imageCache: ImageCache
    
    init(dataManager: DataManager? = nil,
         imageCache: ImageCache? = nil) {
        self.dataManager = dataManager ?? DataManager()
        self.imageCache = imageCache ?? ImageCache()
    }
}

@MainActor var appSingletons = AppSingletons()

