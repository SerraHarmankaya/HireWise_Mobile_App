//
//  Extensions.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 21.10.2024.
//

import Foundation
import UIKit
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func getRect() -> CGRect {
        
        return UIScreen.main.bounds
    }
}
