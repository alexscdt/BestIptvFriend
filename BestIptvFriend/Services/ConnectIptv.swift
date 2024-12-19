import Foundation

class ConnectIptv: ObservableObject {
    @Published var iptvList: [IPTV] = []
    
    func connectIptv(iptv: IPTV) {
        let urlString = "http://\(iptv.url)/player_api.php?username=\(iptv.username)&password=\(iptv.password)"
        
        guard let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURLString) else {
            print("URL invalide")
            return
        }
        
        print("URL générée : \(encodedURLString)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let configuration = URLSessionConfiguration.default
        configuration.connectionProxyDictionary = [
            "kCFNetworkProxiesExcludeSimpleHostnames": true
        ]
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur lors de la requête : \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Statut HTTP : \(httpResponse.statusCode)")
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode([String: String].self, from: data)
                    
                    if let status = responseData["status"], status == "Active" {
                        print("IPTV connecté avec succès")
                    } else {
                        print("Erreur dans la réponse API : \(responseData["message"] ?? "Message inconnu")")
                    }
                } catch {
                    print("Erreur lors du décodage de la réponse : \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}
