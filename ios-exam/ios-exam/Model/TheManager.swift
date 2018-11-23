//
//  TheManager.swift
//  ios-exam
//
//  Created by Andy Yang on 2018/11/23.
//  Copyright © 2018 Andy Yang. All rights reserved.
//

import UIKit
import Alamofire

class TheManager: NSObject {
    func callAPIWithDecoderMethod(VC: UIViewController, url: String, params: [String: Any]? = nil, method: HTTPMethod, completionHandler: @escaping(Data) -> Void) {
        ApiHelper().callAPIWithDecoderMethod(VC: VC, url: url, method: method, completionHandler: completionHandler)
    }
}
