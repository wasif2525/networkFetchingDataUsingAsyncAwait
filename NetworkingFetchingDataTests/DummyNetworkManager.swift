//
//  DummyNetworkManager.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//
import Foundation
@testable import NetworkingFetchingData

class DummyNetworkManager:NetworkingManagerProtocol{
    var urlPath = ""
    
    func fetchData<T>(url: String, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: DummyNetworkManager.self)
        let urlObj = bundle.url(forResource: urlPath, withExtension: "json")
        
        guard let urlObj else {
            throw NetworkError.invalidURL
        }
        do{
            let data = try Data(contentsOf: urlObj)
            
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch{
            throw error
        }
        
    }
    
    
}
