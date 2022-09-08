//
//  NewPersonProtocols.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 14.08.2022.
//

import Foundation

protocol ViewToPresenterNewPersonProtocol {
    var newPersonInteractor: PresenterToInteractorNewPersonProtocol? { get set }
    
    func insert(personFirstName:String, personSecondName: String, personPhoneNumber: String)
}

protocol PresenterToInteractorNewPersonProtocol {
    func newPerson(personFirstName:String, personSecondName: String, personPhoneNumber: String)
}

protocol PresenterToRouterNewPersonProtocol {
    static func createModule(ref: NewContactsVC)
}
