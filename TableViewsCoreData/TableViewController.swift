//
//  TableViewController.swift
//  TableViewsCoreData
//
//  Created by Rodolphe DUPUY on 26/09/2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoList = loadToDoList()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem // Faire apparaître le bouton Edit (Navigation Controller requis !)
    }
    
    func loadToDoList() -> [String] {
        return ["Vaisselle", "Travailler le Swift", "Donner à manger aux animaux", "Tondre la pelouse", "Ménage", "Faire la cuisine"]
    }
    
    @IBAction func btnRefreshPressed(_ sender: Any) {
        toDoList = loadToDoList()   // Recharger la liste
        tableView.reloadData()      // Rafraichir la TableView
    }
    
    
    //MARK: Segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetailTvc", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailTvc",
           let destination = segue.destination as? DetailTableViewController {
            //destination.titleLabel.text = "Coucou" //toDoList[sender as! Int]
            
            destination.string = toDoList[sender as! Int]
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // Nombre d'Array à afficher
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count // Nombre de ligne à afficher
    }
    
    // Afficher la liste
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvcIdentifierCell", for: indexPath)
        
        // Configure the cell...
        print(indexPath) // Afficher la position de la Section et de la Ligne (Row)
        
        let toDo = toDoList[indexPath.row]
        cell.textLabel?.text = toDo
        
        return cell
    }
    
    // Editer la ligne choisie
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Commit - Prendre en compte les modifications
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            toDoList.remove(at: indexPath.row)  // Supprimer aussi de la table interne en premier
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Deplacer une ligne
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Dans le cas d'un déplacement on supprime la ligne pour la recréer plus loin
        toDoList.remove(at: fromIndexPath.row)
        toDoList.insert(toDoList[fromIndexPath.row], at: to.row)
        print(toDoList)
    }
    
    // Deplacer une ligne - Activer l'option
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
