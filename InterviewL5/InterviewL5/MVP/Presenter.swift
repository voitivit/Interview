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
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { [weak self] data, _, _ in
            guard let self = self else { return }
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.delegate?.load(user: json)
                }
            } catch  {
                print(error)
            }
        }
        task.resume()
    }
    
    func delegateSelf(delegate: UserPresenterDelegate ){
        self.delegate = delegate
    }
}
