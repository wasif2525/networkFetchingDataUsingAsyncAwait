//
//  Digimon.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//
struct Digimon: Decodable{
    let name, img, level: String
}

extension Digimon : Identifiable{
    var id: String{
        img
    }
}
