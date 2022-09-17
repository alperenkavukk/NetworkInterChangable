//
//  Webservice.swift
//  NetworkInterChangable
//
//  Created by Alperen Kavuk on 17.09.2022.
//

import Foundation

enum NetworkEror : Error {
    case invalidUrl
    case invalidSeverResponse
    
}

class WebService {
    
    func download(_ resource : String) async throws -> [User]{
        
        guard let url = URL(string: resource ) else {
            
            throw NetworkEror.invalidUrl
        }
      let(data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else  {
        
                throw NetworkEror.invalidSeverResponse
            
        }
        return try JSONDecoder().decode([User].self, from: data)
    }
}
