//
//  DataBaseController.swift
//  AppReceitas
//
//  Created by Thaina da Silva Ebert on 15/05/22.
//

import Foundation

import CoreData

class DataBaseController {
    
    // MARK: - Core Data stack

    //static para ser acessível
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ReceiptData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func saveData(receipt: MyReceiptsViewModel) {
        let context = AppReceitas.DataBaseController.persistentContainer.viewContext
        
        let entity = ReceiptData(context: context)
        
        entity.receiptName = receipt.receiptName
        entity.dificultLevel = receipt.level
        entity.howToDo = receipt.howToPrepare
        entity.prepareTime = receipt.prepareTime

        if receipt.ingredients.count > 0 {
                var ingredientList: [IngredientsData] = []
                for ingredient in receipt.ingredients {
                    let ingredientsEntity = IngredientsData(context: context)
                    ingredientsEntity.ingredientName = ingredient.ingredient
                    ingredientsEntity.amount = ingredient.amount
                    ingredientsEntity.unitOfMeansurement = ingredient.unitOfMeansurement
                    ingredientList.append(ingredientsEntity)
                }
                let ingredientsData = Set(ingredientList) as NSSet
                entity.ingredients = ingredientsData
            }
        //contex fora do for pois o save context justamento serve para salvar um conjunto de informações
        DataBaseController.saveContext()
    }
    
    static func getDataFromCoreData() -> [ReceiptData] {
        var receiptData: [ReceiptData] = []
        do {
            let fetchRequest = ReceiptData.fetchRequest()
            receiptData = try DataBaseController.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Impossible get data from Core Data")
        }
        print(receiptData.count)
        return receiptData
    }
}

