//
//  UICollectionView+Register.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

extension UICollectionView {
    final func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}
