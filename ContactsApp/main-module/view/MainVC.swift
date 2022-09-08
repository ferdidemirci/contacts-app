//
//  ViewController.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 13.08.2022.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var personArray = [Persons]()
    
    var presenterObjectMain: ViewToPresenterMainProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        MainRouter.createModule(ref: self)
        copyDatabase()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenterObjectMain?.uploadContact()
    }

    func copyDatabase() {
        let bundleWay = Bundle.main.path(forResource: "person", ofType: ".sqlite")
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let placeToCopy = URL(fileURLWithPath: targetWay).appendingPathComponent("person.sqlite")
        
        if fileManager.fileExists(atPath: placeToCopy.path) {
            print("Database already exists")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleWay!, toPath: placeToCopy.path)
            } catch {
            }
        }
        
    }

}

extension MainVC: PresenterToViewMainProtocol {
    func sendToDataView(contactsList: Array<Persons>) {
        self.personArray = contactsList
        self.tableView.reloadData()
    }
    
    
}

extension MainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenterObjectMain?.search(searctText: searchText)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.contactLabel.text = "\(person.personFirstName!) \(person.personLastName!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personArray[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let person = personArray[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let alert = UIAlertController(title: "Cancel!", message: "Delete operation", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
            let yesAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                self.presenterObjectMain?.delete(personID: person.personID!)
            }
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let person = sender as? Persons
            let VCToGo = segue.destination as! UpdateContactVC
            VCToGo.person = person!
        }
    }
    
}
