//
//  UnitOfMeansurementView.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import UIKit

protocol UnitOfMeansurementViewClickDelegate: AnyObject {
    func didSelectUnitOfMeansurementOption(atIndex index: Int)
}

class UnitOfMeansurementView: UIView {
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    weak var clickDelegate: UnitOfMeansurementViewClickDelegate?
    
    lazy var singleUnitOfMeansurement: [SingleUnitOfMeansurementView] = []
    var units: [String] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            containerStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateView(withUnitsOfMeansurement units: [String]) {
        containerStackView.removeAllArrangedSubviews()
        self.units = units
        units.enumerated().forEach { (index: Int, unit: String) in
            let view = SingleUnitOfMeansurementView(unit: unit)
            view.clickDelegate = self
            singleUnitOfMeansurement.append(view)
            containerStackView.addArrangedSubview(view)
            view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        }
        layoutIfNeeded()
    }
}

extension UnitOfMeansurementView: SingleUnitOfMeansurementViewClickDelegate {
    func didTap(inView: SingleUnitOfMeansurementView) {
        for view in singleUnitOfMeansurement {
            if view.isChecked {
                view.setupCheckImage(image: UIImage(systemName: "square"), tintColor: .black)
                view.isChecked = false
                break
            }
        }
        
        inView.setupCheckImage(image: UIImage(systemName: "checkmark.square.fill"), tintColor: UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0))
        inView.isChecked = true
    }
}
