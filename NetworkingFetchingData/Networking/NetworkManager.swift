//
//  NetworkManager.swift
//  NetworkingFetchingData
//
//  Created by Bhuiyan Wasif on 11/21/24.
//
//let url = URL(string: "https://api.example.com/user")!
//
//do {
//    let user: User = try await fetchData(url: url, modelType: User.self)
//    print("User fetched: \(user)")
import Foundation

protocol NetworkingManagerProtocol {
    func fetchData<T:Decodable>(url: String, modelType: T.Type) async throws -> T
}

class NetworkManager{
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: NetworkingManagerProtocol {
    func fetchData<T>(url: String, modelType: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        do{
            let (data, response) = try await self.urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard (200...299).contains(response.statusCode) else {
                throw NetworkError.invalidHTTPStatusCode
            }
            
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
            
        }catch{
            print(error.localizedDescription)
            throw error
        }
        
    }
    
    
}
