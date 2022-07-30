//
//  BaseViewController.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    var viewModel: T?
}
