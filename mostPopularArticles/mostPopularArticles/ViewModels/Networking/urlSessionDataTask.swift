//
//  urlSessionDataTask.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import Foundation

enum ServiceUrl : String {
    case base = "https://api.nytimes.com/svc/mostpopular/v2/"
    case period1 = "1"
    case period2 = "7"
    case period3 = "30"
    case jsonValue = ".json?api-key="
    case emailed = "emailed/"
    case viewed = "viewed/"
    case shared = "shared/"
    case platform = "/facebook"
    case apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
}

class Session : ObservableObject {
    @Published var emailed : Emailed?
    // Example: Creating a URLSessionDataTask for a GET request
    func urlSesionInit(url:String){
        print(url)
        
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { [self] data, response, error in
                if let error = error {
                    // Handle the error
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    // Process the data
                    let json = try? JSONDecoder().decode(Emailed.self, from: data)
                    self.emailed = json
                    print("Data received: \(String(describing: emailed?.results.enumerated().map{index, title in String("\(index+1) \(title.title)")}))")
                }
            }
            task.resume()
        }
    }
}
