//
//  MyReceiptsTableViewCell.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import UIKit

class MyReceiptsTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var roundBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 179/255, green: 225/255, blue: 240/255, alpha: 1.0)
        return view
    }()
    
    private lazy var roundFrontView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var receiptNameContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var receiptNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Black", size: 16)
        label.text = "NOME DA RECEITA"
        return label
    }()
    
    private lazy var prepareContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var prepareTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Medium", size: 13)
        label.text = "tempo de preparo: "
        return label
    }()
    
    private lazy var prepareTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Medium", size: 13)
        label.text = "40 minutos"
        label.textColor = .gray
        return label
    }()
    
    private lazy var levelContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var levelTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Medium", size: 13)
        label.text = "nível: "
        return label
    }()
    
    private lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont( name: "Roboto-Medium", size: 13)
        label.text = "fácil"
        label.textColor = .gray
        return label
    }()
    
    private lazy var arrowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(roundBackView)
        containerView.addSubview(roundFrontView)
        roundFrontView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(arrowContainerView)
        arrowContainerView.addSubview(arrowImageView)
        verticalStackView.addArrangedSubview(receiptNameContainerView)
        verticalStackView.addArrangedSubview(prepareContainerView)
        verticalStackView.addArrangedSubview(levelContainerView)
        receiptNameContainerView.addSubview(receiptNameLabel)
        prepareContainerView.addSubview(prepareTimeTitleLabel)
        prepareContainerView.addSubview(prepareTime)
        levelContainerView.addSubview(levelTitleLabel)
        levelContainerView.addSubview(levelLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            roundBackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            roundBackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5),
            roundBackView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            roundBackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            roundFrontView.rightAnchor.constraint(equalTo: roundBackView.rightAnchor, constant: -5),
            roundFrontView.bottomAnchor.constraint(equalTo: roundBackView.bottomAnchor, constant: -5),
            roundFrontView.leftAnchor.constraint(equalTo: roundBackView.leftAnchor, constant: -5),
            roundFrontView.topAnchor.constraint(equalTo: roundBackView.topAnchor, constant: -5),
            
            horizontalStackView.topAnchor.constraint(equalTo: roundFrontView.topAnchor, constant: 8),
            horizontalStackView.leftAnchor.constraint(equalTo: roundFrontView.leftAnchor, constant: 8),
            horizontalStackView.rightAnchor.constraint(equalTo: roundFrontView.rightAnchor, constant: -8),
            horizontalStackView.bottomAnchor.constraint(equalTo: roundFrontView.bottomAnchor, constant: -8),
            
            arrowImageView.rightAnchor.constraint(equalTo: arrowContainerView.rightAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: arrowContainerView.centerYAnchor),
            
            receiptNameLabel.topAnchor.constraint(equalTo: receiptNameContainerView.topAnchor, constant: 8),
            receiptNameLabel.leftAnchor.constraint(equalTo: receiptNameContainerView.leftAnchor, constant: 8),
            receiptNameLabel.rightAnchor.constraint(equalTo: receiptNameContainerView.rightAnchor),
            receiptNameLabel.bottomAnchor.constraint(equalTo: receiptNameContainerView.bottomAnchor, constant: -8),
            
            prepareTimeTitleLabel.topAnchor.constraint(equalTo: prepareContainerView.topAnchor),
            prepareTimeTitleLabel.leftAnchor.constraint(equalTo: prepareContainerView.leftAnchor, constant: 8),
            prepareTimeTitleLabel.bottomAnchor.constraint(equalTo: prepareContainerView.bottomAnchor),
            
            prepareTime.centerYAnchor.constraint(equalTo: prepareTimeTitleLabel.centerYAnchor),
            prepareTime.leftAnchor.constraint(equalTo: prepareTimeTitleLabel.rightAnchor,constant: 2),
            prepareTime.rightAnchor.constraint(equalTo: prepareContainerView.rightAnchor, constant: -8),
            
            levelTitleLabel.topAnchor.constraint(equalTo: levelContainerView.topAnchor),
            levelTitleLabel.leftAnchor.constraint(equalTo: levelContainerView.leftAnchor, constant: 8),
            levelTitleLabel.bottomAnchor.constraint(equalTo: levelContainerView.bottomAnchor),
            
            levelLabel.centerYAnchor.constraint(equalTo: levelTitleLabel.centerYAnchor),
            levelLabel.leftAnchor.constraint(equalTo: levelTitleLabel.rightAnchor,constant: 2),
            levelLabel.rightAnchor.constraint(equalTo: levelContainerView.rightAnchor, constant: -8),
        ])
    }
    
    func updateView(withViewModel model: MyReceiptsViewModel) {
        receiptNameLabel.text = model.receiptName
        prepareTime.text = model.prepareTime
        levelLabel.text = model.level
    }
}
