//
//  DetailView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct DetailView: View {
    let character: Character
    var body: some View {
        VStack {
            if let url = URL(string: character.imageUrl) {
                CachedAsyncImage(url: url)
                    .clipShape(Circle())
            }
            Form {
                Section {
                    LabeledContent("form_name", value: character.name)
                    LabeledContent("form_status", value: character.status)
                    LabeledContent("form_species", value: character.species)
                    
                } header: {
                    Text("section_character")
                }
                Section {
                    LabeledContent("form_location", value: character.location)
                    LabeledContent("form_type", value: character.type)
                } header: {
                    Text("section_site")
                }
                Section {
                    LabeledContent("form_numberOfEpisodes", value: "\(character.numberOfEpisodes)")
                } header: {
                    Text("section_episodes")
                }
            }.background(Color.green)
        }
    }
}
