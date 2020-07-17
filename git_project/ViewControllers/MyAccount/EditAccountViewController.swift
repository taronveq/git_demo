//
//  EditAccountViewController.swift
//  git_project
//
//  Created by Varsik Tumanyan on 7/15/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {

    weak var delegate: UpdateDelagate?
    let updateUserEndPoint = "Account/UpdateUser"
    var editDetail: MyAccountDetail!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = editDetail.name
        surnameTF.text = editDetail.surname
        emailTF.text = editDetail.email
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        editDetail.name = nameTF.text ?? ""
        editDetail.surname = surnameTF.text ?? ""
        editDetail.email = emailTF.text ?? ""
        editDetail.dateOfBirth = editDetail.birthDate
        
        APIClientService.makeRequest(urlEndPoint: updateUserEndPoint, method: .put, params: editDetail.dictionary) { (resp: Bool) in
            if resp {
                self.delegate?.didUpdate()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
