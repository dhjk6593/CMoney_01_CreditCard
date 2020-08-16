//
//  Discounts.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/16.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import Foundation


// MARK: - Discounts
struct Discounts: Decodable {
    var discounts: [Discount]
}

// MARK: - Discount
struct Discount: Decodable {
    var title: String
    var creditcards: [Creditcard]
    var explain: String?
}

// MARK: - Creditcard
struct Creditcard: Decodable {
    var cardName: String
    var cardContent: String?
    var feedbackMethod: String
    var discount: Double
    var maximumFeedback: Int?
    var cardImageUrl: String
    var limitTime: String?
}
