//
//  Theme.swift
//  WeatherApp
//
//  Created by Vivek Shrivastava on 15/07/24.
//

import Foundation
import SwiftUI

enum TimeStatus {
    case day
    case night
}
struct Theme {
    static var status: TimeStatus = .day
    static let backgroundGradientTop : Color = status == .day ? Color("lightBlue") : Color("slateGray")
    static let backgroundGradientBottom : Color = status == .day ? .white : Color("platinum")
}

