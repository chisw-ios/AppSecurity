//
//  UICollectionView+DequeueReusableCell.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

extension UICollectionView {
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            return nil
        }
        return cell
    }
}
