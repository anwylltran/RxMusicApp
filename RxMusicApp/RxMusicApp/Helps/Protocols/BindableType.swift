//
//  BindableType.swift
//  RxMusicApp
//
//  Created by Dat on 11/9/17.
//  Copyright © 2017 AnwyllTran97. All rights reserved.
//

import UIKit

protocol BindableType{
    associatedtype ViewModelType
    
    var viewModel:ViewModelType! { get set }
    func bindViewModel()
    
}

extension BindableType where Self:UIViewController{
    mutating func bindViewModel(to model: Self.ViewModelType){
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}


