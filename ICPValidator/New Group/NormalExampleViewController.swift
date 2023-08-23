//
//  ViewController.swift
//  Custom Input Textfield
//
//  Created by ajm on 4/6/19.
//  Copyright © 2019 Wabbit. All rights reserved.
//

import UIKit

class NormalExampleViewController: UIViewController {
    @IBOutlet weak var stackview: UIStackView!
    
    let input1 = customInputView(title: "Date Of birth", placeHolder: "1991/03/27")
    let input2 = customInputView(title: "Number Of Sponsored",  placeHolder: "1")
    let input3 = customInputView(title: "Passport Number", placeHolder: "S8130184")
    
    override func viewDidLoad() {
        super.viewDidLoad()



        input1.delegate = self
        input2.delegate = self
        input3.delegate = self
        
        stackview.addArrangedSubview(input1)
        stackview.addArrangedSubview(input2)
        stackview.addArrangedSubview(input3)
        stackview.spacing = 10.0
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.dateOfBirth = input1.textField.text
        appDelegate.numberOfSponsored = input2.textField.text
        appDelegate.passportNumber = input3.textField.text
        dismiss(animated: true, completion: nil)
    }
}
extension NormalExampleViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

