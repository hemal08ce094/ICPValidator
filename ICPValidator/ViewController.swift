//
//  ViewController.swift
//  ICPValidator
//
//  Created by hemal on 23/08/2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let nAuthURL = "https://smartservices.icp.gov.ae/echannels/api/api/user/guest/login"
    let icpProfile = "https://smartservices.icp.gov.ae/echannels/api/api/User/verifiyAndGenerateQRCode/null/1/false"
    let cellReuseIdentifier = "cell"
    
    var userToken: String?
    var refreshToken: String?
    let userDataArray: [CountryModel] = [
        CountryModel(nationalityId: 1, currentNationalityCode: "101", countryName: "UNITED ARAB EMIRATES"),
        CountryModel(nationalityId: 11, currentNationalityCode: "121", countryName: "JORDAN"),
        CountryModel(nationalityId: 25, currentNationalityCode: "205", countryName: "INDIA"),
        CountryModel(nationalityId: 145, currentNationalityCode: "475", countryName: "TURKEY"),
        CountryModel(nationalityId: 24, currentNationalityCode: "203", countryName: "PAKISTAN"),
        CountryModel(nationalityId: 31, currentNationalityCode: "217", countryName: "SRI LANKA")
        // Add more instances as needed
    ]
    
    var userCountryData:CountryModel?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var setCountryButton: UIButton!
    @IBOutlet weak var profileDataTextView: UITextView!
    
    @IBAction func selectCountry(_ sender: Any) {
        self.tableView.isHidden = false
    }
    
    @IBAction func addMoreDetails(_ sender: Any) {

    }
    
    @IBAction func callICAAPI(_ sender: Any) {
        getUserToken()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        // Do any additional setup after loading the view.
        getUserToken()
        self.tableView.isHidden = true
        profileDataTextView.isHidden = true
    }
    
    func getUserToken() {
        let headers: HTTPHeaders = [
            "Referer": "https://smartservices.icp.gov.ae/echannels/web/client/guest/index.html",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; ×64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115-0.0.0 Safari/537.36"
        ]
        
        let request = AF.request(nAuthURL, method: .get, parameters: [:], encoding: URLEncoding.default, headers: headers)
        request.responseDecodable(of: ICPResponse.self) { (response) in
            guard let responseData = response.value else { return }
            
            switch response.result {
            case .success(_):
                self.userToken = responseData.userToken
                self.refreshToken = responseData.refreshToken
                self.getUserProfile()
            case let .failure(error):
                print(error)
            }
            
        }
    }
    
    func getUserProfile() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        
        let parameters: [String: Any] = [
            "nationalityId": self.userCountryData?.nationalityId,
            "currentNationalityCode": self.userCountryData?.currentNationalityCode,
            "passportTypeId": 1,
            "genderId": 1,
            "gender": ["Code": "1"],
            "dateOfBirth": appDelegate.dateOfBirth,
            "numberOfSponsored": appDelegate.numberOfSponsored,
            "passportNumber": appDelegate.passportNumber
        ]

        let headers: HTTPHeaders = [
            "CURRENT_PORTAL": "ICA",
            "Content-Type": "application/json;charset=UTF-8",
            "Origin": "https://smartservices.icp.gov.ae",
            "Referer": "https://smartservices.icp.gov.ae/echannels/web/client/guest/index.html",
            "refreshToken": refreshToken ?? "",
            "userToken": userToken ?? ""
        ]

        let request = AF.request(icpProfile,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .validate()
        
        request.responseDecodable(of: ICPPersonalInfo.self) { (response) in
            guard let responseData = response.value else { return }
            
            switch response.result {
            case .success(_):
                self.profileDataTextView.isHidden = false
                self.profileDataTextView.text = response.description
                print(responseData)
            case let .failure(error):
                print(error)
            }
            
        }
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        let userData = userDataArray[indexPath.row]
        cell.textLabel?.text = userData.countryName
        cell.detailTextLabel?.text = "Nationality ID: \(userData.nationalityId)  Nationality Code: \(userData.currentNationalityCode)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userCountryData = userDataArray[indexPath.row]
        
        self.tableView.isHidden = true
        self.setCountryButton.setTitle(self.userCountryData?.countryName, for: .normal)
    }
}

