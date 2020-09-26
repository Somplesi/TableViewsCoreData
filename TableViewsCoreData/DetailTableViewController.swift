//
//  DetailTableViewController.swift
//  TableViewsCoreData
//
//  Created by Rodolphe DUPUY on 26/09/2020.
//

import UIKit

class DetailTableViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var string: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = string

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
