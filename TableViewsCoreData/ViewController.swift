//
//  ViewController.swift
//  TableViewsCoreData
//
//  Created by Rodolphe DUPUY on 26/09/2020.
//

import UIKit

var toDoList = ["Rod", "Marine", "Lucas", "Pap", "Mam", "Val", "Bab", "Camille"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Récupération des Delegates
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: Delegates de UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        //let cell = tableView.dequeueReusableCell(withIdentifier: "tvIdentifierCell", for: indexPath)
        //let cell = UITableViewCell()
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        // .default : pas de detail
        // .subtitle : en dessous
        // .value1 : coté droit
        // .value2 : juste à côté droit
        
        let toDo = toDoList[indexPath.row]
        cell.textLabel?.text = toDo
        
        cell.detailTextLabel?.text = "Détail"

        return cell
    }
    
    //MARK: Sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Famille"
    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Fin de la section"
//    }
    
    //MARK: Segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        performSegue(withIdentifier: "segueDetailTv", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailTv",
           let destination = segue.destination as? DetailTableView {
            //destination.string = "\(String(describing: sender))"
            destination.string = toDoList[sender as! Int]
        }
    }
    
}

