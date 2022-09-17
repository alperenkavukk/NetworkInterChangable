//
//  UserViewModel.swift
//  NetworkInterChangable
//
//  Created by Alperen Kavuk on 17.09.2022.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    let webservice = WebService()
    
    func downloadUsers() async {
        
        do{
            let users = try await  webservice.download(Constans.Urls.usersExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }
        catch
        {
        print(error)
        }
    }
    
}






struct UserViewModel {
    
    let user: User
    
    var id : Int
    {
        user.id
    }
    
    var name : String
    {
        user.name
    }
    var username : String
    {
        user.username
    }
    var email : String
    {
        user.email
    }
}
