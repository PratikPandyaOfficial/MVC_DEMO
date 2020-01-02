//
//  WebRequester.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 26/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import Foundation
import ARKit

class WebRequester{
    
    static var shared = WebRequester()
    
    
    func fetchData(success:@escaping([PlacementData]) -> Void){
        ModelClass.GetJSONDataFromAPI(URL:url.mainUrl) { (dic, array, error) in
            
            if let data = dic {
                if (data["status"] as? String ?? "N/A") == "success"{
                    let dataDetail = data["data"] as? [Any] ?? [Any]()
                    success(dataDetail.map({PlacementData(data: $0 as! [String:Any])}))
                }
            }
        }
    }
}
    
    
