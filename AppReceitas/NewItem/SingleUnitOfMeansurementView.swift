//
//  SingleUnitMeansureView.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import Foundation
import UIKit

protocol SingleUnitOfMeansurementViewClickDelegate: AnyObject {
    func didTap(inView: SingleUnitOfMeansurementView)
}

class SingleUnitOfMeansurementView: UIView {
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "square")
        imageView.tintColor = .black
        return imageView
    }()

    private lazy var unitOfMeansurementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.text = "copo(s)"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    weak var clickDelegate: SingleUnitOfMeansurementViewClickDelegate?
    var isChecked: Bool = false
    
    init(unit: String) {
        super.init(frame: .zero)
        setupLayout()
        updateView(unit: unit)
        setupTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
        setupTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(checkImageView)
        stackView.addArrangedSubview(unitOfMeansurementLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            checkImageView.heightAnchor.constraint(equalToConstant: 6),
            containerView.widthAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
    }
    
    func updateView(unit: String) {
        unitOfMeansurementLabel.text = unit
    }
    
    func setupCheckImage(image: UIImage?, tintColor: UIColor) {
        checkImageView.image = image
        checkImageView.tintColor = tintColor
    }
    
    @objc private func viewTapped() {
        clickDelegate?.didTap(inView: self)
    }
}
