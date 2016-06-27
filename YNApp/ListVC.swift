//
//  ListVC.swift
//  YNApp
//
//  Created by Luca Genco on 21/06/16.
//  Copyright © 2016 Luca Genco. All rights reserved.
//

import UIKit
import Alamofire

class ListVC: UITableViewController {
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    //Test
    var requestString = String()
    
    var activityIndicator = UIActivityIndicatorView()
    
    var myDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.callAPI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) 
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
    
    
}


// MARK: - Networking Functions
extension ListVC {
    
    
    func callAPI() -> Void {
        
        let url = "http://api.yoox.biz/Search.API/1.3/STELLAMCCARTNEY_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Ready_To_Wear&format=lite&sortRule=Ranking"
        
//manage activity indicator
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success(let data):
                
                print("Success with JSON: \(data)")
                self.activityIndicator.startAnimating()

                let response = data as! NSDictionary
                
                self.myDictionary = response
                
              break
            case .Failure(let error):

                print("Request failed with error: \(error)")
            }
        }
    }
}
