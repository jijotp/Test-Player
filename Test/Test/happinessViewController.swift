//
//  happinessViewController.swift
//  Test
//
//  Created by Jijo on 15/09/21.
//

import UIKit

class happinessViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate func registerCollectionViewCell() {
        let productsNib = UINib(nibName: "BottomCollectionViewCell", bundle: nil)
        collectionView.register(productsNib, forCellWithReuseIdentifier:
                                    "BottomCollectionViewCell")
        
        let productsNib2 = UINib(nibName: "AddCollectionViewCell", bundle: nil)
        collectionView.register(productsNib2, forCellWithReuseIdentifier:
                                    "AddCollectionViewCell")
        
        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "CollectionReusableView")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
}
extension happinessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 800
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as? BottomCollectionViewCell {
                cell.backgroundColor = .brown
                return cell
            }
            
        } else {
            
            if indexPath.row % 5 == 0 {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as? BottomCollectionViewCell {
                    cell.backgroundColor = .green
                    return cell
                }
            }
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCollectionViewCell", for: indexPath) as? AddCollectionViewCell {
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}


extension happinessViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let screeWidth = UIScreen.main.bounds.width - 16
            return CGSize(width: screeWidth, height: CGFloat(145))
        }
        if indexPath.row % 5 == 0 {
            let screeWidth = UIScreen.main.bounds.width - 16
            return CGSize(width: screeWidth, height: 50)
        }
        let width = (UIScreen.main.bounds.width / 2) - 4
        return CGSize(width: width, height: CGFloat(172))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as? CollectionReusableView {
            headerView.backgroundColor = .systemBlue
            return headerView
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        }

        return CGSize(width: 35, height: 35)
    }
}
