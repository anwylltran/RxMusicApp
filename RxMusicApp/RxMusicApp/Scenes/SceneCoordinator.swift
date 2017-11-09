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
    
    func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void> {
        let subject = PublicS
    }
}
