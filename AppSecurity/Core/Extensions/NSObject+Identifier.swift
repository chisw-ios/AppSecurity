//
//  NSObject+Identifier.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import Foundation

extension NSObject {
    static var identifier: String { "\(String(describing: Self.self))ID" }
}
