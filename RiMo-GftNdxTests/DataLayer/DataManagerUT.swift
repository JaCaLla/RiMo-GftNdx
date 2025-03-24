//
//  DataManagerUT.swift
//  RiMo-GftNdxTests
//
//  Created by Javier Calatrava on 22/3/25.
//

@testable import RiMo_GftNdx
import Testing

extension RiMo_GftNdxTests {
    struct DataManagerUT {
        var sut: DataManager!

        mutating func setupAsync() {
            sut = DataManager()
        }
        
        // Look out! This is an integration test for checkin that service is working,
        // not a unit test
        @Test(.disabled()) mutating func testFetchCharactersRealData() async throws {
            setupAsync()
            let result = await sut.fetchCharacters(nil)
            switch result {
            case .success(let characters):
                #expect(characters[0].name == "Rick Sanchez")
                #expect(characters[0].imageUrl == "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
                #expect(characters[0].status == "Alive")
                #expect(characters[0].species == "Human")
                #expect(characters[0].type == "")
                #expect(characters[0].location == "Citadel of Ricks")
                #expect(characters[0].numberOfEpisodes ==  51)
            default:
                Issue.record("Unexpected response")
            }
        }
        
        @Test mutating func testFetchCharactersWithError() async throws {
            setupAsync()
            let characterService = await CharacterService(page: 0)

            let baseService = await characterService.baseService
            await baseService.setforcedErrorApi(.noDataResponse)

            let result = await sut.fetchCharacters(characterService)
            switch result {
            case .failure(let error):
                #expect(error.localizedDescription == "The operation couldn’t be completed. (RiMo_GftNdx.ErrorService error 3.)")
            default:
                Issue.record("Unexpected response")
            }
        }
        
        @Test mutating func testFetchCharactersMockData() async throws {
            setupAsync()
            let characterService = await CharacterService(page: 0)
            let responseJson: ResponseJson<CharacterJson> = ResponseJson(info: InfoJson(count: 2), results: [CharacterJson.sample])
            let baseService = await characterService.baseService
            await baseService.setforcedResposeApi(responseJson)

            let result = await sut.fetchCharacters(characterService)
            switch result {
            case .success(let characters):
                #expect(characters.count == 1)
                #expect(characters[0].name == "a")
                #expect(characters[0].imageUrl == "b")
                #expect(characters[0].status == "c")
                #expect(characters[0].species == "d")
                #expect(characters[0].type == "e")
                #expect(characters[0].location == "l")
                #expect(characters[0].numberOfEpisodes == 3)
            default:
                Issue.record("Unexpected response")
            }
        }
    }
}

extension CharacterJson {
    static let sample = CharacterJson(name: "a", image: "b", status: "c", species: "d", type: "e", episode: ["x", "y", "z"], location: .sample)
}

extension LocationJson {
    static let sample = LocationJson(name: "l")
}
