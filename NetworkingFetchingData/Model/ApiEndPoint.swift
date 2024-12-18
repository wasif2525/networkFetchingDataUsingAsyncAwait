//
//  ApiEndPoint.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/20/24.
//
//he static keyword means that the properties BaseURL and PlanetApiPath belong to the ApiEndPoint type itself, rather than to individual instances of the struct. They are accessible directly on the type without needing to create an instance. You can access these properties directly using ApiEndPoint.BaseURL and ApiEndPoint.PlanetApiPath.
//https://digimon-api.vercel.app/api/digimon
//up until first slash is the base url
struct ApiEndPoint {
    static let BaseURL = "https://digimon-api.vercel.app"
    static let PlanetApiPath = "/api/digimon"
}
//https://swapi.dev/api/planets/
struct ApiEndPoint2 {
    static let BaseURL = "https://swapi.dev"
    static let PlanetApiPath = "/api/planets"
}
