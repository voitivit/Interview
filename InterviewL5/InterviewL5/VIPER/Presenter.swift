//
//  Presenter.swift
//  InterviewL5
//
//  Created by emil kurbanov on 29.08.2022.
//

import Foundation
enum ErrorFetch: Error {
    case failure
}
protocol AnyPresenter {
    var view: AnyView? { get set }
    var interactor: AnyInteractor? { get set }
    var router: AnyRouter? { get set }
    
    func getUserFetch(with users: Result<[User], Error>)
}
class UserPresenter: AnyPresenter {
    var interactor: AnyInteractor? {
        didSet {
            interactor?.get()
        }
    }
    
    var router: AnyRouter?
    
    var view: AnyView?
    
    func getUserFetch(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.upLoad(with: users)
        case .failure:
            view?.upLoad(with: "Что-то пошло не так (ツ)")
        }
    }
    
    
}
