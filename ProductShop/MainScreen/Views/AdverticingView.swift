//
//  AdverticingView.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 02.08.2023.
//

import UIKit

final class AdverticingView: UICollectionViewCell {
    
    static let cellID = "AdverticingView"
    
    // MARK: Subviews
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    private let progress: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
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
    
    // MARK: Setup
    
    private func setup() {
        addSubview(progress)
        addSubview(imageView)
        progress.startAnimating()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        progress.center = center
    }
    
    func configure(imageURL: URL?) {
        if let url = imageURL {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else { return }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.imageView.image = UIImage(data: data)
                    progress.stopAnimating()
                }
            }.resume()
        }
    }
}
