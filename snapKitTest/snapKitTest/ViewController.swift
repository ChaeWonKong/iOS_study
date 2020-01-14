//
//  ViewController.swift
//  snapKitTest
//
//  Created by Leon Kong on 2020/01/14.
//  Copyright © 2020 Yetda. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.6, alpha: 0.4)
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    let subView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        print("hello")
    }
    
    let bottomView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 20
        
        let button = UIButton()
        button.setTitle("Click Me!", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 20
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.center.equalTo(view)
        }
        
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topView, bottomView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        setupViews()
        
    }
    
    func setup() {
        view.backgroundColor = UIColor.white
        title = "Example 1"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupViews() {
        view.addSubview(mainView)
        mainView.addSubview(subView)
        subView.addSubview(mainStackView)
        
        mainView.snp.makeConstraints { (make) in
            make.topMargin.left.equalTo(20)
            make.right.bottomMargin.equalTo(-20)
        }
        
        subView.snp.makeConstraints { (make) in
            make.width.height.equalTo(300)
            make.center.equalTo(self.mainView)
        }
        
        mainStackView.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
    }
    
    

}

