//
//  ProductListModel.swift
//  taskThirdwayvc
//
//  Created by Abdel-rahman Fahmi on 11/06/2022.
//

import Foundation
// MARK: - ProductListResponse
struct ProductListResponse: Codable {
    let id: Int?
    let productDescription: String?
    let image: Image?
    let price: Int?
}

// MARK: - Image
struct Image: Codable {
    let width, height: Int?
    let url: String?
}

typealias ProductListRes = [ProductListResponse]
