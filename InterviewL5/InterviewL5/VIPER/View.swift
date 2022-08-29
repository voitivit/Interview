//
//  View.swift
//  InterviewL5
//
//  Created by emil kurbanov on 29.08.2022.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    func upLoad(with users: [User])
    func upLoad(with error: String)
}

class UserViewController: UIViewController,AnyView,  {
    var presenter: AnyPresenter?
    
    func upLoad(with users: [User]) {
        <#code#>
    }
    
    func upLoad(with error: String) {
        <#code#>
    }
    
    
}
