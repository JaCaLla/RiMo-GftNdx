//
//  CharactersListCoordinator.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

enum CharactersListViews: Hashable {
    case charactersListView
    case detailView(Character)
}

class CharactersListCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ page: CharactersListViews) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @MainActor @ViewBuilder
       func build(page: CharactersListViews) -> some View {
           switch page {
           case .charactersListView:
               CharactersView(coordinator: self)
           case .detailView (let character):
               DetailView(character: character)
           }
       }
}

extension CharactersListCoordinator: CharacterViewProtocol {
    func goToDetailCharater(character: Character) {
        push(.detailView(character))
    }
}
