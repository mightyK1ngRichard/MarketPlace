//
//  MenuViewController.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 02.08.2023.
//

import UIKit

final class MenuViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellTab")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.backgroundColor = .blue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

// MARK: - UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTab", for: indexPath)
        return cell
    }

}

// MARK: - Preview:

import SwiftUI
struct PreviewMenuViewController: PreviewProvider {
    /// Менять для других привью.
    typealias CurrentPreview = PreviewMenuViewController.ContainerView
    
    static var previews: some View {
        ContainerView()
            .ignoresSafeArea()
            
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias PreviewContext = UIViewControllerRepresentableContext<CurrentPreview>
        
        func makeUIViewController(context: PreviewContext) -> some UIViewController {
            return MenuViewController()
        }
        
        func updateUIViewController(_ uiViewController: CurrentPreview.UIViewControllerType, context: PreviewContext) {}
    }
}
