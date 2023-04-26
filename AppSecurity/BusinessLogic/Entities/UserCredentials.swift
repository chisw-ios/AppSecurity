//
//  UserCredentials.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import Foundation

struct UserCredentials: Hashable {
    let cardNumber: String
    let expireDate: String
    let owner: String
    let bankOfCard: Bank
    let typeOfCard: CardType
}

// MARK: - BankCardCollectionViewCellProtocol
extension UserCredentials: BankCardCollectionViewCellProtocol {}
