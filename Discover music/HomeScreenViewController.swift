//
//  HomeScreenViewController.swift
//  Discover music
//
//  Created by ARYAN DAGA on 22/12/20.
//

import UIKit
import Firebase

class HomeScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addbuttonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "uploadMusic")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
        
        
    }
    
    
    
    
    
    
    @IBAction func signoutButtonTapped(_ sender: Any) {
        
        let auth = Auth.auth()
        
        do{
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUsersignedin")
            self.dismiss(animated: true, completion: nil)
        } catch let signoutError as Error {
            
        }
    }
    
    
    
}
