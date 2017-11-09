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
    func transition(to scene:Scene, type:SceneTransitionType) -> Observable<Void>
    
    @discardableResult
    func pop(animate:Bool) -> Observable<Void>
}

extension SceneCoordinatorType{
    @discardableResult
    func pop() -> Observable<Void>{
        return self.pop(animate: true)
    }
}
