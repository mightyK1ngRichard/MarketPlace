//
//  MainViewController.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: ViewModel
    
    private var viewModel: [MainViewModel]! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: Subviews
    
    private var collectionView: UICollectionView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        setup()
        fetchData()
    }
    
    // MARK: Setup
    
    private func initCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setup() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.frame = view.bounds
    }
    
}

// MARK: - Setup CompositionalLayout.

private extension MainViewController {
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let currentSection = self.viewModel[sectionIndex]
            switch currentSection.type {
            case .adverticing:
                return createCompositionalLayoutForAdverticing()
            case .products:
                return createCompositionalLayoutForProducts()
            case .dishes:
                return createCompositionalLayoutForDishes()
            }
        }
        return layout
    }
    
    /// CompositionalLayout для рекламы.
    func createCompositionalLayoutForAdverticing() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        // item.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
        // item.contentInsets.bottom = 10
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .absolute(200)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    /// CompositionalLayout для продуктов.
    func createCompositionalLayoutForProducts() -> NSCollectionLayoutSection {
        /// estimated  - это когда мы точно не знаем, какое будет, будет сам предмет уже определять.
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1/4),
            heightDimension: .absolute(150)))
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)),
            subitems: [item])
        group.contentInsets.leading = 16
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 50, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    /// CompositionalLayout для рецептов блюд.
    func createCompositionalLayoutForDishes() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
    
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)),
            subitems: [item])
        group.contentInsets = .init(top: 50, leading: 10, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}

// MARK: Network.

private extension MainViewController {
    
    func fetchData() {
        self.viewModel = APIManager.shared.getData()
    }
    
}

// MARK: - UICollectionViewDataSource.

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
   
    
}

// MARK: - Preview:

import SwiftUI
struct PreviewMainViewController: PreviewProvider {
    /// Менять для других привью.
    typealias CurrentPreview = PreviewMainViewController.ContainerView
    
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias PreviewContext = UIViewControllerRepresentableContext<CurrentPreview>
        
        func makeUIViewController(context: PreviewContext) -> some UIViewController {
            return MainViewController()
        }
        
        func updateUIViewController(_ uiViewController: CurrentPreview.UIViewControllerType, context: PreviewContext) {}
    }
}
