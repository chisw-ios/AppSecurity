//
//  ListCollectionView.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

@objc protocol ListCollectionViewDelegate: AnyObject {
    @objc optional func listCollectionView(_ listCollectionView: ListCollectionView,
                                           didSelect item: AnyHashable,
                                           at indexPath: IndexPath)
}

class ListCollectionView: UICollectionView {
    // MARK: - Properties
    weak var listDelegate: ListCollectionViewDelegate?
    
    private(set) lazy var diffableDataSource: UICollectionViewDiffableDataSource<ListSection, AnyHashable> = {
        let dataSource = UICollectionViewDiffableDataSource<ListSection, AnyHashable>(
            collectionView: self
        ) { [weak self] (collectionView, indexPath, itemIdentifier) in
            self?
                .diffableDataSource
                .snapshot()
                .sectionIdentifiers[indexPath.section]
                .configuredCell(collectionView: collectionView, indexPath: indexPath, item: itemIdentifier)
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView, elementKind, indexPath) in
            self?
                .diffableDataSource
                .snapshot()
                .sectionIdentifiers[indexPath.section]
                .supplementaryView(collectionView: collectionView, kind: elementKind, indexPath: indexPath)
        }
        
        return dataSource
    }()
    
    private(set) lazy var layout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) in
            self?
                .diffableDataSource
                .snapshot()
                .sectionIdentifiers[sectionIndex]
                .createLayoutSection()
        }
    }()
    
    // MARK: - Init
    init(frame: CGRect = .zero) {
        super.init(frame: frame, collectionViewLayout: .init())
        setCollectionViewLayout(layout, animated: false)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCollectionViewLayout(layout, animated: false)
        delegate = self
    }
}

// MARK: - UICollectionViewDelegate
extension ListCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = diffableDataSource.snapshot().sectionIdentifiers[indexPath.section].items[indexPath.item]
        listDelegate?.listCollectionView?(self, didSelect: item, at: indexPath)
    }
}
