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
    var fetchedCharacters: [Character] = []
    
    init() {
        $searchText
            .map { text in
                text.isEmpty ? self.fetchedCharacters : self.fetchedCharacters.filter { $0.name.lowercased().contains(text.lowercased())}
            }
            .assign(to: &$characters)
    }
    
    func fetch() async {
        guard !isFetching, searchText.isEmpty else { return }
        isFetching = true
        defer { isFetching = false }
        switch await appSingletons.dataManager.fetchCharacters() {
        case .success(let characters):
            fetchedCharacters = characters
            self.characters = fetchedCharacters
        case .failure(_): break
            #warning("TO DO: Handle error situation")
        }
    }
}
