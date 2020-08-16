//
//  PhotosViewControllerViewModel.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/6.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import Foundation


class PhotosViewControllerViewModel {
    
    var photoCollectionViewCellViewModels: [PhotoCollectionViewCellViewModel] = []
    var cards: [Creditcard]? {
        didSet{
            cards?.sort {$0.discount > $1.discount}
            convertCardsToViewModel(cards: cards ?? [])
        }
    }
    
    // on completion outputs
    var onRequestEnd: (() -> Void)?
    
    private func convertCardsToViewModel(cards: [Creditcard]) {
        
        for card in cards {
            photoCollectionViewCellViewModels.append(PhotoCollectionViewCellViewModel(photoUrl: card.cardImageUrl,
                                                                                      photoId: card.cardName,
                                                                                      photoTitle: "\(card.discount)"))
        }
        onRequestEnd?()
    }
}
