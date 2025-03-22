//
//  Tab1PrimaryView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

protocol CharacterViewProtocol: AnyObject {
    func goToDetailCharater(character: Character)
}

struct CharactersView: View {
    let coordinator: CharacterViewProtocol
    @StateObject private var viewModel = CharactersListViewModel()

    var body: some View {

        List(viewModel.characters, id: \.name) { character in
            HStack {
                Text(character.name)
                    .font(.headline)
                Spacer()
            }
                .onTapGesture {
                coordinator.goToDetailCharater(character: character)
            }
        }
            .navigationTitle("title_characters_list")
            .onAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}
