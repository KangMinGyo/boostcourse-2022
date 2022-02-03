//
//  ViewController.swift
//  Album
//
//  Created by Kang on 2022/02/01.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
//        cell.nameLabel.text = "연필"
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10

        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        flowLayout.estimatedItemSize = CGSize(width: 90, height: 90)
        self.collectionView.collectionViewLayout = flowLayout
    }


}

