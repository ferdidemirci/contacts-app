//
//  MainProtocols.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

protocol ViewToPresenterMainProtocol {
    var mainInteractor: PresenterToInteractorMainProtocol? { get set }
    var mainView: PresenterToViewMainProtocol? { get set }
    
    func uploadContact()
    func search(searctText: String)
    func delete(personID: Int)
}

protocol PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol? { get set }
    
    func getAllContacts()
    func searchPerson(searctText: String)
    func deleteContact(personID: Int)
}

protocol InteractorToPresenterMainProtocol {
    func sendToDataPresenter(contactsList: Array<Persons>)
}

protocol PresenterToViewMainProtocol {
    func sendToDataView(contactsList: Array<Persons>)
}

protocol PresenterToRouterMainProtocol {
    static func createModule(ref: MainVC)
}
