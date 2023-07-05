//
//  NetworkingManager.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation

class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() {}
    
    func getRequest(withEndpoint endpoint: String) async throws -> Data {
        
        guard let url = URL(string: "\(endpoint)") else { throw Errors.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                 httpResponse.statusCode == 200 else {
               throw Errors.requestFailed
           }
        
        return data
        
    }
}

