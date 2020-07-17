//
//  MyAccountViewController.swift
//  git_project
//
//  Created by MacBook Pro on 7/10/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import UIKit

protocol UpdateDelagate: class {
    func didUpdate()
}

class MyAccountViewController: UIViewController {
    
    let getMyAccountEndPoint = "Account/Get"
    let getMyBonusEndPoint = "Account/GetUserBonuse"
    
    var myAccountDetails: MyAccountDetail!
    
    @IBOutlet weak var myProfilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
        editBtn.addTarget(self, action: #selector(editBtnAction), for: .touchUpInside)
        getMyAccount()
        getMyBonus()
    }
    
    @objc func editBtnAction() {
        let vc = UIStoryboard(name: "MyAccount", bundle: nil).instantiateViewController(identifier: "EditAccountViewController") as! EditAccountViewController
        vc.editDetail = myAccountDetails
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getMyAccount() {
        APIClientService.makeRequest(urlEndPoint: getMyAccountEndPoint) { (resp: MyAccountDetail) in
            self.myAccountDetails = resp
            self.setMyData(data: resp)
        }
    }
    
    private func getMyBonus() {
        APIClientService.makeRequest(urlEndPoint: getMyBonusEndPoint) { (resp: Int) in

            self.roleLabel.text = "My bonus count: " + String(resp)
        }
>>>>>>> 5c5b2183cef9cabfa9621548a8abe6a6c98fcaaf
    }
    
    private func setMyData(data: MyAccountDetail) {
        self.nameLabel.text = data.name
        self.surnameLabel.text = data.surname
        self.phoneLabel.text = data.phone
        self.birthDateLabel.text = data.birthDate
    }

}

extension MyAccountViewController: UpdateDelagate {
    func didUpdate() {
        getMyAccount()
    }
}
