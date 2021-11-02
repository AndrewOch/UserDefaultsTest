//
//  UserSettings.swift
//  UserDafaultsTest
//
//  Created by andrewoch on 02.11.2021.
//

struct UserInfoSettings : Codable{
    
    var useFaceId: Bool
    var autoSignIn: Bool
    var secretQuestion: String
    var billNotification: BillNotification
    
    
    enum CodingKeys: String, CodingKey{
        case useFaceId = "useFaceId"
        case autoSignIn = "autoSignIn"
        case secretQuestion = "secretQuestion"
        case phoneNumber = "phoneNumber"
        case email = "email"
    }
    
    struct BillNotification : Codable{
        
        var phoneNumber: String
        var email: String
        
        init(phoneNumber: String, email: String) {
            self.phoneNumber = phoneNumber
            self.email = email
        }
        
    }
    
    
    init(useFaceId: Bool, autoSignIn: Bool, secretQuestion: String, billNotification: BillNotification)
    {
        self.useFaceId = useFaceId
        self.autoSignIn = autoSignIn
        self.secretQuestion = secretQuestion
        self.billNotification = billNotification
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(useFaceId, forKey: .useFaceId)
        try container.encode(autoSignIn, forKey: .autoSignIn)
        try container.encode(secretQuestion, forKey: .secretQuestion)
        
        try container.encode(billNotification.phoneNumber, forKey: .phoneNumber)
        try container.encode(billNotification.email, forKey: .email)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.useFaceId = try container.decode(Bool.self, forKey: .useFaceId)
        self.autoSignIn = try container.decode(Bool.self, forKey: .autoSignIn)
        self.secretQuestion = try container.decode(String.self, forKey: .secretQuestion)
        
        let phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        let email = try container.decode(String.self, forKey: .email)
        
        self.billNotification = .init(phoneNumber: phoneNumber, email: email)
    }
    
    
}
