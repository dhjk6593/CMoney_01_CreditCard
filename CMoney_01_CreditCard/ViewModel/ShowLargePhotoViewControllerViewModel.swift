//
//  ShowLargePhotoViewControllerViewModel.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/9.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit


class ShowLargePhotoViewControllerViewModel {
    
    var card: Creditcard? {
        didSet{
            onRequestEnd?(card)
            self.getImage()
        }
    }
    
    // on completion outputs
    var onRequestEnd: ((Creditcard?) -> Void)?
    var onImageDownloaded: ((UIImage?) -> Void)?
    
    func getImage() {
        NetworkManager().downloadImage(url: card?.cardImageUrl ?? "") { (data) in
            self.onImageDownloaded?(UIImage(data: data))
        }
    }
}
