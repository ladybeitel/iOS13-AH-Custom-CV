//
//  YachtDetailViewController.swift
//  Coded-CollectionView-xcdoe
//
//  Created by Ciara Beitel on 1/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class YachtDetailViewController: UIViewController {
    
    @IBOutlet weak var yachtName: UILabel!
    @IBOutlet weak var yachtImage: UIImageView!
    @IBOutlet weak var detailsView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var megaYacht: MegaYacht? 

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let megaYacht = megaYacht else { return }
        yachtName.text = megaYacht.name
        yachtImage.image = megaYacht.image
        detailsView.text = megaYacht.descrption
        priceLabel.text = megaYacht.price
    }

}
