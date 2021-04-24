//
//  ImagesHelper.swift
//  Repos
//
//  Created by Heba Nageh on 24/04/2021.
//

import Foundation
import UIKit

class ImagesHelper {
    
    func downloadImage(from url: URL , success:@escaping((_ image:UIImage)->()),failure:@escaping ((_ msg:String)->())){
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                failure("Image cant download from G+ or fb server")
                return
            }

            DispatchQueue.main.async() {
                 if let _img = UIImage(data: data){
                      success(_img)
                }
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
