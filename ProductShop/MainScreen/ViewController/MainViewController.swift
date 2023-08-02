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
        collectionView.register(AdverticingView.self, forCellWithReuseIdentifier: AdverticingView.cellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderSection.self, forSupplementaryViewOfKind: "catigoryHeaderId", withReuseIdentifier: "headerID")
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
            case .goods:
                return createCompositionalLayoutForGoods()
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
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                    heightDimension: .absolute(50)),
                  elementKind: "catigoryHeaderId",
                  alignment: .topLeading)
        ]
        return section
    }
    
    /// CompositionalLayout для рецептов блюд.
    func createCompositionalLayoutForDishes() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
    
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200)),
            subitems: [item])
        group.contentInsets = .init(top: 50, leading: 10, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    /// CompositionalLayout для товаров.
    func createCompositionalLayoutForGoods() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(300)))
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .estimated(1000)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 50, leading: 16, bottom: 0, trailing: 0)
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
        let sectionContent = viewModel[indexPath.section]
        switch sectionContent.type {
        case .adverticing:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdverticingView.cellID, for: indexPath) as? AdverticingView else { return UICollectionViewCell() }
            cell.configure(imageURL: sectionContent.items[indexPath.item].image)
            return cell
        case .products:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
        case .dishes:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
        case .goods:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "catigoryHeaderId", withReuseIdentifier: "headerID", for: indexPath)
        return header
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
