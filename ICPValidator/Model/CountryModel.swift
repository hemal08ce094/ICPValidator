//
//  CountryModel.swift
//  ICPValidator
//
//  Created by hemal on 23/08/2023.
//

import Foundation
struct CountryModel {
    let nationalityId: Int
    let currentNationalityCode: String
    let countryName: String
    // Add other properties here
    
    init(nationalityId: Int, currentNationalityCode: String, countryName: String) {
        self.nationalityId = nationalityId
        self.countryName = countryName
        self.currentNationalityCode = currentNationalityCode
    }
}
