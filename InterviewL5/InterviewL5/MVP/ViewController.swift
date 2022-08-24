//
//  ViewController.swift
//  InterviewL5
//
//  Created by emil kurbanov on 24.08.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UserPresenter {
private let identifierCell = "cell"
    var user: [User] = []
    let userView = UserView()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userView.getUser()
        userView.delegateSelf(delegate: self)
        collectionView.dataSource = self
    }
    
    func load(user: [User]) {
        DispatchQueue.main.async {
            self.user = user
            self.collectionView.reloadData()
        }
    }
    
    //MARK: CollectionViewCell
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? UserCell else { return UICollectionViewCell() }
        cell.userLabel.numberOfLines = 0
        cell.userLabel.text = user[indexPath.row].description
        return cell
    }
    


}

