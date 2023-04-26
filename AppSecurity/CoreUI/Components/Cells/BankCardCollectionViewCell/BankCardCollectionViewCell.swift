//
//  BankCardCollectionViewCell.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

protocol BankCardCollectionViewCellProtocol {
    var cardNumber: String { get }
    var expireDate: String { get }
    var owner: String { get }
    var bankOfCard: Bank { get }
    var typeOfCard: CardType { get }
}

class BankCardCollectionViewCell: UICollectionViewCell {
    // MARK: - Lazy properties
    private lazy var cardNumberLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray3
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var expireDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardTypeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = nil
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameOfBankLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.alpha = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var credentialsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ownerLabel, expireDateLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
        setUpConstraints()
        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
        setUpConstraints()
        setUpUI()
    }
    
    // MARK: - Public methods
    func configure(with model: some BankCardCollectionViewCellProtocol) {
        self.expireDateLabel.text = model.expireDate
        self.cardNumberLabel.text = model.cardNumber
        self.ownerLabel.text = model.owner
        nameOfBankLabel.text = model.bankOfCard.rawValue
        switch model.typeOfCard {
        case .visa:
            cardTypeLogoImageView.image = Images.visa
        case .masterCard:
            cardTypeLogoImageView.image = Images.masterCard
        }
    }
}

// MARK: - Private methods
private extension BankCardCollectionViewCell {
    func setUpUI() {
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 4.0, height: -4.0)
        contentView.layer.shadowRadius = 4.0
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.masksToBounds = false
    }
    
    func setUpSubviews() {
        contentView.addSubview(cardNumberLabel)
        contentView.addSubview(credentialsStackView)
        contentView.addSubview(cardTypeLogoImageView)
        contentView.addSubview(nameOfBankLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            cardNumberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cardNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cardNumberLabel.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 8),
            cardNumberLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8),
            
            credentialsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            credentialsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            credentialsStackView.topAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor, constant: 12),
            credentialsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            cardTypeLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardTypeLogoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardTypeLogoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            cardTypeLogoImageView.widthAnchor.constraint(equalTo: cardTypeLogoImageView.heightAnchor, multiplier: 1.4),
            
            nameOfBankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameOfBankLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ])
    }
}
