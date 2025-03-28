//
//  DataManager.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

@MainActor
protocol DataManagerProtocol: Sendable {
    func fetchCharacters(_ characterService: CharacterService?) async -> Result<[Character], Error>
}
@MainActor
internal final class DataManager: DataManagerProtocol, Sendable {
    
    var page: Int = 1
    var cachedCharacters: [Character] = []

    func fetchCharacters(_ characterService: CharacterService? = nil) async -> Result<[Character], Error> {
        var service = characterService
        if service == nil {
            service = await CharacterService(page: page)
        }
        guard let service else { return .success([]) }
        let result = await service.fetch()
        switch result {
        case .success(let responseApiCharacterApi):
            let characters = responseApiCharacterApi.results.map { Character($0) }
            cachedCharacters.append(contentsOf: characters)
            page += 1
            return .success(cachedCharacters)
        case .failure (let error):
            return .failure(error)
        }
    }
}
