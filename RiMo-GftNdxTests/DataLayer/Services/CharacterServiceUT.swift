//
//  CharacterServiceUT.swift
//  RiMo-GftNdxTests
//
//  Created by Javier Calatrava on 22/3/25.
//
@testable import RiMo_GftNdx
import Testing

extension RiMo_GftNdxTests {
    struct CharacterServiceUT {

        var sut: CharacterService!

        mutating func setupAsync() async {
            sut = await CharacterService()
        }

        // Look out! This is an integration test for checkin that service is working,
        // not a unit test
        @Test(.disabled()) mutating func testFetchCharacters() async throws {
            await setupAsync()
            switch await sut.fetch() {
            case .success(let responseService):
                #expect(responseService.info.count == 826)
                #expect(responseService.results[0].name == "Rick Sanchez")
                #expect(responseService.results[0].image ==  "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
                #expect(responseService.results[0].status ==  "Alive")
                #expect(responseService.results[0].species ==  "Human")
                #expect(responseService.results[0].type ==  "")
                #expect(responseService.results[0].location.name ==  "Citadel of Ricks")
                #expect(responseService.results[0].episode.count ==  51)
            default:
                Issue.record("Unexpected response")
            }
        }
        
        @Test mutating func testFetchNoData() async throws {
            await setupAsync()
            await sut.baseService.setforcedErrorApi(.noDataResponse)
            switch await sut.fetch() {
            case .success(_):
                Issue.record("Unexpected response")
            case .failure(let errorApi):
                #expect(errorApi.localizedDescription == "The operation couldn’t be completed. (RiMo_GftNdx.ErrorService error 3.)")
            }
        }
        
        static let errors: [ErrorService] = [.invalidHTTPResponse, .failedOnParsingJSON, .noDataResponse, .failedParallelFetching, .fetchStopsFailed, .badFormedURL]
        @Test(arguments: errors) mutating func testFetchErrors(error: ErrorService) async throws {
            await setupAsync()
            await sut.baseService.setforcedErrorApi(.noDataResponse)
            switch await sut.fetch() {
            case .success(_):
                Issue.record("Unexpected response")
            case .failure(let errorApi):
                #expect(errorApi.localizedDescription.isEmpty == false)
            }
        }
    }
}
