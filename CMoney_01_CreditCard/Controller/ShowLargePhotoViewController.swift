//
//  ShowLargePhotoViewController.swift
//  CMoney_01_CreditCard
//
//  Created by 張彩虹 on 2020/8/9.
//  Copyright © 2020年 張彩虹. All rights reserved.
//

import UIKit

class ShowLargePhotoViewController: UIViewController {
    
    var card: Creditcard?
    let viewModel = ShowLargePhotoViewControllerViewModel()
    
    let largePhotoImageV :UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var feedBackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var cardUrlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    func bindViewModel() {
        viewModel.onRequestEnd = {[weak self] card in
            let feedBackMax = ((card?.maximumFeedback) != nil) ? "回饋上限\(card!.maximumFeedback ?? 0)元" : "無上限"
            self?.cardTitleLabel.text = "卡片: \(card?.cardName ?? "")"
            self?.contentLabel.text = "介紹: \(card?.cardContent ?? "")"
            self?.feedBackLabel.text = "回饋方式: \(card?.feedbackMethod ?? "現金"), \(feedBackMax)"
            self?.discountLabel.text = "回饋數: \(card?.discount ?? 0.0) %"
            
        }
        
        viewModel.onImageDownloaded = { [weak self] image in
            DispatchQueue.main.async {
                self?.largePhotoImageV.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(largePhotoImageV)
        self.view.addSubview(cardTitleLabel)
        self.view.addSubview(contentLabel)
        self.view.addSubview(feedBackLabel)
        self.view.addSubview(discountLabel)
        self.view.addSubview(cardUrlLabel)
        
        largePhotoImageV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        largePhotoImageV.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        largePhotoImageV.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        largePhotoImageV.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.63).isActive = true
        
        cardTitleLabel.topAnchor.constraint(equalTo: self.largePhotoImageV.bottomAnchor, constant: 20).isActive = true
        cardTitleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        cardTitleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: self.cardTitleLabel.bottomAnchor, constant: 20).isActive = true
        contentLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        feedBackLabel.topAnchor.constraint(equalTo: self.contentLabel.bottomAnchor, constant: 20).isActive = true
        feedBackLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        feedBackLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        discountLabel.topAnchor.constraint(equalTo: self.feedBackLabel.bottomAnchor, constant: 20).isActive = true
        discountLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        discountLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        cardUrlLabel.topAnchor.constraint(equalTo: self.discountLabel.bottomAnchor, constant: 20).isActive = true
        cardUrlLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        cardUrlLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5).isActive = true
        
        self.bindViewModel()
        viewModel.card = self.card
    }
}
