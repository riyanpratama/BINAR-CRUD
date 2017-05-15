//
//  DetailViewController.swift
//  BINARJson
//
//  Created by Wisnu Riyan Pratama Putra on 5/15/17.
//  Copyright © 2017 Wisnu Riyan Pratama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var titleText: UILabel!
    @IBOutlet var bodyText: UILabel!

    public var postItem: PostItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let item = self.postItem {
            self.titleText.text = item.title
            self.bodyText.text = item.body
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
