//
//  SceneCoordinatorType.swift
//  RxMusicApp
//
//  Created by Dat on 11/9/17.
//  Copyright © 2017 AnwyllTran97. All rights reserved.
//

import UIKit
import RxSwift

protocol SceneCoordinatorType{
    init(window:UIWindow)
    
    @discardableResult
    func transition(to scene:Scene, type:SceneTransitionType) -> Completable
    
    @discardableResult
    func pop(animated:Bool) -> Completable
}

extension SceneCoordinatorType{
    @discardableResult
    func pop() -> Completable{
        return self.pop(animated: true)
    }
}
