//
//  NewPersonRouter.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 14.08.2022.
//

import Foundation

class NewPersonRouter: PresenterToRouterNewPersonProtocol {
    static func createModule(ref: NewContactsVC) {
        ref.presenterObject = NewPersonPresenter()
        ref.presenterObject?.newPersonInteractor = NewPersonInteractor()
    }
    
    
}
