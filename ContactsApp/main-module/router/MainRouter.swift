//
//  MainRouter.swift
//  ContactsApp
//
//  Created by Ferdi DEMİRCİ on 15.08.2022.
//

import Foundation

class MainRouter: PresenterToRouterMainProtocol {
    static func createModule(ref: MainVC) {
        let presenter = MainPresenter()
        
        ref.presenterObjectMain = presenter
        ref.presenterObjectMain?.mainInteractor = MainInteractor()
        ref.presenterObjectMain?.mainView = ref
        ref.presenterObjectMain?.mainInteractor?.mainPresenter = presenter
    
    }
}
 
