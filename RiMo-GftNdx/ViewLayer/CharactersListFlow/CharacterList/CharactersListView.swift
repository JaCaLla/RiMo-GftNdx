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
                TextField("Buscar por nombre...", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                List(viewModel.characters, id: \.imageUrl) { character in
                    HStack {
                        Text(character.name)
                            .font(.headline)
                        Spacer()
                    }
                    .onAppear {
                        if character == viewModel.characters.last {
                            fetch()
                        }
                    }
                    .onTapGesture {
                        coordinator.goToDetailCharater(character: character)
                    }
                }
            }

            .navigationTitle("title_characters_list")
            .onAppear {
                fetch()
            }
            if viewModel.isFetching {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(width: 120, height: 120)
                    ProgressView("loading")
                        .foregroundColor(.white)
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
    
    private func fetch() {
        Task {
            await viewModel.fetch()
        }
    }
}
