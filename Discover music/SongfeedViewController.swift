//
//  SongfeedViewController.swift
//  Discover music
//
//  Created by ARYAN DAGA on 24/12/20.
//

import UIKit
import Firebase

class SongfeedViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionview: UICollectionView!
    
    
    
    
    var posts = [Post]()
    
    private var song = [songs]()
    private var songsCollection : CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsCollection = Firestore.firestore().collection("Songs")
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        songsCollection.getDocuments { (snapshot, error) in
            if let err = error{
                print("Error Fetching Docs:\(err)")
            
            } else {
                guard let snap = snapshot else{return}
                for document in snap.documents{
                    let data = document.data()
                    let fullname = data["fullname"] as? String ?? "Anonymous"
                    let songname = data["songname"] as? String ?? "Anonymous"
                    let youtubelink = data["youtubelink"] as? String ?? "Anonymous"
                    let moneyoffer = data["moneyoffer"] as? String ?? "Anonymous"
                    let instalink = data["instalink"] as? String ?? "Anonymous"
                    
                    let newsong = songs(fullname: fullname, songname: songname, moneyoffer: moneyoffer, youtubelink: youtubelink, instalink: instalink)
                
                    
                    
                    self.song.append(newsong)
                    
                
                    
                }
                self.collectionview.reloadData()
            }
        }
    }
    

    
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.song.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! postCell
        
        
        cell.artistnamelabel.text = self.song[indexPath.row].fullname
        cell.moneyofferlabel.text = self.song[indexPath.row].moneyoffer
        cell.instaUsernnamelabel.text = self.song[indexPath.row].instalink
        cell.songnamelabel.text = self.song[indexPath.row].songname
        cell.youtubelinklabel.text = self.song[indexPath.row].youtubelink
        
        
        

        
        
        return cell
    }
    
    @IBAction func HomebuttonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainHome")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
        
    }
}
