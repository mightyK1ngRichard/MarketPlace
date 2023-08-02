//
//  Network.swift
//  ProductShop
//
//  Created by Дмитрий Пермяков on 01.08.2023.
//

import Foundation
import Alamofire

struct APIManager {
    static let shared = APIManager()
    
    // Имитация работы бд.
    func getData() -> [MainViewModel] {
        return dataForlayout
    }
    
}

