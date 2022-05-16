//
//  NewReceiptViewController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 02/05/22.
//

import UIKit

protocol AddNewReceiptProtocol: AnyObject {
    func addNewReceipt(_ receipt: MyReceiptsViewModel)
}

class NewReceiptViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var receiptTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var receiptTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "RECEITA"
        label.textColor = .black
        return label
    }()
    
    private lazy var receiptTextFielView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var receiptTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "nome da receita"
        textField.textColor = .systemGray2
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.delegate = self
        return textField
    }()
    
    private lazy var ingredientsLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ingredientsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "INGREDIENTES"
        label.textColor = .black
        return label
    }()
    
    private lazy var containerIngredientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ingredientsView: IngredientsView = {
        let view = IngredientsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newItemContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var newItemButtonView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var newItemButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NOVO ITEM", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0)
        button.addTarget(self, action: #selector(newItemButtonClicked(_:)), for: .touchUpInside)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private lazy var howToDoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var howToDoBackView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(red: 255/255, green: 235/255, blue: 205/255, alpha: 1.0)
        return view
    }()
    
    private lazy var howToDoFrontView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var howToDoTitleView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var howToDoTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "modo de preparo"
        textField.textColor = .systemGray2
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.delegate = self
        return textField
    }()
    
    private lazy var howToDoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "MODO DE PREPARO"
        label.textColor = .black
        return label
    }()
    
    private lazy var dificultContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dificultTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "DIFICULDADE"
        label.textColor = .black
        return label
    }()
    
    private lazy var dificultSegmentedControl: UISegmentedControl = {
        let items = ["fácil", "médio", "difícil"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.borderColor = UIColor.black.cgColor
        segmentedControl.layer.borderWidth = 1.5
        segmentedControl.selectedSegmentTintColor = UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0)
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentIndex = 0
        if let font = UIFont(name: "Roboto-Medium", size: 13) {
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : font], for: .normal)
        }
        
        return segmentedControl
    }()
    
    private lazy var addReceiptContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addReceiptButtonView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var addReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD RECEITA", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 205/255, alpha: 1.0)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addReceiptButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var prepareTimeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var prepareTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "TEMPO DE PREPARO"
        label.textColor = .black
        return label
    }()
    
    private lazy var prepareTimeView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var prepareTimeTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "tempo preparo"
        textField.textColor = .systemGray2
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.delegate = self
        return textField
    }()
    
    
    private var ingredientsList: [IngredientViewModel] = []
    private var receipt: MyReceiptsViewModel?
    weak var newReceiptDelegate: AddNewReceiptProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        ingredientsView.updateView(ingredientsList)
    }

    private func setupLayout() {
        view.backgroundColor = .white
        setupScrollLayout()
        setupStackView()
        setupReceiptTitleView()
        setupIngredientsTitleLayout()
        setupIngredientsView()
        setupNewItemButtonLayout()
        setupHowToDoLayout()
        setupDificultLayout()
        setupPrepareTimeLayout()
        setupAddReceiptButtonLayout()
    }
    
    private func setupScrollLayout() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setupReceiptTitleView() {
        stackView.addArrangedSubview(receiptTitleView)
        receiptTitleView.addSubview(receiptTitleLabel)
        receiptTitleView.addSubview(receiptTextFielView)
        receiptTextFielView.addSubview(receiptTextField)
        NSLayoutConstraint.activate([
            receiptTitleLabel.leftAnchor.constraint(equalTo: receiptTitleView.leftAnchor, constant: 24),
            receiptTitleLabel.topAnchor.constraint(equalTo: receiptTitleView.topAnchor, constant: 16),
            receiptTitleLabel.rightAnchor.constraint(equalTo: receiptTitleView.rightAnchor, constant: -24),
            
            receiptTextFielView.rightAnchor.constraint(equalTo: receiptTitleView.rightAnchor, constant: -24),
            receiptTextFielView.leadingAnchor.constraint(equalTo: receiptTitleLabel.leadingAnchor),
            receiptTextFielView.topAnchor.constraint(equalTo: receiptTitleLabel.bottomAnchor, constant: 16),
            receiptTextFielView.bottomAnchor.constraint(equalTo: receiptTitleView.bottomAnchor,constant: -16),
            receiptTextFielView.heightAnchor.constraint(equalToConstant: 40),
            
            receiptTextField.rightAnchor.constraint(equalTo: receiptTextFielView.rightAnchor, constant: -16),
            receiptTextField.leftAnchor.constraint(equalTo: receiptTextFielView.leftAnchor, constant: 16),
            receiptTextField.topAnchor.constraint(equalTo: receiptTextFielView.topAnchor),
            receiptTextField.bottomAnchor.constraint(equalTo: receiptTextFielView.bottomAnchor)
        ])
    }
    
    private func setupIngredientsTitleLayout() {
        stackView.addArrangedSubview(ingredientsLabelView)
        ingredientsLabelView.addSubview(ingredientsTitleLabel)
        NSLayoutConstraint.activate([
            ingredientsTitleLabel.leftAnchor.constraint(equalTo: ingredientsLabelView.leftAnchor, constant: 24),
            ingredientsTitleLabel.topAnchor.constraint(equalTo: ingredientsLabelView.topAnchor, constant: 16),
            ingredientsTitleLabel.rightAnchor.constraint(equalTo: ingredientsLabelView.rightAnchor, constant: -24),
            ingredientsTitleLabel.bottomAnchor.constraint(equalTo: ingredientsLabelView.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupIngredientsView() {
        stackView.addArrangedSubview(containerIngredientView)
        containerIngredientView.addSubview(ingredientsView)
        NSLayoutConstraint.activate([
            ingredientsView.topAnchor.constraint(equalTo: containerIngredientView.topAnchor, constant: 8),
            ingredientsView.leftAnchor.constraint(equalTo: containerIngredientView.leftAnchor, constant: 8),
            ingredientsView.rightAnchor.constraint(equalTo: containerIngredientView.rightAnchor, constant: -8),
            ingredientsView.bottomAnchor.constraint(equalTo: containerIngredientView.bottomAnchor, constant: -8)
        ])
    }
    
    private func setupNewItemButtonLayout() {
        stackView.addArrangedSubview(newItemContainerView)
        newItemContainerView.addSubview(newItemButtonView)
        newItemContainerView.addSubview(newItemButton)
        NSLayoutConstraint.activate([
            newItemButtonView.topAnchor.constraint(equalTo: newItemContainerView.topAnchor, constant: 16),
            newItemButtonView.bottomAnchor.constraint(equalTo: newItemContainerView.bottomAnchor, constant: -16),
            newItemButtonView.leftAnchor.constraint(equalTo: newItemContainerView.leftAnchor, constant: 24),
            newItemButtonView.heightAnchor.constraint(equalToConstant: 40),
            newItemButtonView.widthAnchor.constraint(equalToConstant: 86),
            
            newItemButton.heightAnchor.constraint(equalToConstant: 40),
            newItemButton.widthAnchor.constraint(equalToConstant: 86),
            newItemButton.rightAnchor.constraint(equalTo: newItemButtonView.rightAnchor, constant: -5),
            newItemButton.bottomAnchor.constraint(equalTo: newItemButtonView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupHowToDoLayout() {
        stackView.addArrangedSubview(howToDoContainerView)
        howToDoContainerView.addSubview(howToDoBackView)
        howToDoContainerView.addSubview(howToDoFrontView)
        howToDoFrontView.addSubview(howToDoTitleView)
        howToDoTitleView.addSubview(howToDoTitleLabel)
        howToDoFrontView.addSubview(howToDoTextField)
        NSLayoutConstraint.activate([
            howToDoBackView.leftAnchor.constraint(equalTo: howToDoContainerView.leftAnchor, constant: 37),
            howToDoBackView.rightAnchor.constraint(equalTo: howToDoContainerView.rightAnchor, constant: -32),
            howToDoBackView.topAnchor.constraint(equalTo: howToDoContainerView.topAnchor, constant: 16),
            howToDoBackView.bottomAnchor.constraint(equalTo: howToDoContainerView.bottomAnchor, constant: -16),
            howToDoBackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 221),
            
            howToDoFrontView.rightAnchor.constraint(equalTo: howToDoBackView.rightAnchor, constant: -5),
            howToDoFrontView.bottomAnchor.constraint(equalTo: howToDoBackView.bottomAnchor, constant: -5),
            howToDoFrontView.leftAnchor.constraint(equalTo: howToDoBackView.leftAnchor, constant: -5),
            howToDoFrontView.topAnchor.constraint(equalTo: howToDoBackView.topAnchor, constant: -5),
            
            howToDoTitleView.topAnchor.constraint(equalTo: howToDoFrontView.topAnchor),
            howToDoTitleView.leadingAnchor.constraint(equalTo: howToDoFrontView.leadingAnchor),
            howToDoTitleView.trailingAnchor.constraint(equalTo: howToDoFrontView.trailingAnchor),
            howToDoTitleView.heightAnchor.constraint(equalToConstant: 55),
            
            howToDoTitleLabel.centerYAnchor.constraint(equalTo: howToDoTitleView.centerYAnchor),
            howToDoTitleLabel.leftAnchor.constraint(equalTo: howToDoTitleView.leftAnchor, constant: 16),
            
            howToDoTextField.topAnchor.constraint(equalTo: howToDoTitleView.bottomAnchor),
            howToDoTextField.leadingAnchor.constraint(equalTo: howToDoFrontView.leadingAnchor, constant: 16),
            howToDoTextField.trailingAnchor.constraint(equalTo: howToDoFrontView.trailingAnchor, constant: -16),
            howToDoTextField.bottomAnchor.constraint(equalTo: howToDoFrontView.bottomAnchor),
            howToDoTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 221),
        ])
    }
    
    private func setupDificultLayout() {
        stackView.addArrangedSubview(dificultContainerView)
        dificultContainerView.addSubview(dificultTitleLabel)
        dificultContainerView.addSubview(dificultSegmentedControl)
        NSLayoutConstraint.activate([
            dificultTitleLabel.leftAnchor.constraint(equalTo: dificultContainerView.leftAnchor, constant: 24),
            dificultTitleLabel.topAnchor.constraint(equalTo: dificultContainerView.topAnchor, constant: 16),
            dificultTitleLabel.rightAnchor.constraint(equalTo: dificultContainerView.rightAnchor, constant: -24),
            
            dificultSegmentedControl.topAnchor.constraint(equalTo: dificultTitleLabel.bottomAnchor, constant: 24),
            dificultSegmentedControl.bottomAnchor.constraint(equalTo: dificultContainerView.bottomAnchor, constant: -16),
            dificultSegmentedControl.centerXAnchor.constraint(equalTo: dificultContainerView.centerXAnchor),
            dificultSegmentedControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupPrepareTimeLayout() {
        stackView.addArrangedSubview(prepareTimeContainerView)
        prepareTimeContainerView.addSubview(prepareTimeTitleLabel)
        prepareTimeContainerView.addSubview(prepareTimeView)
        prepareTimeView.addSubview(prepareTimeTextField)
        NSLayoutConstraint.activate([
            prepareTimeTitleLabel.leftAnchor.constraint(equalTo: prepareTimeContainerView.leftAnchor, constant: 24),
            prepareTimeTitleLabel.topAnchor.constraint(equalTo: prepareTimeContainerView.topAnchor, constant: 16),
            prepareTimeTitleLabel.rightAnchor.constraint(equalTo: prepareTimeContainerView.rightAnchor, constant: -24),
            
            prepareTimeView.rightAnchor.constraint(equalTo: prepareTimeContainerView.rightAnchor, constant: -24),
            prepareTimeView.leadingAnchor.constraint(equalTo: prepareTimeTitleLabel.leadingAnchor),
            prepareTimeView.topAnchor.constraint(equalTo: prepareTimeTitleLabel.bottomAnchor, constant: 16),
            prepareTimeView.bottomAnchor.constraint(equalTo: prepareTimeContainerView.bottomAnchor,constant: -16),
            prepareTimeView.heightAnchor.constraint(equalToConstant: 40),
            
            prepareTimeTextField.rightAnchor.constraint(equalTo: prepareTimeView.rightAnchor, constant: -16),
            prepareTimeTextField.leftAnchor.constraint(equalTo: prepareTimeView.leftAnchor, constant: 16),
            prepareTimeTextField.topAnchor.constraint(equalTo: prepareTimeView.topAnchor),
            prepareTimeTextField.bottomAnchor.constraint(equalTo: prepareTimeView.bottomAnchor)
        ])
    }
    
    private func setupAddReceiptButtonLayout() {
        stackView.addArrangedSubview(addReceiptContainerView)
        addReceiptContainerView.addSubview(addReceiptButtonView)
        addReceiptContainerView.addSubview(addReceiptButton)
        NSLayoutConstraint.activate([
            addReceiptButtonView.topAnchor.constraint(equalTo: addReceiptContainerView.topAnchor, constant: 16),
            addReceiptButtonView.bottomAnchor.constraint(equalTo: addReceiptContainerView.bottomAnchor, constant: -16),
            addReceiptButtonView.centerXAnchor.constraint(equalTo: addReceiptContainerView.centerXAnchor),
            addReceiptButtonView.heightAnchor.constraint(equalToConstant: 48),
            addReceiptButtonView.widthAnchor.constraint(equalToConstant: 100),
            
            addReceiptButton.heightAnchor.constraint(equalToConstant: 48),
            addReceiptButton.widthAnchor.constraint(equalToConstant: 100),
            addReceiptButton.rightAnchor.constraint(equalTo: addReceiptButtonView.rightAnchor, constant: -5),
            addReceiptButton.bottomAnchor.constraint(equalTo: addReceiptButtonView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupDificult() -> ReceiptLevel? {
        switch dificultSegmentedControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .medium
        case 2:
            return .hard
        default:
            return nil
        }
    }
    
    @objc func newItemButtonClicked(_ sender: UIButton) {
        let newItemVC = NewItemViewController()
        newItemVC.addItemDelegate = self
        self.present(newItemVC, animated: true)
    }
    
    @objc func addReceiptButtonClicked(_ sender: UIButton) {
        let dificult = setupDificult()
        
        guard let name =  receiptTextField.text,
              let level = dificult?.rawValue,
              let time = prepareTimeTextField.text,
              let howToDo = howToDoTextField.text else {
            Alert.showAlert(controller: self, title: "Atenção", message: "Preencha corretamente os campos para continuar", actionTitle: "Entendi")
            return
        }
        
        receipt = MyReceiptsViewModel(receiptName: name, level: level, prepareTime: time, ingredients: ingredientsList, howToPrepare: howToDo)
        guard let safeReceipt = receipt else { return }
        
        DataBaseController.saveData(receipt: safeReceipt)
        
        let alert = UIAlertController(title: "Sucesso!", message: "Receita cadastrada com sucesso.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

extension NewReceiptViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "modo de preparo" || textView.text == "nome da receita" || textView.text == "tempo preparo" {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

extension NewReceiptViewController: AddItemsDelegate {
    func addIngredients(_ item: IngredientViewModel) {
        self.ingredientsList.append(item)
        self.ingredientsView.updateView(ingredientsList)
        self.view.layoutIfNeeded()
    }
}
