//
//  Extensions.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 15/01/24.
//

import UIKit

extension UIDevice {
    static var uniqueDeviceId: String {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        return "CI - \(deviceId)"
    }
}

