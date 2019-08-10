//
//  DetailViewController.swift
//  CollectionView
//
//  Created by Janin Culhaoglu on 10/08/2019.
//  Copyright © 2019 Janin Culhaoglu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var number = String()
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = number
    }
}
