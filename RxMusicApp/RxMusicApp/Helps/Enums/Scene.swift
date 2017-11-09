//
//  Scene.swift
//  RxMusicApp
//
//  Created by Dat on 11/9/17.
//  Copyright © 2017 AnwyllTran97. All rights reserved.
//

import UIKit

enum Scene{
    case onlineList(OnlineListViewModel)
}

extension Scene{
    func viewController() -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch self{
        case .onlineList (let viewModel):
            let vc = storyboard.instantiateViewController(ofType: OnlineListVC.self)
            vc.bindViewModel()
            return vc
        }
    }
}
