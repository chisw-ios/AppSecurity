//
//  BankCardSection.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

protocol BankCardSectionDelegate: AnyObject {
    func bankCardSection(_ section: BankCardSection, itemIndexChanged index: Int)
}

class BankCardSection: ListSection {
    // MARK: - Properties
    weak var sectionDelegate: BankCardSectionDelegate?
    
    // MARK: - Init
    init(items: [AnyHashable], sectionDelegate: BankCardSectionDelegate? = nil) {
        self.sectionDelegate = sectionDelegate
        super.init(items: items)
    }
    
    // MARK: - Override methods
    override func setup(for collectionView: UICollectionView) {
        collectionView.register(BankCardCollectionViewCell.self)
    }
    
    override func createLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .fractionalWidth(0.45))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.edgeSpacing = .init(leading: nil, top: .fixed(20), trailing: nil, bottom: nil)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 10
        
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, scrollOffset, layoutEnvironment) in
            guard let self = self else { return }
            let offset = round(scrollOffset.x / layoutEnvironment.container.contentSize.width + 0.3)
            self.sectionDelegate?.bankCardSection(self, itemIndexChanged: Int(offset))
        }
        return section
    }
    
    override func configuredCell(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        item: AnyHashable
    ) -> UICollectionViewCell? {
        let cell: BankCardCollectionViewCell? = collectionView.dequeueReusableCell(for: indexPath)
        
        if let model = item as? BankCardCollectionViewCellProtocol {
            cell?.configure(with: model)
        }
        
        return cell
    }
}
