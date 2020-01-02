//
//  DataClassFile.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 26/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import Foundation
import UIKit

class PlacementData{
    var id :String
    var placement_title:String
    var placement_image:[PlacementImageClass]
    
    init(data:[String:Any]) {
        self.id = data["id"] as? String ?? "N/A"
        self.placement_title = data["placement_title"] as? String ?? "N/A"
        let placement_image = data["placement_image"] as? [Any] ?? [Any]()
        self.placement_image = placement_image.map({PlacementImageClass(data: $0 as! [String:Any])})
    }
}


class PlacementImageClass{
    var id:String
    var imageTitle:String
    var imagePath:String
    
    init(data:[String:Any]){
        self.id = data["id"] as? String ?? "N/A"
        self.imageTitle = data["image_title"] as? String ?? "N/A"
        self.imagePath = data["image_path"] as? String ?? "N/A"
    }
}


