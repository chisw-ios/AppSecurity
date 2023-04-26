//
//  ColorGenerator.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

enum ColorGenerator {
    static func generateColors(numberOfColors: Int) -> [UIColor] {
        var arrayOfColors: [UIColor] = []
        for _ in 0...numberOfColors {
            let randomColor: UIColor = .random()
            arrayOfColors.append(randomColor)
        }
        return arrayOfColors
    }
}
