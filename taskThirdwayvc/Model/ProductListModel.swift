//
//  ProductListModel.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import Foundation
// MARK: - WelcomeElement
struct ProductListResponse: Codable {
    let id: Int?
    let productDescription: String?
    let image: Image?
    let price: Int?
}

// Image.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let image = try? newJSONDecoder().decode(Image.self, from: jsonData)

import Foundation

// MARK: - Image
struct Image: Codable {
    let width, height: Int?
    let url: String?
}

// JSONSchemaSupport.swift

import Foundation

typealias ProductListRes = [ProductListResponse]
