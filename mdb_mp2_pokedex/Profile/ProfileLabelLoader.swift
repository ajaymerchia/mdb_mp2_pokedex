//
//  ProfileLabelLoader.swift
//  mdb_mp2_pokedex
//
//  Created by Kayli  Jiang on 9/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension ProfileScreenViewController {
    func labelCreation(){
        nameLabel.text = pokemon[0]
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(12)
        nameLabel.
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        welcomeLabel.center = CGPoint(x: view.frame.width / 2 + 20, y: view.frame.height / 2 - 200)
        welcomeLabel.text = "MATCH THE MEMBERS"
        welcomeLabel.textColor = .white
        welcomeLabel.font = welcomeLabel.font.withSize(35)
        view.addSubview(welcomeLabel)
    }
    personImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 250))
    personImage.center = CGPoint(x: view.frame.width/2, y: view.frame.height/3)
    personImage.image = UIImage(named: "kaylijiang")
    personImage.contentMode = .scaleAspectFit
    view.addSubview(personImage)
}
