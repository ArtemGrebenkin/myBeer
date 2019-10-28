//
//  NetworkManager.swift
//  myBeer
//
//  Created by Artem Grebenkin on 10/20/19.
//  Copyright © 2019 Artem Grebenkin. All rights reserved.
//


import Alamofire

class NetworkManager  {
    static func fetchData(clouser: @escaping([Beer]) -> Void) {
        guard let url = URL(string: "https://sandbox-api.brewerydb.com/v2/beers/?key=485d37ba408cb459d0a7bb338ab2fbfc") else {return}
        request(url).validate().responseJSON { (dataResponce) in
            switch dataResponce.result{
            case .success(let value):
                guard let jsonData = value as? Dictionary<String, Any> else { return }
                clouser(self.getDataFrom(json: jsonData))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private static func getDataFrom(json: Dictionary<String, Any>) -> [Beer] {
        var beers = [Beer]()
        guard let dataList = json["data"] as? Array<[String: Any]> else { return beers}
        for item in dataList {
            beers.append(Beer(dict: item))
        }
        return beers
    }
}

