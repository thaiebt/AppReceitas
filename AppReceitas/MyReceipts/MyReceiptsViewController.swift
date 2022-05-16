//
//  MyReceiptsViewController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import UIKit

class MyReceiptsViewController: UIViewController {
    
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
        label.text = "MINHAS RECEITAS"
        let attribute: [NSAttributedString.Key : Any] = [.strokeWidth: -3.5,
                                                         .strokeColor: UIColor.black,
                                                         .foregroundColor: UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0),
                                                         .kern: 2]
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attribute)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var allReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TODAS", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(allButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var easyReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FÁCEIS", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(easyButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var mediumReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("MÉDIAS", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(mediumButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var hardReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DIFÍCEIS", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(hardButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var tableTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Black", size: 15)
        label.text = "RECEITAS"
        label.textColor = .black
        return label
    }()
    
    private lazy var receiptsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(MyReceiptsTableViewCell.self, forCellReuseIdentifier: "MyReceiptsTableViewCell")
        table.separatorStyle = .none
        table.backgroundColor = .white
        return table
    }()
    
    private var myReceiptList: [MyReceiptsViewModel] = []
    private var receiptDataBase: [ReceiptData] = []
    private var filterReceipts: [MyReceiptsViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        fillArrayReceiptDataBase()
        allButtonClicked(allReceiptButton)
    }
    
    func fillArrayReceiptDataBase() {
        receiptDataBase = DataBaseController.getDataFromCoreData()
        print(receiptDataBase)
        var returnedReceipts: [MyReceiptsViewModel] = []
        
        if receiptDataBase.count > 0 {
            for receipt in receiptDataBase {
                
                if receipt.receiptName != nil {
                    var ingredients: [IngredientViewModel] = []
                    guard let ingredientsData = receipt.ingredients?.allObjects as? [IngredientsData] else { return }
                    for ingredient in ingredientsData {
                        guard let name = ingredient.ingredientName, let unit = ingredient.unitOfMeansurement, let amount = ingredient.amount else { return }
                        let newIngredient = IngredientViewModel(ingredient: name, unitOfMeansurement: unit, amount: amount)
                        ingredients.append(newIngredient)
                    }
                    
                    let receipt = MyReceiptsViewModel(receiptName: receipt.receiptName ?? "", level: receipt.dificultLevel ?? "", prepareTime: receipt.prepareTime ?? "", ingredients: ingredients, howToPrepare: receipt.howToDo ?? "")
                    
                    returnedReceipts.append(receipt)
                }
                
                self.myReceiptList = returnedReceipts
            }
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(dividerView)
        mainStackView.addArrangedSubview(tableTitleLabel)
        mainStackView.addArrangedSubview(receiptsTableView)
        buttonStackView.addArrangedSubview(allReceiptButton)
        buttonStackView.addArrangedSubview(easyReceiptButton)
        buttonStackView.addArrangedSubview(mediumReceiptButton)
        buttonStackView.addArrangedSubview(hardReceiptButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            
            allReceiptButton.heightAnchor.constraint(equalToConstant: 32),
            easyReceiptButton.heightAnchor.constraint(equalToConstant: 32),
            mediumReceiptButton.heightAnchor.constraint(equalToConstant: 32),
            hardReceiptButton.heightAnchor.constraint(equalToConstant: 32),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupButtonColor(_ sender: UIButton) {
        allReceiptButton.backgroundColor = .white
        easyReceiptButton.backgroundColor = .white
        mediumReceiptButton.backgroundColor = .white
        hardReceiptButton.backgroundColor = .white
        sender.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 205/255, alpha: 1.0)
    }
    
    @objc private func allButtonClicked(_ sender: UIButton) {
        setupButtonColor(sender)
        filterReceipts = myReceiptList
        receiptsTableView.reloadData()
    }
    
    @objc private func easyButtonClicked(_ sender: UIButton) {
        setupButtonColor(sender)
        filterReceipts = myReceiptList.filter { receipt in
            receipt.level == "fácil"
        }
        receiptsTableView.reloadData()
    }
    
    @objc private func mediumButtonClicked(_ sender: UIButton) {
        setupButtonColor(sender)
        filterReceipts = myReceiptList.filter { receipt in
            receipt.level == "médio"
        }
        receiptsTableView.reloadData()
        view.layoutIfNeeded()
    }
    
    @objc private func hardButtonClicked(_ sender: UIButton) {
        setupButtonColor(sender)
        filterReceipts = myReceiptList.filter { receipt in
            receipt.level == "difícil"
        }
        receiptsTableView.reloadData()
    }
}

extension MyReceiptsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterReceipts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyReceiptsTableViewCell", for: indexPath) as? MyReceiptsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let receipt = filterReceipts[indexPath.row]
        cell.updateView(withViewModel: receipt)
        return cell
    }
}

extension MyReceiptsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ReceiptDetailsViewController(withModel: myReceiptList[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension MyReceiptsViewController: AddNewReceiptProtocol {
    func addNewReceipt(_ receipt: MyReceiptsViewModel) {
        myReceiptList.append(receipt)
        receiptsTableView.reloadData()
    }
}
