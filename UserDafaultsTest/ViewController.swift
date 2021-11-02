//
//  ViewController.swift
//  UserDafaultsTest
//
//  Created by andrewoch on 02.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userSettings = UserInfoSettings(useFaceId: true, autoSignIn: true, secretQuestion: "Wife name", billNotification: .init(phoneNumber: "787652643", email: "admin12wnjb@evver.rv"))
        let encoder = JSONEncoder()
        let encodeUserSettings = try? encoder.encode(userSettings)
        userDefaults.set(encodeUserSettings, forKey: UserDefaultsKeys.userSettingsKey)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let settings = userDefaults.value(forKey: UserDefaultsKeys.userSettingsKey) as! Data
        let decoder = JSONDecoder()
        let data = try! decoder.decode(UserInfoSettings.self, from: settings)
        print(data)
    }
}
