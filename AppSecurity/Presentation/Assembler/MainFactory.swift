//
//  MainFactory.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import Foundation

final class MainFlowFactory {
    static func instantiateBankCardPage() -> BankCardViewController {
        let model = BankCardModel()
        let presenter = BankCardPresenter(model: model)
        let viewController = BankCardViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
