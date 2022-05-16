//
//  MyReceiptsViewModel.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 16/05/22.
//

import Foundation

struct MyReceiptsViewModel {
    let receiptName: String
    let level: String
    let prepareTime: String
    let ingredients: [IngredientViewModel]
    let howToPrepare: String
}

struct IngredientViewModel {
    let ingredient: String
    let unitOfMeansurement: String
    let amount: String
}

enum ReceiptLevel: String {
    case easy = "fácil"
    case medium = "médio"
    case hard = "difícil"
}
