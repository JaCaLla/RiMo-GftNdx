//
//  Tab1PrimaryView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

protocol Tab1PrimaryViewProtocol: AnyObject {
    func goToSecondary1()
    func goToSecondary2()
}

@MainActor
class CharactersListViewModell: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetch() async {
        let dataManager = DataManager()
        switch await dataManager.fetchCharacters() {
        case .success(let characters):
            self.characters = characters
        case .failure(_): break
            // TO DO: Handle error situation
        }
    }
}


struct Tab1PrimaryView: View {
     let coordinator: Tab1PrimaryViewProtocol
    @StateObject private var viewModel = CharactersListViewModell()
    
        var body: some View {
            
            List(viewModel.characters, id: \.name) { character in
                
//                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
//                    Text("Age: \(person.age)")
//                        .font(.subheadline)
//                }
            }
            .navigationTitle("Characters")
            .onAppear {
                Task {
                    await viewModel.fetch()
                }
            }
        }
}
