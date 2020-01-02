//
//  ModelClassFile.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 26/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class ModelClass {
    
    typealias array = [Any]
    typealias dictionary = [String:Any]
    typealias images = UIImage
    
    class func GetJSONDataFromAPI(URL:String, completion:@escaping (dictionary?,array?,String?) -> Void){
        
        Alamofire.request(URL).responseJSON { response in
            switch(response.result){
            case.failure(let error):
                completion(nil,nil,error.localizedDescription)
            case.success(let value):
                
                if (value as? [Any]) != nil{
                    completion(nil,value as? [Any],nil)
                }else if  (value as? [String:Any]) != nil
                {
                    completion(value as? [String:Any], nil, nil)
                }else{
                    print("Dictionary or array not found")
                }
                
            }
        }
    }
    
    class func GetJSONDataFromParameter(URL:String,Passarameters:[String:Any],completion:@escaping (dictionary?,array?,String?) -> Void)  {
        
        Alamofire.request(URL, method: HTTPMethod.post, parameters: Passarameters as Parameters).responseJSON { (response:DataResponse<Any>) in
            switch(response.result){
            case.failure(let error):
                completion(nil,nil,error.localizedDescription)
            case.success(let value):
                
                if (value as? [Any]) != nil{
                    completion(nil,value as? [Any],nil)
                }else if  (value as? [String:Any]) != nil
                {
                    completion(value as? [String:Any], nil, nil)
                }else{
                    print("Dictionary or array not found")
                }
                
            }
        }
    }
    
    class func DownloadImage(url: String, completion: @escaping (images) -> Void ){
        
        var images = UIImage()
        
        let url = URL(string: url)!
        Alamofire.request(url.absoluteString).responseImage { response in
            if response.result.value != nil {
                images  = response.result.value!
                print("img download")
                completion(images)
            }
        }
    }
    
}


extension UIImageView{
    func DownloadImage(url:String){
        request(url).responseImage { (result) in
            switch(result.result){
                
            case .success(let value):
                self.image = value
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
