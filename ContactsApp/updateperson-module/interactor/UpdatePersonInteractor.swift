//
//  UpdatePersonInteractor.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class UpdatePersonInteractor: PresenterToInteractorUpdatePersonProtocol {
    
    let db: FMDatabase
    
    init () {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("person.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func updatePerson(personID: Int, personFirstName: String, personSecondName: String, personPhoneNumber: String) {
        db.open()
        
        do {
            try db.executeUpdate("UPDATE contacts SET personName = ?, personSecondName = ?, personPhone = ? WHERE personID = ?", values: [personFirstName, personSecondName, personPhoneNumber, personID])
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
}
