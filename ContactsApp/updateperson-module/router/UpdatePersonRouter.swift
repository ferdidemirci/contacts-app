//
//  UpdatePersonRouter.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class UpdatePersonRouter: PresenterToRouterUpdatePersonProtocol {
    static func createModule(ref: UpdateContactVC) {
        ref.presenterObjectUpdate = UpdatePersonPresenter()
        ref.presenterObjectUpdate?.updatePersonInteractor = UpdatePersonInteractor()
    }
    
    
}
