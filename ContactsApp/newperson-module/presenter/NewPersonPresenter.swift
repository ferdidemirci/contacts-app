//
//  NewPersonPresenter.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 14.08.2022.
//

import Foundation

class NewPersonPresenter: ViewToPresenterNewPersonProtocol {
    var newPersonInteractor: PresenterToInteractorNewPersonProtocol?
    
    func insert(personFirstName: String, personSecondName: String, personPhoneNumber: String) {
        newPersonInteractor?.newPerson(personFirstName: personFirstName, personSecondName: personSecondName, personPhoneNumber: personPhoneNumber)
    }
    
}
