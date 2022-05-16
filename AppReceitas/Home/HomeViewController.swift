//
//  ViewController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 27/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var centerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "app_receita")
        return imageView
    }()
    
    private lazy var backTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Black", size: 62)
        label.text = "RECEITAS"
        let attribute: [NSAttributedString.Key : Any] = [.strokeWidth: -3.0,
                                                         .strokeColor: UIColor.black,
                                                         .foregroundColor: UIColor.white,
                                                         .kern: 5]
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attribute)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Black", size: 62)
        label.text = "RECEITAS"
        let attribute: [NSAttributedString.Key : Any] = [.strokeWidth: -3.0,
                                                         .strokeColor: UIColor.black,
                                                         .foregroundColor: UIColor(red: 212/255, green: 211/255, blue: 243/255, alpha: 1.0),
                                                         .kern: 5]
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes: attribute)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var myReceiptsButtonView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 179/255, green: 225/255, blue: 240/255, alpha: 1.0)
        return view
    }()
    
    private lazy var newReceiptButtonView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var newReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NOVA RECEITA", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 205/255, alpha: 1.0)
        button.addTarget(self, action: #selector(newReceiptButtonClicked(_:)), for: .touchUpInside)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var myReceiptButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("MINHAS RECEITAS", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Black", size: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(myReceiptButtonClicked(_:)), for: .touchUpInside)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupBackgroundLayout()
        setupLogoImageView()
        setupNewReceipt()
        setupMyReceipt()
        
    }
    
    private func setupLogoImageView() {
        view.addSubview(backTitleLabel)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            backTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
            backTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            backTitleLabel.bottomAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -150),
            
            titleLabel.rightAnchor.constraint(equalTo: backTitleLabel.rightAnchor, constant: -7),
            titleLabel.bottomAnchor.constraint(equalTo: backTitleLabel.bottomAnchor, constant: -5),
            titleLabel.leftAnchor.constraint(equalTo: backTitleLabel.leftAnchor, constant: -7),
            titleLabel.topAnchor.constraint(equalTo: backTitleLabel.topAnchor, constant: -5),
        ])
    }
    
    private func setupBackgroundLayout() {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 374)
        ])
    }
    
    private func setupNewReceipt() {
        view.addSubview(newReceiptButtonView)
        view.addSubview(newReceiptButton)
        NSLayoutConstraint.activate([
            newReceiptButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newReceiptButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -112),
            newReceiptButtonView.heightAnchor.constraint(equalToConstant: 60),
            newReceiptButtonView.widthAnchor.constraint(equalToConstant: 155),
            
            newReceiptButton.heightAnchor.constraint(equalToConstant: 60),
            newReceiptButton.widthAnchor.constraint(equalToConstant: 155),
            newReceiptButton.rightAnchor.constraint(equalTo: newReceiptButtonView.rightAnchor, constant: -5),
            newReceiptButton.bottomAnchor.constraint(equalTo: newReceiptButtonView.bottomAnchor, constant: -5),
        ])
    }
    
    private func setupMyReceipt() {
        view.addSubview(myReceiptsButtonView)
        view.addSubview(myReceiptButton)
        NSLayoutConstraint.activate([
            myReceiptsButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myReceiptsButtonView.bottomAnchor.constraint(equalTo: newReceiptButtonView.topAnchor, constant: -30),
            myReceiptsButtonView.heightAnchor.constraint(equalToConstant: 60),
            myReceiptsButtonView.widthAnchor.constraint(equalToConstant: 155),
            
            myReceiptButton.heightAnchor.constraint(equalToConstant: 60),
            myReceiptButton.widthAnchor.constraint(equalToConstant: 155),
            myReceiptButton.rightAnchor.constraint(equalTo: myReceiptsButtonView.rightAnchor, constant: -5),
            myReceiptButton.bottomAnchor.constraint(equalTo: myReceiptsButtonView.bottomAnchor, constant: -5),
        ])
    }

    @objc func newReceiptButtonClicked(_ sender: UIButton) {
        let controller = NewReceiptViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func myReceiptButtonClicked(_ sender: UIButton) {
        let controller = MyReceiptsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
