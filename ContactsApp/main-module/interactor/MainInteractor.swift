//
//  MainInteractor.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    let db: FMDatabase
    
    init () {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("person.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func getAllContacts() {
        var contactsList = [Persons]()
        
        db.open()
        
        do {
            let rs = try db.executeQuery("SELECT * FROM contacts", values: nil)
            
            while rs.next() {
                let person = Persons(personID: Int(rs.string(forColumn: "personID"))!,
                                     personFirstName: rs.string(forColumn: "personName")!,
                                     personLastName: rs.string(forColumn: "personSecondName")!,
                                     personPhoneNumber: rs.string(forColumn: "personPhone")!)
                contactsList.append(person)
            }
            mainPresenter?.sendToDataPresenter(contactsList: contactsList)
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
    
    func searchPerson(searctText: String) {
        var contactsList = [Persons]()
        
        db.open()
        
        do {
            let rs = try db.executeQuery("SELECT * FROM contacts WHERE personName like '%\(searctText)%'", values: nil)
            
            while rs.next() {
                let person = Persons(personID: Int(rs.string(forColumn: "personID"))!,
                                     personFirstName: rs.string(forColumn: "personName")!,
                                     personLastName: rs.string(forColumn: "personSecondName")!,
                                     personPhoneNumber: rs.string(forColumn: "personPhone")!)
                contactsList.append(person)
            }
            mainPresenter?.sendToDataPresenter(contactsList: contactsList)
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
     
    func deleteContact(personID: Int) {
        db.open()
        
        do {
            try db.executeUpdate("DELETE FROM contacts WHERE personID = ?", values: [personID])
            getAllContacts()
        } catch {
            print(error.localizedDescription)
        }
        
        db.close()
    }
    
    
}
