//
//  ViewController.swift
//  Coded-CollectionView-xcdoe
//
//  Created by Austin Potts on 1/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
       // MARK: - Create an Array of your Model with given values
    
    let data = [
                MegaYacht(name: "Zues", description: "This yacht was built in 2006 in Germany.", price: "10m", imageName:  #imageLiteral(resourceName: "Y3")),
                MegaYacht(name: "Hades", description: "This yacht was built in 2003 by Leo VenVo.", price: "10m", imageName:  #imageLiteral(resourceName: "Y4")),
                MegaYacht(name: "Hercules", description: "This Yacht was ordered by Mark Cuban in late 2009.", price: "10m", imageName:  #imageLiteral(resourceName: "Y6")),
                MegaYacht(name: "Ares", description: "This Yacht was owned by a Saudi Prince, who had it built in 2016.", price: "10m", imageName:  #imageLiteral(resourceName: "Y5")),
                MegaYacht(name: "Nike", description: "This Yacht was custom designed & built in Italy. 2018.", price: "10m", imageName:  #imageLiteral(resourceName: "Y1")),
                MegaYacht(name: "Kong", description: "This Yacht was built by the owner of a private zoo for Gorillas.", price: "10m", imageName:  #imageLiteral(resourceName: "Y8")),
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Set up Collection View Sub View
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
       // MARK: - Create a Private Constant to create the Collection View

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Adjust this
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
}


        // MARK: - Create an Extension of your VC to use the Collection View Delegate

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let yacht = data[indexPath.row]
        cell.data = yacht
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowYachtSegue" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
                let yachtVC = segue.destination as? YachtDetailViewController else { return }
            let selectedYacht = data[indexPath]
            yachtVC.megaYacht = selectedYacht
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowYachtSegue", sender: indexPath)
    }
    
}







        // MARK: - Create the Custom Cell Class to be used
class CustomCell: UICollectionViewCell {
    var data: MegaYacht? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Y1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
