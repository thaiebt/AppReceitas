//
//  IngredientsView.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 14/05/22.
//

import UIKit

class IngredientsView: UIView {
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    private lazy var singleIngredientView: [SingleIngredientView] = []

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
    
    func updateView(_ model: [IngredientViewModel]) {
        containerStackView.removeAllArrangedSubviews()
        model.enumerated().forEach { (index: Int, viewModel: IngredientViewModel) in
            let view = SingleIngredientView(withViewModel: viewModel)
            singleIngredientView.append(view)
            containerStackView.addArrangedSubview(view)
            view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        }
        layoutIfNeeded()
    }
}

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removeSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removeSubviews.flatMap({ $0.constraints }))
        removeSubviews.forEach({$0.removeFromSuperview()})
    }
}
