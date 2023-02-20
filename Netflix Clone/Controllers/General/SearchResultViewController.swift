//
//  SearchResultViewController.swift
//  Netflix Clone
//
//  Created by Muayad El-haddad on 13/02/2023.
//

// MARK: all of that form EPOSPDE 10
import UIKit

class SearchResultViewController: UIViewController {

    public var titles : [Title] = [Title]()
    
    public  let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10 , height: 200)
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.reuseID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setup()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }
}

extension SearchResultViewController{
    private func setup(){
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
        
        view.addSubview(searchResultCollectionView)
    }
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.reuseID, for: indexPath) as? TitleCollectionViewCell else{return UICollectionViewCell()}
        
        cell.configure(with: titles[indexPath.row].poster_path ?? "/xHlb7Vb7v50zWKLi8VihhIOHQEr.jpg ")
        return cell
    }
    
    
}
