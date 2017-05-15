//
//  ListDataViewController.swift
//  BINARJson
//
//  Created by Wisnu Riyan Pratama Putra on 5/15/17.
//  Copyright © 2017 Wisnu Riyan Pratama. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListDataViewController: UITableViewController {
    var datas = [PostItem]()
    var selectedData: PostItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Do any additional setup after loading the view.
        SVProgressHUD.show()
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData() {
        NetworkAPI.instance.request(url: Constants.kUrlGetAllData, success: { (jsonResult) in
            let data = jsonResult!.arrayValue
            for item in data {
                let post = PostItem(item: item)
                self.datas.append(post)
            }
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
            
        }) { (errorStr) in
            print(errorStr!)
            let alert = UIAlertController(title: "Binar", message: errorStr, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            SVProgressHUD.dismiss()
        }
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = datas[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedData = datas[indexPath.row]
        self.performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    @IBAction func pushToAdd(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToAdd", sender: self)
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToDetail" {
            let vc = segue.destination as! DetailViewController
            vc.postItem = self.selectedData!
        }
    }

}
