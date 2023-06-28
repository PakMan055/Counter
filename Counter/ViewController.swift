//
//  ViewController.swift
//  Counter
//
//  Created by Roman Pak on 26.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let counterTextField: UITextField = {
        let counterName = UITextField()
        counterName.placeholder = "Enter counter name"
        counterName.textAlignment = .center
        
        return counterName
    }()
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
        counterTextField.font = UIFont.systemFont(ofSize: 24)
    }
    @objc func buttonTapped() {
        let viewController = SecondViewController()
        viewController.name = counterTextField.text ?? ""
        navigationController?.pushViewController(viewController, animated: true)
    }
}
private extension ViewController {
    func setupScene() {
        view.addSubview(myButton)
        view.addSubview(counterTextField)
        view.backgroundColor = .systemBackground
        title = "Welcome"
    }
    func makeConstraints() {
        counterTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
        }
        myButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
    }
    
}
