//
//  ImageViewController.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 27/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    //MARK:- Outlet
    @IBOutlet weak var ImageCollectionView: UICollectionView!
    
    //Mark:- Variable
    var imgArray:[PlacementImageClass]?
    
    //MARK:- OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ImageCollectionView.dataSource = self
        self.ImageCollectionView.delegate = self
        
    }
    

}
extension ImageViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (imgArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.lmgCollectionViewImage.DownloadImage(url: imgArray![indexPath.row].imagePath)
        cell.lblCollectionViewLable.text = imgArray![indexPath.row].imageTitle
        
        return cell
    }
    
    
}
