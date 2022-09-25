//
//  Router.swift
//  CryptoVIPER
//
//  Created by Fatih Filizol on 25.09.2022.
//

import Foundation
import UIKit


// Class, Protocol
//EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry : EntryPoint? {get}
    
    static func startExecution () -> AnyRouter

    
}


class CryptoRouter : AnyRouter {
    
    var entry: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoView()
        var interactor : AnyInteractor = CryptoInteractor()
        var presenter : AnyPresenter = CryptoPresenter()
        
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        
        router.entry = view as? EntryPoint
        
        
        return router
        
    }
    
    
        
}
