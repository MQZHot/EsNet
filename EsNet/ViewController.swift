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
    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var cachelabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request(cache: true)
    }
    
    func request(cache: Bool) -> Void {
        picProvider.requestJson(.getPic(type: "20"), isCache: cache)
            .mapArray(type: AdModel.self)
            .subscribe( onNext: { (modelArr) in
                
                if modelArr.count != 0 {
                    let model = modelArr.first
                    let url = model?.url ?? ""
                    let name = model?.name ?? ""
                    self.imgView.kf.setImage(with: URL(string: url))
                    self.cachelabel.text = cache ? "\(name)\n\(url)" : ""
                    self.dataLabel.text = "\(name)\n\(url)"
                }
                
            })
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func switchClick(_ sender: UISwitch) {
        
        request(cache: sender.isOn)
        
    }
    
    
}

