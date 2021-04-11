//
//  newsApiSwift.swift
//  newsApp
//
//  Created by MAC on 05/02/21.
//  Copyright © 2021 MAC. All rights reserved.
//

import Foundation
import Combine
import SwiftyJSON

class NewsApi : ObservableObject{
    @Published var data = [News]()
    
    init(){
        let url =
        "https://newsapi.org/v2/top-headlines?country=id&category=science&apiKey=028e70b349484a649171195ca796b7ba"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){(data , _, err)in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            let items = json["articles"].array!
            
            for i in items{
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let imurl = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(title: title, image: imurl, description: description))
                }
            }
        }
        .resume()
    }
}
