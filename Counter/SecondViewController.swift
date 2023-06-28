//
//  SecondViewController.swift
//  Counter
//
//  Created by Roman Pak on 26.06.2023.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    var name: String = ""
    var counter = 0
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let backView: UIView = {
        let mainBackview = UIView()
        
        return mainBackview
    }()
    
    var countNumbers: UILabel = {
        var numbers = UILabel()
        numbers.font = UIFont.systemFont(ofSize: 150)
        
        return numbers
    }()
    
    var upButton: UIButton = {
        var plusButton = UIButton()
        return plusButton
    }()
    var downButton: UIButton = {
        var minusButton = UIButton()
        return minusButton
    }()
    let resetButton: UIButton = {
        let reset = UIButton()
        return reset
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backView)
        backView.addSubview(myLabel)
        backView.addSubview(countNumbers)
        backView.backgroundColor = .systemBackground
        backView.layer.cornerRadius = 30
        backView.addSubview(resetButton)
        
        myLabel.text = "\(name)"
        
        backView.addSubview(upButton)
        backView.addSubview(downButton)
        
        countNumbers.text = "\(counter)"
        
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        upButton.layer.cornerRadius = 75
        upButton.backgroundColor = .systemGreen
        upButton.setTitle("+", for: .normal)
        upButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        upButton.layer.borderWidth = 1
        
        
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        downButton.layer.cornerRadius = 55
        downButton.backgroundColor = .red
        downButton.setTitle("-", for: .normal)
        downButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        downButton.layer.borderWidth = 1
        
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        
        backView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(1000)
            $0.width.equalTo(350)
            $0.top.equalTo(90)
        }
        myLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        countNumbers.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(100)
        }
        upButton.snp.makeConstraints {
            $0.top.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(150)
        }
        downButton.snp.makeConstraints {
            $0.top.equalTo(430)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(110)
        }
        resetButton.snp.makeConstraints {
            $0.bottom.equalTo(-30)
            $0.width.equalTo(100)
            $0.height.equalTo(70)
            $0.centerX.equalToSuperview()
        }
    }
    @objc func plus() {
        counter += 1
        countNumbers.text = "\(counter)"
    }
    @objc func minus() {
        counter -= 1
        countNumbers.text = "\(counter)"
    }
    @objc func resetCounter() {
        counter = 0
        countNumbers.text = "\(counter)"
    }
    
}

