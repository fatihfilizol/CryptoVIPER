//
//  Presenter.swift
//  CryptoVIPER
//
//  Created by Fatih Filizol on 25.09.2022.
//

import Foundation


// Class, Protocol
// Talks to View, Interactor, Router


enum NetworkError : Error {
    case NetworkFailed
    case ParseFailed
}

protocol AnyPresenter {
    
    var  view : AnyView? {get set}
    
    var interactor :AnyInteractor? {get set}
    
    var router : AnyRouter? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
    
}

class CryptoPresenter : AnyPresenter {
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet{
            interactor?.downloadCryptos()
        }
    }
    
    var router: AnyRouter?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result{
            
        case .success(let cryptos):
            view?.update(widt: cryptos)
        case .failure( _):
            view?.update(width: "Error")
            
        }
    }
    
    
    
    
}
