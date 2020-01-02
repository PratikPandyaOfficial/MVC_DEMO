//
//  ViewController.swift
//  WTD_Demo
//
//  Created by Shivam Pandya on 26/09/18.
//  Copyright © 2018 Shivam Pandya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- Outlet
    @IBOutlet weak var mainTableView: UITableView!
    
    //MARK:- Variable
    var classData = [PlacementData]()

    //MARK:- OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        WebRequester.shared.fetchData(success: { (data) in
                self.classData = data
                self.mainTableView.reloadData()
                self.mainTableView.tableFooterView = UIView()
        })
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! mainTableViewCell

        cell.lblDataId.text = classData[indexPath.row].id
        cell.lblDataTitle.text = classData[indexPath.row].placement_title

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        
        VC.imgArray = classData[indexPath.row].placement_image
        
        self.navigationController?.pushViewController(VC, animated: true)
    }

}

