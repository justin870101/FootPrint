//
//  NetworkTool.swift
//  FootPrint
//
//  Created by Justin on 2018/11/29.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

protocol NetworkToolProtocol {
    static func loadMineData()
}

extension NetworkToolProtocol{
    static func loadMineData() {
        let url = BaseURL + "/user/tab/tabs?"
        let params = ["device_id":device_id]
        Alamofire.request(url,parameters:params).responseJSON { (response) in
            guard response.result.isSuccess else{
                return
            }
            if let result = response.result.value{
                let json = JSON(result)
                guard json["message"] == "sussess" else{
                    return
                }
                if let data = json["data"].dictionary{
                    print(data)
                }
            }
            
        }
    }
}

struct NetworkTool : NetworkToolProtocol {
    
}
