//
//  Presenter.swift
//  InterviewL5
//
//  Created by emil kurbanov on 24.08.2022.
//

import Foundation

protocol UserPresenter: AnyObject {
    func load(user: [User])
}

typealias UserPresenterDelegate = UserPresenter & ViewController

class UserView {
    weak var delegate: UserPresenterDelegate?
    
    func getUser() {
        
    }
}
