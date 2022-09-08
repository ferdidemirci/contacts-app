//
//  UpdateContactsVC.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 13.08.2022.
//

import UIKit

class UpdateContactVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var person: Persons?
    var presenterObjectUpdate: ViewToPresenterUpdatePersonProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = person {
            firstNameTextField.text = p.personFirstName
            lastNameTextField.text = p.personLastName
            phoneNumberTextField.text = p.personPhoneNumber
        }
        UpdatePersonRouter.createModule(ref: self)
    }
 
    @IBAction func updateButton(_ sender: Any) {
        if let personName = firstNameTextField.text , let personLastName = lastNameTextField.text, let personPhone = phoneNumberTextField.text, let p = person {
            presenterObjectUpdate?.update(personID: p.personID!, personFirstName: personName, personSecondName: personLastName, personPhoneNumber: personPhone)
        }
    }
    
    
    func updatePerson(personID:Int, personFirstName:String, personLastName:String) {
        
    }
}
