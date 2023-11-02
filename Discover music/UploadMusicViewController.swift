//
//  UploadMusicViewController.swift
//  Discover music
//
//  Created by ARYAN DAGA on 22/12/20.
//

import UIKit
import Firebase

class UploadMusicViewController: UIViewController {
    
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var songname: UITextField!
    @IBOutlet weak var youtubelink: UITextField!
    @IBOutlet weak var moneyoffer: UITextField!
    @IBOutlet weak var instalink: UITextField!
    
    
    var docRef : DocumentReference!
  
    @IBAction func uploadbuttonTapped(_ sender: Any) {
        
        guard let fullname = fullname.text, !fullname.isEmpty else {return}
        guard let songname = songname.text, !songname.isEmpty else {return}
        guard let youtubelink = youtubelink.text, !youtubelink.isEmpty else {return}
        guard let moneyoffer = moneyoffer.text, !moneyoffer.isEmpty else {return}
        guard let instalink = instalink.text, !instalink.isEmpty else {return}
        Firestore.firestore().collection("Songs").addDocument(data: ["fullname" : fullname, "songname" : songname, "youtubelink" : youtubelink, "moneyoffer" : moneyoffer, "instalink" : instalink]) { (error) in
            if let error = error {
                print("Oh no! Got an error: \(error.localizedDescription)")
            } else {
                print("Uploading")
            }
            
        }
        
        
        
    }
    
    @IBAction func uploadTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "songFeed")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        fullname.inputAccessoryView = toolBar
        songname.inputAccessoryView = toolBar
        youtubelink.inputAccessoryView = toolBar
        moneyoffer.inputAccessoryView = toolBar
        instalink.inputAccessoryView = toolBar
        
        
    }
    
    
    @IBAction func cancelbuttonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainHome")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
        
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    
}
