//
//  ICPPersonalInfoResponse.swift
//  ICPValidator
//
//  Created by hemal on 23/08/2023.
//

import Foundation

struct ICPPersonalInfo: Codable {
    let isValid: Bool
    let personalInfo: PersonalInfo
    let qrCode: JSONNull?
    let validUntilDateTimeText, validUntilDateTime: String
    let generatedAPIURL: String

    enum CodingKeys: String, CodingKey {
        case isValid, personalInfo, qrCode, validUntilDateTimeText, validUntilDateTime
        case generatedAPIURL = "generatedAPIUrl"
    }
}

// MARK: - PersonalInfo
struct PersonalInfo: Codable {
    let unifiedNumber: Int
    let identityNumber, identityCardNumber, identityExpireDate, arabicFullName: String
    let englishFullName, arabicFatherName, englishFatherName: String
    let arabicFourthName, englishFourthName, arabicGrandName, englishGrandName: JSONNull?
    let dateOfBirth: String
    let nationalityID: Int
    let nationality: Nationality
    let genderID: Int
    let gender: Gender
    let englishFirstName, englishFamilyName, arabicFirstName, arabicFamilyName: String
    let personTitleID, personTitle: JSONNull?
    let ePassportArabicFatherName, ePassportEnglishFatherName: String
    let ePassportArabicGrandName, ePassportEnglishGrandName, ePassportArabicFourthName, ePassportEnglishFourthName: JSONNull?
    let ePassportArabicFirstName, ePassportEnglishFirstName: String
    let ePassportArabicFifthName, ePassportEnglishFifthhName: JSONNull?
    let ePassportArabicFamilyName, ePassportEnglishFamilyName: String
    let tribeID, tribe, portrait, signiture: JSONNull?
    let mrz: JSONNull?
    let identityIssueDate, arabicIdentityIssuePlace, englishIdentityIssuePlace: String
    let professionID: Int
    let arabicProfession, englishProfession, arabicSponsorName, englishSponsorName: String
    let newIDCardVersionFlag, hasDisabilityFlag, hasGoldVisaOrResidencyFlag, personFileTypeID: Int
    let sponsorCategoryCode: String
    let isCitizen, isGCCCitizen, isResident: Bool
    let bloodTypeCode, hasGreenResidencyFlag: JSONNull?

    enum CodingKeys: String, CodingKey {
        case unifiedNumber, identityNumber, identityCardNumber, identityExpireDate, arabicFullName, englishFullName, arabicFatherName, englishFatherName, arabicFourthName, englishFourthName, arabicGrandName, englishGrandName, dateOfBirth
        case nationalityID = "nationalityId"
        case nationality
        case genderID = "genderId"
        case gender, englishFirstName, englishFamilyName, arabicFirstName, arabicFamilyName
        case personTitleID = "personTitleId"
        case personTitle, ePassportArabicFatherName, ePassportEnglishFatherName, ePassportArabicGrandName, ePassportEnglishGrandName, ePassportArabicFourthName, ePassportEnglishFourthName, ePassportArabicFirstName, ePassportEnglishFirstName, ePassportArabicFifthName, ePassportEnglishFifthhName, ePassportArabicFamilyName, ePassportEnglishFamilyName
        case tribeID = "tribeId"
        case tribe, portrait, signiture, mrz, identityIssueDate, arabicIdentityIssuePlace, englishIdentityIssuePlace
        case professionID = "professionId"
        case arabicProfession, englishProfession, arabicSponsorName, englishSponsorName
        case newIDCardVersionFlag = "newIdCardVersionFlag"
        case hasDisabilityFlag, hasGoldVisaOrResidencyFlag
        case personFileTypeID = "personFileTypeId"
        case sponsorCategoryCode, isCitizen, isGCCCitizen, isResident, bloodTypeCode, hasGreenResidencyFlag
    }
}

// MARK: - Gender
struct Gender: Codable {
    let id: Int
    let description, validFrom, validTo, frequentlyUsed: JSONNull?
    let code: JSONNull?
    let nameID: Int
    let localizedName, lang: JSONNull?
    let text: String
    let extraParms: JSONNull?
    let disabledLoadDataFromCache: Bool

    enum CodingKeys: String, CodingKey {
        case id, description, validFrom, validTo, frequentlyUsed, code
        case nameID = "nameId"
        case localizedName, lang, text, extraParms, disabledLoadDataFromCache
    }
}

// MARK: - Nationality
struct Nationality: Codable {
    let isoThreeCharactersCode, isoTwoCharactersCode: JSONNull?
    let isActive: Bool
    let diallingCode: JSONNull?
    let visaOnArrival: Bool
    let id: Int
    let description, validFrom, validTo, frequentlyUsed: JSONNull?
    let code: JSONNull?
    let nameID: Int
    let localizedName, lang: JSONNull?
    let text: String
    let extraParms: JSONNull?
    let disabledLoadDataFromCache: Bool

    enum CodingKeys: String, CodingKey {
        case isoThreeCharactersCode, isoTwoCharactersCode, isActive, diallingCode, visaOnArrival, id, description, validFrom, validTo, frequentlyUsed, code
        case nameID = "nameId"
        case localizedName, lang, text, extraParms, disabledLoadDataFromCache
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
