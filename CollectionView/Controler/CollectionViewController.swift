//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Janin Culhaoglu on 10/08/2019.
//  Copyright © 2019 Janin Culhaoglu. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var array = ["1", "2", "3", "4", "5", "6", "7"]
    var currentNumber = String()
    let segueIdentifierName = "segueToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifierName {
            if let destination = segue.destination as? DetailViewController {
                destination.number = currentNumber
            }
        }
    }
}

extension CollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }

        cell.label.text = array[indexPath.row]

        return cell
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (view.frame.width - 50) / 2
        return CGSize(width: side, height: side)
    }
}

extension CollectionViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentNumber = array[indexPath.row]
        performSegue(withIdentifier: segueIdentifierName, sender: self)
    }
}
