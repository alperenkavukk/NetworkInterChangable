//
//  LocalService.swift
//  NetworkInterChangable
//
//  Created by Alperen Kavuk on 17.09.2022.
//

import Foundation

class Localservice {
    
    func download(_ resource : String) async throws -> [User]{
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resourece not found")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
        let userModel = try JSONDecoder().decode([User].self , from : data)
    }
}
