//
//  SceneCoordinator.swift
//  RxMusicApp
//
//  Created by Dat on 11/9/17.
//  Copyright © 2017 AnwyllTran97. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType{
    
    private var window: UIWindow
    private var currentViewController: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        self.currentViewController = window.rootViewController!
    }
    
    static func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return viewController
        }
    }
    
    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType) -> Completable {
        return Completable.create(subscribe: { [weak self] completable in
            let viewController = scene.viewController()
            switch type{
            case .root:
                self?.window.rootViewController = viewController
                self?.currentViewController = SceneCoordinator.actualViewController(for: viewController)
                completable(.completed)
            case .modal:
                self?.currentViewController.present(viewController, animated: true) {
                    completable(.completed)
                }
                self?.currentViewController = SceneCoordinator.actualViewController(for: viewController)
            }
            return Disposables.create()
        })
    }
    
    @discardableResult
    func pop(animated: Bool) -> Completable {
        return Completable.create(subscribe: { [weak self] completable in
            if let presenter = self?.currentViewController.presentingViewController {
                self?.currentViewController.dismiss(animated: animated) {
                    self?.currentViewController = SceneCoordinator.actualViewController(for: presenter)
                    completable(.completed)
                }
            }else {
                fatalError("Not a modal! Can't navigate back from \(String(describing: self?.currentViewController))")
            }
            return Disposables.create()
        })
    }
}
