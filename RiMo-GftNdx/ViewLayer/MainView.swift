//
//  MainView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var charactersListCoordinator = CharactersListCoordinator()

    var body: some View {
            NavigationStack(path: $charactersListCoordinator.path) {
                charactersListCoordinator.build(page: .charactersListView)
                    .navigationDestination(for: CharactersListViews.self) { page in
                        charactersListCoordinator.build(page: page)
                    }
            }
    }
}
