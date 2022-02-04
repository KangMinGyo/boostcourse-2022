//
//  ViewController.swift
//  Album
//
//  Created by Kang on 2022/02/01.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellIdentifier: String = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data = Data()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        cell.albumImage.image = data.imageArray[indexPath.item]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        let nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "cell")

//         Do any additional setup after loading the view.
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10

        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        flowLayout.estimatedItemSize = CGSize(width: 210, height: 210)
        self.collectionView.collectionViewLayout = flowLayout
    }


}

