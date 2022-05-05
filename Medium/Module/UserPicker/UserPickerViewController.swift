//
//  UserPickerViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit
import AudioToolbox

protocol UserPickerDisplayLogic: AnyObject {
    func updateUI(with items: [UserCollectionCellViewModel])
}

class UserPickerViewController: BaseViewController, UserPickerDisplayLogic {
    let dwgConst = DrawingConstants()
    var presenter: UserPickerPresentationLogic!
    private var shouldPlaySystemSound: Bool = true
    private var items: [UserCollectionCellViewModel] = []
    private var centeredCell: UICollectionViewCell?
    private var currentCenteredCellIndex: Int = 0
    
    private(set) lazy var titleLabel: Label = {
        let view = Label()
        view.setFont(.title)
        view.setTextColor(.primaryLabel)
        view.setTitle("Medium".uppercased(), kern: 1.3)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var descriptionLabel: Label = {
        let view = Label()
        view.setFont(.body1)
        view.setTextColor(.secondaryLabel)
        view.setTitle("Select an account", kern: 1.3)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var vStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = dwgConst.spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var collectionLayout: CenteredCollectionViewFlowLayout = {
        let layout = CenteredCollectionViewFlowLayout()
        layout.itemSize = dwgConst.itemSize
        
        return layout
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(centeredCollectionViewFlowLayout: collectionLayout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.register(UserCollectionCell.self)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var continueButton: Button = {
        let view = Button()
        view.setTitle("Continue", for: .normal)
        view.addTarget(self, action: #selector(handleContinueButtonClick), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        setupSubviews()
        presenter.viewDidLoad()
    }
    
    func updateUI(with items: [UserCollectionCellViewModel]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    @objc private func handleContinueButtonClick() {
        guard let centeredPage = collectionLayout.currentCenteredPage else {
            return
        }
        
        presenter.willOpenPosts(items[centeredPage].user)
    }
    
    // MARK: - Support
    private func updateScaleOfCell(_ cell: UICollectionViewCell?, at centerPoint: CGPoint) {
        guard let cell = cell else { return }
        let offsetX = centerPoint.x - cell.center.x
        let bound = dwgConst.itemSize.width / 2
        let progress = abs(offsetX) / bound
        let scale = 1 - (progress * (1 - dwgConst.scaleSize))
        cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        (cell as? UserCollectionCell)?.focus(value: scale)
        centeredCell = nil
    }
}

extension UserPickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(UserCollectionCell.self, for: indexPath)
        cell.configure(with: item)
        
        if currentCenteredCellIndex != indexPath.row {
            cell.transform = CGAffineTransform(scaleX: dwgConst.scaleSize, y: dwgConst.scaleSize)
            cell.focus(value: dwgConst.scaleSize)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let centeredPage = collectionLayout.currentCenteredPage, centeredPage != indexPath.row else {
            return
        }
        
        collectionLayout.scrollToPage(index: indexPath.row, animated: true)
    }
}

extension UserPickerViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        guard let centeredCellIndex = collectionLayout.currentCenteredPage else { return }
        
        currentCenteredCellIndex = centeredCellIndex
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        guard let centeredCellIndex = collectionLayout.currentCenteredPage else { return }
        
        currentCenteredCellIndex = centeredCellIndex
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        let centerPoint = CGPoint(x: (collectionView.frame.size.width / 2) + scrollView.contentOffset.x,
                                  y: (collectionView.frame.size.height / 2) + scrollView.contentOffset.y)
        
        if let indexPath = collectionView.indexPathForItem(at: centerPoint),
           let cell = collectionView.cellForItem(at: indexPath),
           centeredCell == nil
        {
            centeredCell = cell
            cell.transform = .identity
        }
        
        updateScaleOfCell(centeredCell, at: centerPoint)
    }
}

