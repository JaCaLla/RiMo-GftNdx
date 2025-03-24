//
//  ErrorService.swift
//  RiMo-GftNdx
//
//  Created by Javier Calatrava on 22/3/25.
//

enum ErrorService: Error {
    case errorResponse(Error)
    case invalidHTTPResponse
    case failedOnParsingJSON
    case noDataResponse
    case failedParallelFetching
    case fetchStopsFailed
    case badFormedURL
}

