//
//  BaseViewModel.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/29/22.
//

import Foundation
import UIKit

protocol BaseViewModelProtocol {
    associatedtype U
}

class BaseViewModel: BaseViewModelProtocol {
    typealias U = UseCase
    
    var useCase: U?
    var showError: Bool = false
    var isLoading: Bool = false
    
    init(useCase: U) {
        self.useCase = useCase
    }
    
}
