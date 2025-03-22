//
//  CharactersListViewModel.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

@MainActor
class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isFetching = false
    @Published var searchText: String = ""
    
    func fetch() async {
        guard !isFetching else { return }
        isFetching = true
        defer { isFetching = false }
        switch await appSingletons.dataManager.fetchCharacters() {
        case .success(let characters):
            self.characters = characters
        case .failure(_): break
            // TO DO: Handle error situation
        }
    }
}
