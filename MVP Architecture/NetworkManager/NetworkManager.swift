//
//  NetworkManager.swift
//  MVP Architecture
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation

enum NetworkError:Error{
    case badURL
    case noData
}

protocol NetworkManagerDelegate{
    func fetchRequest<T:Codable>(type:T.Type, url:String) async throws -> T
}

class NetworkManager:NetworkManagerDelegate{
    
    func fetchRequest<T:Codable>(type:T.Type, url:String) async throws -> T {
        
        guard let url = URL(string: url) else{
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            let model = try JSONDecoder().decode(type, from: data)
            return model
        }
        catch{
            throw NetworkError.noData
        }
        
    }
}
