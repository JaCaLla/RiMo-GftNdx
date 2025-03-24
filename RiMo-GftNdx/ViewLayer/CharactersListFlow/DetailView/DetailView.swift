//
//  DetailView.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let character: Character
    var body: some View {
        VStack {
            if let url = URL(string: character.imageUrl) {
                CachedAsyncImage(url: url)
                    .clipShape(Circle())
            }
            Form {
                Section {
                    Group {
                        LabeledContent("form_name", value: character.name)
                        LabeledContent("form_status", value: character.status)
                        LabeledContent("form_species", value: character.species)
                    }
                    .font(Typography.body.font)
                    
                } header: {
                    Text("section_character")
                        .font(Typography.title2.font)
                }
                Section {
                    Group {
                        LabeledContent("form_location", value: character.location)
                        LabeledContent("form_type", value: character.type)
                    }
                    .font(Typography.body.font)
                } header: {
                    Text("section_site")
                        .font(Typography.title2.font)
                }
                Section {
                    LabeledContent("form_numberOfEpisodes", value: "\(character.numberOfEpisodes)")
                        .font(Typography.body.font)
                } header: {
                    Text("section_episodes")
                        .font(Typography.title2.font)
                }
            }.background(Color.green)
        }
        .navigationTitle("detail")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("back")
                            .font(Typography.body.font)
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}
