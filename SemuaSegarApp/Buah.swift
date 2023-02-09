//
//  Buah.swift
//  SemuaSegarApp
//
//  Created by prk on 08/02/23.
//

import Foundation

public struct Buah: Decodable {
    let genus: String
    let name: String
    let id: Int
    let family: String
    let order: String
    let nutritions: Nutritions
}

public struct Nutritions: Decodable {
    let carbohydrates: Float
    let protein: Float
    let fat: Float
    let calories: Float
    let sugar :Float
}
