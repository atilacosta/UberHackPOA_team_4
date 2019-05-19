//
//  AppProvider.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleMaps

class AppProvider {
    
    static var `shared` = AppProvider()
    
    let mapsAPIKey = "AIzaSyDUkU8HVYggKWmeE5mZ2di_ToAQBVgHBtg"
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func prepare() {
        FirebaseApp.configure()
        GMSServices.provideAPIKey(mapsAPIKey)
        Auth.auth().signInAnonymously { (result, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                print(result ?? "(DEBUG) :- Login Success")
            }
        }
        setUpUser()
    }
    
    //CREDITS
    
    func updateCredits(value: Double) {
        Firestore.firestore().collection(Collections.users.rawValue).document(Auth.auth().currentUser!.uid).updateData(["credits": value])
    }
    
    // LOCATIONS
    
    func getLocations(_ callback: @escaping ([Location]) -> ()) {
        Firestore.firestore().collection(Collections.locations.rawValue).getDocuments { (snap, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                guard let data = try? JSONSerialization.data(withJSONObject: snap?.documents.map { $0.data() } as Any),
                    let object = try? self.decoder.decode([Location].self, from: data) else {
                        return
                }
                return callback(object)
            }
        }
    }
    
    //USER
    
    func setUpUser() {
        let id = Auth.auth().currentUser!.uid
        let newUser = User(id: id)
        
        guard let documentData = try? encoder.encode(newUser),
            let json = try? JSONSerialization.jsonObject(with: documentData),
            let rawJson = json as? [String: Any] else {
                fatalError("SERIALIZATION ERROR")
        }
        
        Firestore.firestore().collection(Collections.users.rawValue).document(id).setData(rawJson)
    }
    
    func getUser(_ callback: @escaping (User) -> ()) {
        Firestore.firestore().collection(Collections.users.rawValue).document(Auth.auth().currentUser!.uid).addSnapshotListener { (snap, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                guard let data = try? JSONSerialization.data(withJSONObject: snap?.data() as Any),
                    let object = try? self.decoder.decode(User.self, from: data) else {
                        return
                }
                callback(object)
                
            }
        }
    }
    
    // PROMO
    
    func getPromo(value: Double,_ callback: @escaping (Promo) -> ()) {
        Firestore.firestore().collection(Collections.promos.rawValue).whereField("value", isEqualTo: value).getDocuments { (snap, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            } else {
                guard let data = try? JSONSerialization.data(withJSONObject: snap?.documents.map { $0.data() } as Any),
                    let object = try? self.decoder.decode([Promo].self, from: data) else {
                        return
                }
                if let validPromo = object.first {
                    return callback(validPromo)
                }
                
            }
        }
    }
    
}
