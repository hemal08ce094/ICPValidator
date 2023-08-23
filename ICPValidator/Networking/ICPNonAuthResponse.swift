//
//  ICPNonAuthResponse.swift
//  ICPValidator
//
//  Created by hemal on 23/08/2023.
//

import Foundation

struct ICPResponse: Codable {
    let id: Int
    let userToken: String
    let userName: JSONNull?
    let userGUID, refreshToken, englishFirstName, englishFamilyName: String
    let arabicFirstName, arabicFamilyName, defaultURL: String
    let applicationID: Int
    let preferedLanguageID: String
    let flatMode, hasAmwalAccount, eligibleForAmwalWalletPayment: Bool
    let lastLogin: String
    let recaptchaResponse: JSONNull?
    let accessTokenStamp: String
    let timeout, askToExtendAfter: Int
    let userClaims: [UserClaim]
    let isEstablishmentAdmin, isUsingBetaVersion: Bool
    let unifiedNumber, establishmentAdminRegionID: Int
    let statusCode, requestNumber, serviceTransactionID: JSONNull?
    let isAuthorityEstablishment: Bool
    let establishmentID, accountTypeID: Int
    let identityNumber, erroCode: JSONNull?
    let isValidUser: Bool
    let currentNationalityID: Int
    let cacheVersion: Double
    let itShouldRedirectToNewEchannels, isLoginNeedToken: Bool
    let securitySessionToken, isImpersonateLogin, relatedEstablishments, userProfile: JSONNull?
    let reactivatedFlag, lookupUserAuditResultID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, userToken, userName
        case userGUID = "userGuid"
        case refreshToken, englishFirstName, englishFamilyName, arabicFirstName, arabicFamilyName
        case defaultURL = "defaultUrl"
        case applicationID = "applicationId"
        case preferedLanguageID = "preferedLanguageId"
        case flatMode, hasAmwalAccount, eligibleForAmwalWalletPayment, lastLogin, recaptchaResponse, accessTokenStamp, timeout, askToExtendAfter, userClaims, isEstablishmentAdmin, isUsingBetaVersion, unifiedNumber
        case establishmentAdminRegionID = "establishmentAdminRegionId"
        case statusCode, requestNumber
        case serviceTransactionID = "serviceTransactionId"
        case isAuthorityEstablishment
        case establishmentID = "establishmentId"
        case accountTypeID = "accountTypeId"
        case identityNumber, erroCode, isValidUser
        case currentNationalityID = "currentNationalityId"
        case cacheVersion, itShouldRedirectToNewEchannels, isLoginNeedToken, securitySessionToken, isImpersonateLogin, relatedEstablishments, userProfile, reactivatedFlag
        case lookupUserAuditResultID = "lookupUserAuditResultId"
    }
}

// MARK: - UserClaim
struct UserClaim: Codable {
    let key: String
    let values: [String]?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
