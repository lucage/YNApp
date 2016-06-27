//
//  ViewController.swift
//  YNApp
//
//  Created by Luca Genco on 21/06/16.
//  Copyright © 2016 Luca Genco. All rights reserved.
//

import UIKit

class HomeVC: UICollectionViewController {

    @IBOutlet var myColectionView: UICollectionView!
    
    private let reuseIdentifier = "HomeCell"
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 4.0, bottom: 20.0, right: 4.0)

    private var categoriesArray: [String] = ["Ready to wear","Accessories","Beauty","Lingerie"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomeVCcell

        cell.backgroundColor = UIColor.redColor()
        cell.titleLabel.text = categoriesArray[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "listSegue" {
            if let destination = segue.destinationViewController as? ListVC {
                
                let indexPath = myColectionView.indexPathForCell(sender as! UICollectionViewCell)
                
                //                let row = indexPath?.row
                let row: Int = indexPath!.row
                
                print(row)
                
                switch (row) {
                case 0:
                    destination.requestString = "http://api.yoox.biz/Search.API/1.3/STELLAMCCARTNEY_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Ready_To_Wear&format=lite&sortRule=Ranking"
                    break
                case 1:
                    destination.requestString = "http://api.yoox.biz/Search.API/1.3/STELLAMCCARTNEY_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Accessories_All&format=lite&sortRule=Ranking"
                    break
                case 2:
                    destination.requestString = "http://api.yoox.biz/Search.API/1.3/STELLAMCCARTNEY_IT/search/results.json?ave=prod&productsPerPage=50&gender=D&page=1&department=Main_Beauty&format=lite&sortRule=Ranking"
                    break
                case 3:
                    destination.requestString = "http://api.yoox.biz/Search.API/1.3/STELLAMCCARTNEY_IT/search/results.json?ave=prod&productsPerPage=50&page=1&department=Main_Lingerie&format=lite&sortRule=Ranking"
                    break
                default:
                    break
                }
                
            }
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}





