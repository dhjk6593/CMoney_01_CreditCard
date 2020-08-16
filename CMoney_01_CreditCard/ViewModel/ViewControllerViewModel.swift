//
//  ViewControllerViewModel.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class ViewControllerViewModel {
    
    var cards: Discounts = Discounts(discounts: [])
    var onRequestEnd: ((Discounts?) -> Void)?
    
    
    func getCreditCardData(){
        cards = NetworkManager().loadJson(fileName: "card") ?? Discounts(discounts: [])
        onRequestEnd?(cards)
    }

}
