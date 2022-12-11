//
//  ViewState.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

enum ViewState {
    case idle
    case gettingData
    case success
    case failure(Error)
}


protocol ViewRequestsDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}
