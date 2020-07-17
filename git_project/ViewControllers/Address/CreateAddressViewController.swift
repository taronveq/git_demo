//
//  CreateAddressViewController.swift
//  git_project
//
//  Created by Varsik Tumanyan on 7/10/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit
import Alamofire

protocol AddressDelegate: class {
    func addressDidAdd()
}

class CreateAddressViewController: UIViewController {
    
    let createAddressEndPoint = "Address/Create"
    var address: Address?
    
    weak var delegate: AddressDelegate?
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var buildingTF: UITextField!
    @IBOutlet weak var appartmentTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var commentTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       setData(data: address)
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        let dict: Parameters = [
            "city": cityTF.text,
            "street": streetTF.text,
            "building": buildingTF.text,
            "appartment": appartmentTF.text,
            "phoneNumber": phoneNumberTF.text,
            "commentToDriver": commentTF.text,
            "isDefault": true
        ]
        
        APIClientService.makeRequest(urlEndPoint: createAddressEndPoint, method: .post, params: dict) { (resp: Bool) in
            if resp {
                self.delegate?.addressDidAdd()
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    private func makeDisabled() {
        cityTF.isUserInteractionEnabled = false
        streetTF.isUserInteractionEnabled = false
        buildingTF.isUserInteractionEnabled = false
        appartmentTF.isUserInteractionEnabled = false
        phoneNumberTF.isUserInteractionEnabled = false
        commentTF.isUserInteractionEnabled = false
        saveBtn.isHidden = true
    }
    
    private func setData(data: Address?) {
        if let myAddress = data {
            makeDisabled()
            cityTF.text = myAddress.city
            streetTF.text = myAddress.street
            buildingTF.text = myAddress.buliding
            appartmentTF.text = String(myAddress.appartment ?? 0)
            phoneNumberTF.text = myAddress.phoneNumber
            commentTF.text = myAddress.commentToDriver
            
        }
    }
    
    
}
