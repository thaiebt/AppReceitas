//
//  Alert.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 16/05/22.
//

import Foundation
import UIKit
 
class Alert {
    static func showAlert(controller: UIViewController, title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alert.addAction(alertAction)
        controller.present(alert, animated: true)
    }
}
