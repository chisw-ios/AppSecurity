//
//  UIView+Content.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

extension UIView {
    func hideContentOnScreenCapture() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
    
    func removeHideContentOnScreenCapture() {
        layer.sublayers?.removeFirst()
    }
}
