//
//  ViewController.swift
//  MVP Architecture
//
//  Created by Shashi Gupta on 09/08/24.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var textViewInput: UITextView!
    
    var presenter:Presenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.presenter = Presenter(view: self)
        self.presenter?.fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
    }


}


extension ViewController: PresenterDelegate{
    
    func getUsers(users: [User]) {
        
        var names = ""
        for user in users{
            names += user.name + "\n\n"
        }
        
        DispatchQueue.main.async {
            self.textViewInput.text = names
        }
        
    }
}
