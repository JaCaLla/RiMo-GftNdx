//
//  CharacterJson.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

struct CharacterJson: Codable {
    let name: String
    let image: String
    let status: String
    let species: String
    let type: String
    let episode: [String]
    let location: LocationJson
}

