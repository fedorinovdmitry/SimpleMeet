//
//  MyChatsListViewController.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 19.10.2020.
//  Copyright (c) 2020 Дмитрий Федоринов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MyChatsListViewController: UIViewController {

    // MARK: - Custom types
    
    // MARK: - Outlets
    
    // MARK: - Public Properties
    
    var presenter: MyChatsListPresenterProtocol!
    let configurator: MyChatsListAssemblyProtocol = MyChatsListAssembly()
    
    // MARK: - Private Properties
    
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        createAndSetupViews()
        presenter.configureView()
        
        
        
    }
    
    // MARK: - Setup Views
    
    var collectionView: UICollectionView!
    
    private func createAndSetupViews() {
        
        view.backgroundColor = UIColor.Pallete.white
        
        setupSearchBar()
        setupCollectionView()
        
    }
    
    
    // MARK: Set up SearchBar

    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = UIColor.Pallete.white
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = UIColor.Pallete.lightGreen
        searchController.searchBar.searchTextField.backgroundColor = UIColor.Pallete.gray
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    // MARK: Set up CollectionView
    
    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
    }
    
    
    
    // MARK: - Public methods
    
    // MARK: - Private methods

}

// MARK: - Extensions

// MARK: - MyChatsListViewProtocol

extension MyChatsListViewController: MyChatsListViewProtocol {
    
}

// MARK: - UISearchBarDelegate

extension MyChatsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

//extension MyChatsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//
//}


// MARK: - SwiftUI

import SwiftUI

struct MyChatsListViewViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainTabBarController
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {
            
        }
    }
}