//
//  BankCardPresenter.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

protocol BankCardPresenterProtocol: AnyObject {
    // MARK: - Properties
    var sections: [ListSection] { get }
    
    // MARK: - Funcs
    func onLoad()
}

class BankCardPresenter {
    // MARK: - Properties
    let model: BankCardModelProtocol
    var colorsForBackground: [UIColor]
    
    weak var view: BankCardViewControllerProtocol?
    
    // MARK: - Init
    init(model: BankCardModelProtocol) {
        self.model = model
        colorsForBackground = ColorGenerator.generateColors(numberOfColors: model.cards.count)
    }
}

// MARK: - PresenterProtocol
extension BankCardPresenter: BankCardPresenterProtocol {
    var sections: [ListSection] {
        [
            BankCardSection(items: model.cards, sectionDelegate: self)
        ]
    }
    
    func onLoad() {
        view?.addSections(sections)
    }
}

// MARK: - BankCardSectionDelegate
extension BankCardPresenter: BankCardSectionDelegate {
    func bankCardSection(_ section: BankCardSection, itemIndexChanged index: Int) {
        view?.setCardInfo(userInfo: model.cards[index])
        view?.setColorForBackgroundAndCollection(colorsForBackground[index], colorsForBackground[index+1])

    }
}
