//
//  ResponseJson.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

struct ResponseJson<T: Codable>: Codable where T: Sendable {
    let info: InfoJson
    let results: [T]
}

