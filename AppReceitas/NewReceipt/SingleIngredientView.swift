//
//  SingleIngredientView.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 14/05/22.
//

import UIKit

protocol SingleIngredientViewClickDelegate: AnyObject {
    func didTap(inView: SingleIngredientView)
}

class SingleIngredientView: UIView {
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
    
    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 6, height: 6))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")
        imageView.tintColor = .black
        imageView.isHidden = true
        return imageView
    }()

    private lazy var ingredientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.text = "2 copos de farinha de trigo"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    weak var clickDelegate: SingleIngredientViewClickDelegate?
    
    init(withViewModel model: IngredientViewModel) {
        super.init(frame: .zero)
        setupLayout()
        updateView(model)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        self.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(circleImageView)
        stackView.addArrangedSubview(ingredientLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            circleImageView.heightAnchor.constraint(equalToConstant: 6),
            containerView.widthAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    func updateView(_ viewModel: IngredientViewModel) {
        ingredientLabel.text = "\(viewModel.amount) \(viewModel.unitOfMeansurement) de \(viewModel.ingredient.lowercased())"
    }
}
