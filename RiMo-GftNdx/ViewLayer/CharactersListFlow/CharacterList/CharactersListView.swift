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

struct CharactersListView: View {
    let coordinator: CharacterViewProtocol
    @StateObject private var viewModel = CharactersListViewModel()
    @State private var scrollPosition: Int?
    
    var body: some View {
        ZStack {
            VStack {
                SearchTextView(searchText: $viewModel.searchText)
                List(viewModel.characters, id: \.imageUrl) { character in
                    Button(action: {
                        coordinator.goToDetailCharater(character: character)
                    }) {
                        characterView(character)
                    }
                    .onAppear {
                        if character == viewModel.characters.last {
                            fetch()
                        }
                    }
                }
            }
            .navigationTitle("title_characters_list")
            .font(Typography.body.font)
            .onAppear {
                fetch()
            }
            if viewModel.isFetching {
                ActivityIndicatorView()
            }
        }
    }
    
    private func characterView(_ character: Character) -> some View {
        HStack {
            Text(character.name)
                .font(Typography.body.font)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .foregroundColor(.primary)
        
    }
    
    
    private func fetch() {
        Task {
            await viewModel.fetch()
        }
    }
}
