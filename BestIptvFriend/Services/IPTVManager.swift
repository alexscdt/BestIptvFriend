//
//  IPTVManager.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 18/12/2024.
//

import Foundation

class IPTVManager: ObservableObject {
    @Published var iptvList: [IPTV] = []
    private let savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("iptv_list.json")
    
    init() {
        loadIPTVs()
    }

    func saveIPTVs() {
        do {
            let data = try JSONEncoder().encode(iptvList)
            try data.write(to: savePath)
        } catch {
            print("Erreur lors de la sauvegarde : \(error.localizedDescription)")
        }
    }
    
    func loadIPTVs() {
        do {
            let data = try Data(contentsOf: savePath)
            iptvList = try JSONDecoder().decode([IPTV].self, from: data)
        } catch {
            print("Erreur lors du chargement ou fichier inexistant : \(error.localizedDescription)")
        }
    }
    
    func addIPTV(iptv: IPTV) {
        iptvList.append(iptv)
        saveIPTVs()
    }
    
    func removeIPTV(iptv: IPTV) {
        if let index = iptvList.firstIndex(where: { $0.id == iptv.id }) {
            iptvList.remove(at: index)
            saveIPTVs()
        }
    }
    
}
