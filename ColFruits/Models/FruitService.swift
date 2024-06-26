//
//  FruitList.swift
//  ColFruits
//
//  Created by Juan Sanchez on 7/05/24.
//

import SwiftUI
import Combine

class FruitList: ObservableObject {
    func fetchFruitsFromFile(fileName: String? = "Fruits", completion: @escaping ((Result<[Fruit], Error>) -> Void)) {
        if let fileURL: URL = Bundle.main.url(forResource: fileName, withExtension: ".json") {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let decoder: JSONDecoder = JSONDecoder()
                let fruits: [Fruit] = try decoder.decode([Fruit].self, from: jsonData)
                completion(.success(fruits))
            } catch {
                completion(.failure(DataLoadingError.dataNotFound))
            }
        }
    }
}
