//
//  CharacterService.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

@GlobalManager
final class CharacterService {

    let baseService = BaseService<ResponseJson<CharacterJson>>(param: "character")
    
    init() {
    }
    
    func fetch() async -> Result<ResponseJson<CharacterJson>, ErrorService> {
        await baseService.fetch()
    }
}

