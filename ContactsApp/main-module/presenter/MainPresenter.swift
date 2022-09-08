//
//  MainInteractor.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {
    var mainInteractor: PresenterToInteractorMainProtocol?
    
    var mainView: PresenterToViewMainProtocol?
    
    func uploadContact() {
        mainInteractor?.getAllContacts()
    }
    
    func search(searctText: String) {
        mainInteractor?.searchPerson(searctText: searctText)
    }
    
    func delete(personID: Int) {
        mainInteractor?.deleteContact(personID: personID)
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func sendToDataPresenter(contactsList: Array<Persons>) {
        mainView?.sendToDataView(contactsList: contactsList)
    }
}
