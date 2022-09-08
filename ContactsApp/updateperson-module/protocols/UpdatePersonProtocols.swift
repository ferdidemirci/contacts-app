//
//  UpdatePersonProtocols.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

protocol ViewToPresenterUpdatePersonProtocol {
    var updatePersonInteractor: PresenterToInteractorUpdatePersonProtocol? { get set }
    
    func update(personID:Int, personFirstName:String, personSecondName: String, personPhoneNumber: String)
}

protocol PresenterToInteractorUpdatePersonProtocol {
    func updatePerson(personID:Int, personFirstName:String, personSecondName: String, personPhoneNumber: String)
}

protocol PresenterToRouterUpdatePersonProtocol {
    static func createModule(ref: UpdateContactVC)
}
