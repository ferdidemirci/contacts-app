//
//  UpdatePersonInteractor.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class UpdatePersonPresenter: ViewToPresenterUpdatePersonProtocol {
    var updatePersonInteractor: PresenterToInteractorUpdatePersonProtocol?
    
    func update(personID: Int, personFirstName: String, personSecondName: String, personPhoneNumber: String) {
        updatePersonInteractor?.updatePerson(personID: personID, personFirstName: personFirstName, personSecondName: personSecondName, personPhoneNumber: personPhoneNumber)
    }
}
