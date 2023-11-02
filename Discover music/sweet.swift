//
//  sweet.swift
//  Discover music
//
//  Created by ARYAN DAGA on 24/12/20.
//

import Foundation
import Firebase

protocol DocumentSerializable {
    
    init?(dictionary:[String: Any])
    
}


struct songs {
    var fullname : String
    var songname : String
    var moneyoffer: String
    var youtubelink: String
    var instalink : String
    
    var dictionary: [String:Any]{
        return [
        "fullname" : fullname,
        "songname" : songname,
        "moneyoffer": moneyoffer,
        "youtubelink": youtubelink,
        "instalink": instalink
        ]
    }
}

extension songs : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let fullname = dictionary["fullname"] as? String,
              let songname = dictionary["songname"] as? String,
              let moneyoffer = dictionary["moneyoffer"] as? String,
              let youtubelink = dictionary["youtubelink"] as? String,
              let instalink = dictionary["instalink"] as? String else{ return nil}
        
        self.init(fullname: fullname, songname: songname, moneyoffer: moneyoffer, youtubelink: youtubelink, instalink: instalink)
  
    
    
    }
}
        
    
            
    
    


