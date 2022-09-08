//
//  NewPersonInteractor.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 14.08.2022.
//

import Foundation

class NewPersonInteractor: PresenterToInteractorNewPersonProtocol {
    
    let db: FMDatabase
    
    init () {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("person.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func newPerson(personFirstName: String, personSecondName: String, personPhoneNumber: String) {
        db.open()
        
        do {
            try db.executeUpdate("INSERT INTO contacts (personName, personSecondName, personPhone) VALUES (?, ?, ?)", values: [personFirstName, personSecondName, personPhoneNumber])
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
}
