//
//  NewItemViewController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 10/05/22.
//

import UIKit

protocol AddItemsDelegate: AnyObject {
    func addIngredients(_ item: IngredientViewModel)
}

class NewItemViewController: UIViewController {
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    private lazy var ingredientsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "INGREDIENTE"
        label.textColor = .black
        return label
    }()
    
    private lazy var ingredientTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "nome do ingrediente"
        textField.textColor = .systemGray2
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.delegate = self
        return textField
    }()
    
    private lazy var ingredientTextFielView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var unitOfMeansurementTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "UNIDADE DE MEDIDA"
        label.textColor = .black
        return label
    }()
    
    private lazy var amountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "QUANTIDADE"
        label.textColor = .black
        return label
    }()
    
    private lazy var amountTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "quantidade"
        textField.textColor = .systemGray2
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.delegate = self
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var amountTextFielView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var addItemContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addItemButtonView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD ITEM", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addItemButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var unitOfMeansurementView = UnitOfMeansurementView()
    private let unitsOfMeansurementList: [String] = ["unidade(s)",  "grama(s)", "xícara(s)", "copo(s)", "colher(es) de sopa", "colher(es) de chá"]
    private var item: IngredientViewModel?
    weak var addItemDelegate: AddItemsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupConstraints()
        unitOfMeansurementView.updateView(withUnitsOfMeansurement: unitsOfMeansurementList)
    }
    
    private func setupLayout() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(ingredientsTitleLabel)
        mainStackView.addArrangedSubview(ingredientTextFielView)
        ingredientTextFielView.addSubview(ingredientTextField)
        mainStackView.addArrangedSubview(unitOfMeansurementTitleLabel)
        mainStackView.addArrangedSubview(unitOfMeansurementView)
        mainStackView.addArrangedSubview(amountTitleLabel)
        mainStackView.addArrangedSubview(amountTextFielView)
        amountTextFielView.addSubview(amountTextField)
        mainStackView.addArrangedSubview(addItemContainerView)
        addItemContainerView.addSubview(addItemButtonView)
        addItemContainerView.addSubview(addItemButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -24),
            
            ingredientTextFielView.heightAnchor.constraint(equalToConstant: 40),
            
            ingredientTextField.topAnchor.constraint(equalTo: ingredientTextFielView.topAnchor),
            ingredientTextField.leftAnchor.constraint(equalTo: ingredientTextFielView.leftAnchor, constant: 8),
            ingredientTextField.rightAnchor.constraint(equalTo: ingredientTextFielView.rightAnchor, constant: -8),
            ingredientTextField.bottomAnchor.constraint(equalTo: ingredientTextFielView.bottomAnchor),
            
            amountTextFielView.heightAnchor.constraint(equalToConstant: 40),
            
            amountTextField.topAnchor.constraint(equalTo: amountTextFielView.topAnchor),
            amountTextField.leftAnchor.constraint(equalTo: amountTextFielView.leftAnchor, constant: 8),
            amountTextField.rightAnchor.constraint(equalTo: amountTextFielView.rightAnchor, constant: -8),
            amountTextField.bottomAnchor.constraint(equalTo: amountTextFielView.bottomAnchor),

            addItemButtonView.topAnchor.constraint(equalTo: addItemContainerView.topAnchor, constant: 16),
            addItemButtonView.bottomAnchor.constraint(equalTo: addItemContainerView.bottomAnchor, constant: -16),
            addItemButtonView.rightAnchor.constraint(equalTo: addItemContainerView.rightAnchor, constant: -24),
            addItemButtonView.heightAnchor.constraint(equalToConstant: 40),
            addItemButtonView.widthAnchor.constraint(equalToConstant: 86),
            
            addItemButton.heightAnchor.constraint(equalToConstant: 40),
            addItemButton.widthAnchor.constraint(equalToConstant: 86),
            addItemButton.rightAnchor.constraint(equalTo: addItemButtonView.rightAnchor, constant: -5),
            addItemButton.bottomAnchor.constraint(equalTo: addItemButtonView.bottomAnchor, constant: -5)
        ])
    }
    
    @objc func addItemButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
        var selectedUnitOfMeansurement: String?
        let singleView = unitOfMeansurementView.singleUnitOfMeansurement
        for i in 0..<singleView.count {
            if singleView[i].isChecked {
                selectedUnitOfMeansurement = unitsOfMeansurementList[i]
            }
        }
        
        item = IngredientViewModel(ingredient: ingredientTextField.text, unitOfMeansurement: selectedUnitOfMeansurement ?? "", amount: amountTextField.text)
        guard let safeItem = item else { return }
        addItemDelegate?.addIngredients(safeItem)
    }
}

extension NewItemViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
