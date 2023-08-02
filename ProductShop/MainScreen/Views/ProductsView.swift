//
//  ProductsView.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 02.08.2023.
//

import UIKit

class ProductsView: UICollectionViewCell {
    static let cellID = "ProductsView"
    
    private let productName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.6
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    private let productImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.borderWidth = 2
        return img
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(productName)
        addSubview(productImage)
        backgroundColor = .darkGray
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), // Изменено на trailingAnchor
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                    
            productImage.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5), // Изменено на trailingAnchor
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    func configure(product: Item) {
        productName.text = product.titel ?? "Заголовка нету"
        if let url = product.image {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data, let self = self else { return }
                DispatchQueue.main.async {
                    self.productImage.image = UIImage(data: data)
                    
                }
            }.resume()
        }
    }
}

// MARK: - Preview:

import SwiftUI
struct PreviewCell: PreviewProvider {
    /// Менять для других привью.
    typealias CurrentPreview = PreviewCell.ContainerView
    
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias PreviewContext = UIViewControllerRepresentableContext<CurrentPreview>
        
        func makeUIViewController(context: PreviewContext) -> some UIViewController {
            return UINavigationController(rootViewController: MainViewController())
        }
        
        func updateUIViewController(_ uiViewController: CurrentPreview.UIViewControllerType, context: PreviewContext) {}
    }
}
