//
//  BankCardModel.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import Foundation

protocol BankCardModelProtocol: AnyObject {
    var cards: [UserCredentials] { get }
}

class BankCardModel: BankCardModelProtocol {
    // MARK: - Properties
    let cards = [
        UserCredentials.init(cardNumber: "9876 5434 5678 2344",
                             expireDate: "09/24",
                             owner: "Mike Old",
                             bankOfCard: .cosmos,
                             typeOfCard: .visa),
        UserCredentials.init(cardNumber: "5431 2134 5555 6348",
                             expireDate: "01/23",
                             owner: "Kirill Melington",
                             bankOfCard: .easyBank,
                             typeOfCard: .masterCard),
        UserCredentials.init(cardNumber: "2575 5832 5678 2344",
                             expireDate: "11/28",
                             owner: "Adam Link",
                             bankOfCard: .cosmos,
                             typeOfCard: .masterCard),
        UserCredentials.init(cardNumber: "0567 5322 6439 4677",
                             expireDate: "04/24",
                             owner: "Anna Miller",
                             bankOfCard: .newYorkBank,
                             typeOfCard: .visa),
        UserCredentials.init(cardNumber: "2345 3322 7889 9605",
                             expireDate: "07/25",
                             owner: "Antony Clark",
                             bankOfCard: .easyBank,
                             typeOfCard: .visa)
    ]
}
