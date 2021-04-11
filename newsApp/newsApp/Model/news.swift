//
//  news.swift
//  newsApp
//
//  Created by MAC on 05/02/21.
//  Copyright © 2021 MAC. All rights reserved.
//

import Foundation

struct News : Identifiable {
    var id = UUID()
    var title : String
    var image : String
    var description : String
}
