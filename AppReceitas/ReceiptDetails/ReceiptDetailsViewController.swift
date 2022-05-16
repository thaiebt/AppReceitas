//
//  receiptDetailsViewController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import UIKit

class ReceiptDetailsViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 24
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Black", size: 28)
        label.text = "NOME DA RECEITA"
        label.numberOfLines = 0
        let attribute: [NSAttributedString.Key : Any] = [.strokeWidth: -3.5,
                                                         .strokeColor: UIColor.black,
                                                         .foregroundColor: UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0),
                                                         .kern: 2]
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attribute)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
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
    
    private lazy var ingredientsView: IngredientsView = {
        let view = IngredientsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private lazy var howToDoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "MODO DE PREPARO"
        label.textColor = .black
        label.numberOfLines = 0
        return label
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
    
    private lazy var howToDoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.text = "MODO DE PREPARO"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var prepareTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "TEMPO DE PREPARO"
        label.textColor = .black
        return label
    }()
    
    private lazy var prepareTimeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var prepareTimeBackView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var prepareTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.text = "40 minutos"
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.5
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    init(withModel model: MyReceiptsViewModel) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = model.receiptName.uppercased()
        ingredientsView.updateView(model.ingredients)
        howToDoDescriptionLabel.text = model.howToPrepare
        prepareTimeLabel.text = model.prepareTime
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
    }

    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(dividerView)
        mainStackView.addArrangedSubview(ingredientsTitleLabel)
        mainStackView.addArrangedSubview(ingredientsView)
        mainStackView.addArrangedSubview(howToDoContainerView)
        howToDoContainerView.addSubview(howToDoBackView)
        howToDoContainerView.addSubview(howToDoFrontView)
        howToDoFrontView.addSubview(howToDoTitleView)
        howToDoFrontView.addSubview(howToDoDescriptionLabel)
        howToDoTitleView.addSubview(howToDoTitleLabel)
        mainStackView.addArrangedSubview(prepareTimeTitleLabel)
        mainStackView.addArrangedSubview(prepareTimeContainerView)
        prepareTimeContainerView.addSubview(prepareTimeBackView)
        prepareTimeContainerView.addSubview(prepareTimeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            mainStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 32),
            mainStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -32),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32),
            mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            howToDoBackView.leftAnchor.constraint(equalTo: howToDoContainerView.leftAnchor, constant: 5),
            howToDoBackView.rightAnchor.constraint(equalTo: howToDoContainerView.rightAnchor, constant: 5),
            howToDoBackView.topAnchor.constraint(equalTo: howToDoContainerView.topAnchor, constant: 5),
            howToDoBackView.bottomAnchor.constraint(equalTo: howToDoContainerView.bottomAnchor, constant: 5),
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
            
            howToDoDescriptionLabel.topAnchor.constraint(equalTo: howToDoTitleView.bottomAnchor),
            howToDoDescriptionLabel.leadingAnchor.constraint(equalTo: howToDoFrontView.leadingAnchor, constant: 16),
            howToDoDescriptionLabel.trailingAnchor.constraint(equalTo: howToDoFrontView.trailingAnchor, constant: -16),
            howToDoDescriptionLabel.bottomAnchor.constraint(equalTo: howToDoFrontView.bottomAnchor),
            
            prepareTimeBackView.topAnchor.constraint(equalTo: prepareTimeContainerView.topAnchor, constant: 5),
            prepareTimeBackView.bottomAnchor.constraint(equalTo: prepareTimeContainerView.bottomAnchor, constant: -5),
            prepareTimeBackView.leftAnchor.constraint(equalTo: prepareTimeContainerView.leftAnchor, constant: 5),
            prepareTimeBackView.heightAnchor.constraint(equalToConstant: 40),
            prepareTimeBackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 86),
            
            prepareTimeLabel.heightAnchor.constraint(equalToConstant: 40),
            prepareTimeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 86),
            prepareTimeLabel.rightAnchor.constraint(equalTo: prepareTimeBackView.rightAnchor, constant: -5),
            prepareTimeLabel.bottomAnchor.constraint(equalTo: prepareTimeBackView.bottomAnchor, constant: -5)
        ])
    }
}
