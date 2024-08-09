//
//  Presenter.swift
//  MVP Architecture
//
//  Created by Shashi Gupta on 09/08/24.
//

import Foundation

protocol PresenterDelegate:AnyObject{
    func getUsers(users:[User])
}

class Presenter{
    
    weak var view: PresenterDelegate?
    init(view: PresenterDelegate) {
        self.view = view
    }
    
    let networkManager:NetworkManagerDelegate = NetworkManager()
    
    func fetchUsers(){
        
        Task{
            do {
                let users = try await self.networkManager.fetchRequest(type: [User].self, url: "https://jsonplaceholder.typicode.com/users")
                self.view?.getUsers(users: users)
            }
            catch{
                print(error)
            }
            
        }
    }
}
