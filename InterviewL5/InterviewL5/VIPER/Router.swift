//
//  Router.swift
//  InterviewL5
//
//  Created by emil kurbanov on 29.08.2022.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class Router: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = Router()
        
        var view: AnyView = UserViewController()
        var interactor: AnyInteractor = UserInteractor()
        var presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        return router
    }
}
