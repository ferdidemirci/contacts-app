//
//  SaveContactsVC.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 13.08.2022.
//

import UIKit

class NewContactsVC: UIViewController {

    @IBOutlet weak var firtNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var presenterObject: ViewToPresenterNewPersonProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewPersonRouter.createModule(ref: self)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let personName = firtNameTextField.text, let personLastName = secondNameTextField.text, let personPhoneNumber = phoneNumberTextField.text  {
            presenterObject?.insert(personFirstName: personName, personSecondName: personLastName, personPhoneNumber: personPhoneNumber)
        }
    
    }
}
