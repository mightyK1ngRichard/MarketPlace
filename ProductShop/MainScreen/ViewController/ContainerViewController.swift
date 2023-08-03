//
//  ContainerViewController.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 03.08.2023.
//

import UIKit

final class ContainerViewController: UIViewController {
    
    private var menuIsOpened = false
    /// Ширина бокового меню.
    private var menuWidth: CGFloat = 300
    /// Скорость свапа по экрану для открытия бокового меню.
    private let needVelocityForOpenMenu: CGFloat = 500
    
    private let mainViewController = MainViewController()
    private let menuViewController = MenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupVC()
        /*
        let panGester = UIPanGestureRecognizer(target: self, action: #selector(didSwapGester))
        view.addGestureRecognizer(panGester)
         */
    }
    
    private func setupVC() {
        addChild(mainViewController)
        view.addSubview(mainViewController.view)
        mainViewController.didMove(toParent: self)
        
        // menuViewController.view.frame = .init(x: -menuWidth, y: 0, width: menuWidth, height: view.bounds.height)
        
        addChild(menuViewController)
        view.insertSubview(menuViewController.view, at: 0)
        menuViewController.didMove(toParent: self)
    }
    
    private func setupNavigationView() {
        title = "K1ngMarket"
        navigationController?.navigationBar.prefersLargeTitles = true
        // navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(pressedButton))
    }
    
    
}

// MARK: - UIPanGestureRecognizer
/*
private extension ContainerViewController {
    @objc func didSwapGester(gester: UIPanGestureRecognizer) {
        let translation = gester.translation(in: view)
        if gester.state == .changed {
            var x = translation.x
            if menuIsOpened {
                x += menuWidth
            }
            
            x = min(x, menuWidth)
            x = max(x, 0)
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuViewController.view.transform = transform
            view.transform = transform
            
        } else if gester.state == .ended {
            let translation = gester.translation(in: view)
            let velocity = gester.velocity(in: view)
            if menuIsOpened {
                if -velocity.x > needVelocityForOpenMenu {
                    hideMenu()
                    return
                }
                
                if abs(translation.x) < menuWidth/2 {
                    openMenu()
                } else {
                    hideMenu()
                }
            } else {
                if velocity.x > needVelocityForOpenMenu {
                    openMenu()
                    return
                }
                
                if translation.x < menuWidth/2 {
                    hideMenu()
                } else {
                    openMenu()
                }
            }
        }
    }
    
    func performAnimations(tranform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: { [weak self] in
                guard let self = self else { return }
                self.view.transform = tranform
                self.menuViewController.view.transform = tranform
            })
    }
    
    func openMenu() {
        menuIsOpened = true
        performAnimations(tranform: CGAffineTransform(translationX: menuWidth, y: 0))
    }
    
    func hideMenu() {
        menuIsOpened = false
        performAnimations(tranform: .identity)
    }
}
*/
