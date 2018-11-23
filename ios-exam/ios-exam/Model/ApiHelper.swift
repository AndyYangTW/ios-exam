//
//  ApiHelper.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class ApiHelper: NSObject {
    func callAPIWithDecoderMethod(VC: UIViewController, url: String, params: [String: Any]? = nil, method: HTTPMethod, completionHandler: @escaping(Data) -> Void) {
        
        let alert = MBProgressHUD.showAdded(to: VC.view, animated: true)
        alert.show(animated: true)
        alert.label.text = "Loading"
        alert.bezelView.color = UIColor.lightGray.withAlphaComponent(0.5)
        alert.backgroundView.style = .solidColor
        
        let header: HTTPHeaders = ["Accept" : "application/json"]
        let req = Alamofire.request(url, method: method, headers: header)
        let cacheRes = URLCache.shared.cachedResponse(for: req.request!)
        if cacheRes == nil {
            req.responseJSON { (resData) in
                switch resData.result {
                case .success:
                    let cacheURLRes = CachedURLResponse(response: resData.response!, data: resData.data!
                        , userInfo: nil, storagePolicy: .allowed)
                    URLCache.shared.storeCachedResponse(cacheURLRes, for: resData.request!)
                    alert.hide(animated: true)
                    completionHandler(resData.data!)
                case .failure(let err):
                    print(err.localizedDescription)
                    alert.hide(animated: true)
                    break
                }
            }
        } else {
            alert.hide(animated: true)
            completionHandler((cacheRes?.data)!)
        }   
    }
}
