//
//  LoginViewController.swift
//  Discover music
//
//  Created by ARYAN DAGA on 17/12/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        
        email.inputAccessoryView = toolBar
        password.inputAccessoryView = toolBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        validateFileds()
    }
    
    @IBAction func createAccounttapped(_ sender: Any){
       
    }
    
    func validateFileds() {
        if email.text?.isEmpty == true {
            print("No Email Text")
            return
        }
        
        if password.text?.isEmpty == true {
            print("No Password")
            return
        }
        
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
        
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    
    
    
}
