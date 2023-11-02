//
//  CustomSegue.swift
//  Discover music
//
//  Created by ARYAN DAGA on 25/12/20.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        self.source.present(self.destination as UIViewController, animated: false, completion: nil)
        }

}
