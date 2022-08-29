//
//  Interactor.swift
//  InterviewL5
//
//  Created by emil kurbanov on 29.08.2022.
//

import Foundation
//https://jsonplaceholder.typicode.com/users
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func get()
}
class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func get() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return } 
            guard let data = data, error == nil else {
                self.presenter?.getUserFetch(with: .failure(ErrorFetch.failure))
                return
            }
            do {
                let json = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.getUserFetch(with: .success(json))
            } catch  {
                self.presenter?.getUserFetch(with: .failure(error))
            }
        }
        task.resume()
    }
}
