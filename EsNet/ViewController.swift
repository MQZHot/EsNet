//
//  ViewController.swift
//  EsNet
//
//  Created by mengqingzheng on 2017/6/5.
//  Copyright © 2017年 es. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher
class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picProvider.requestJson(.getPic(type: "20"), isCache: true)
            .mapArray(type: AdModel.self)
            .subscribe( onNext: { (modelArr) in
                
                if modelArr.count != 0 {
                    let model = modelArr.first
                    let url = model?.url ?? ""
                    self.imgView.kf.setImage(with: URL(string: url))
                    
                    
                }
                
        })
            .addDisposableTo(disposeBag)
        
        
        
    }
    
}

