//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by geonhui Yu on 2022/05/29.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    let message: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.estimatedItemSize = .zero
        }
        
        pageControll.numberOfPages = message.count
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return message.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            
            return UICollectionViewCell()
        }
    
        let message = message[indexPath.item]
        cell.configure(message)
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControll.currentPage = index
    }
}
