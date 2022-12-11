//
//  Router.swift
//  NewsApp
//
//  Created by Amissan on 08/12/2022.
//

import Foundation
import UIKit

protocol Router {
    func route(to routeID: String, from context: UIViewController, parameters: Any?)
}
