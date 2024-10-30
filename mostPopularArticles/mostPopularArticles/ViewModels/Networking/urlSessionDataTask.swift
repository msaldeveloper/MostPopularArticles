//
//  urlSessionDataTask.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import Foundation

enum ServiceUrl: String {
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

import Foundation

class Session: ObservableObject {
    @Published var emailed: Emailed?
    @Published var errorMessage: String?

    func urlSesionInit(url: String) {
        guard let validURL = createURL(from: url) else {
            errorMessage = "URL inválida."
            return
        }

        fetchData(from: validURL)
    }

    private func createURL(from urlString: String) -> URL? {
        return URL(string: urlString)
    }

    private func fetchData(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            self.handleResponse(data: data, response: response, error: error)
        }
        task.resume()
    }

    private func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            DispatchQueue.main.async {
                self.errorMessage = "Error de red: \(error.localizedDescription)"
            }
            return
        }

        if let httpResponse = response as? HTTPURLResponse {
            print(" status code : \(httpResponse.statusCode)")
            if !(200...299).contains(httpResponse.statusCode) {
                DispatchQueue.main.async {
                    self.errorMessage = "Error del servidor: \(httpResponse.statusCode)"
                }
                return
            }
        } else {
            DispatchQueue.main.async {
                self.errorMessage = "Respuesta inválida del servidor."
            }
            return
        }

        if let data = data {
            decodeData(data)
        } else {
            DispatchQueue.main.async {
                self.errorMessage = "No se recibieron datos del servidor."
            }
        }
    }

    private func decodeData(_ data: Data) {
        do {
            let json = try JSONDecoder().decode(Emailed.self, from: data)
            DispatchQueue.main.async {
                self.emailed = json
                self.errorMessage = nil
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Error al decodificar los datos: \(error.localizedDescription)"
            }
        }
    }
}
