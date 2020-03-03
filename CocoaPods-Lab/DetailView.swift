//
//  DetailView.swift
//  CocoaPods-Lab
//
//  Created by Yuliia Engman on 3/3/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 1
        label.text = "User Name"
        label.textAlignment = .center
        return label
    } ()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 1
        label.text = "User DOB'"
        label.textAlignment = .center
        return label
    } ()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 2
        label.text = "User Address"
        label.textAlignment = .center
        return label
    } ()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 1
        label.text = "User phone"
        label.textAlignment = .center
        return label
    } ()
    
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 1
        label.text = "User Email"
        label.textAlignment = .center
        return label
    } ()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setupUserNameLabelConstraints()
        setupDOBLabelConstraints()
        setupAddressLabelConstraints()
        setupPhoneLabelConstraints()
    }
    
    private func setupUserNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(50)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupDOBLabelConstraints() {
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(30)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupAddressLabelConstraints() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(30)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupPhoneLabelConstraints() {
        addSubview(userNameLabel)
        phoneLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(30)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupemailLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(30)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    
}
