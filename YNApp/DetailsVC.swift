//
//  DetailsVC.swift
//  YNApp
//
//  Created by Luca Genco on 21/06/16.
//  Copyright © 2016 Luca Genco. All rights reserved.
//

import Foundation
import UIKit


class DetailsVC: UIViewController,UIScrollViewDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var webView: UIWebView!
    
    //TEMP
    var pageViews: [UIImageView?] = []
    var immagini = ["2","3","2","3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureScroll()
        configurePageControl()
        configureWebView()
    }
    
    func configureScroll()
    {
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = 210
        
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named:immagini[0])
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named:immagini[1])
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named:immagini[2])
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named:immagini[3])
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, 210)
        self.scrollView.delegate = self
        
    }
    
    func configurePageControl() {
        self.pageControl.numberOfPages = immagini.count
        self.pageControl.currentPage = 0
    }
    
    
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
        }else if Int(currentPage) == 1{
        }else if Int(currentPage) == 2{
        }else{
        }
    }
    
    func configureWebView()
    {
        let descrizione = NSLocalizedString("Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum", comment: "")
        let url = NSString(format: "<h5><div align='justify'>%@</div></h5>", descrizione)
        webView.loadHTMLString(url as String, baseURL: nil)
    }
    
//    func shareContent()
//    {
//        // take a screenshot of the poem and set a message
//        let myPoem:UIImage = UIImage(named:immagini[0])!
//        let descrizione = NSLocalizedString(placeDescription, comment: "")
//        
//        //Start the magic
//        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [descrizione, myPoem],applicationActivities: nil)
//        activityViewController.popoverPresentationController
//        
//        //Lets show off
//        self.presentViewController(activityViewController, animated: true, completion: nil)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
