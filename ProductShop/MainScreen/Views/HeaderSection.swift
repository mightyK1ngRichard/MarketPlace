//
//  HeaderSection.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 02.08.2023.
//

import UIKit

final class HeaderSection: UICollectionReusableView {
    
    private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel()
        label.text = "Категории"
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
