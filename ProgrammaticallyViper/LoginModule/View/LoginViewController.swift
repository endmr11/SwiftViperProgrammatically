//
//  ViewController.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 29.07.2022.
//

import UIKit
import CloudKit

class LoginViewController: UIViewController {
    var loginPresenterNesnesi : ViewToPresenterLoginProtocol?
    let backgroundView = UIView()
    let label = UILabel()
    let emailInput = UITextField()
    let loginBtn = UIButton()
    final let localeStorageManager = LocaleStorageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginRouter.createModule(ref: self)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        navigationController?.navigationBar.backgroundColor = .white
        setupWidgets()
        navigationItem.hidesBackButton = true
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setupWidgets(){
        view.addSubview(backgroundView)
        setupBackgroundView()
        backgroundView.addSubview(label)
        setuplabelWidget()
        backgroundView.addSubview(emailInput)
        setupEmailInputWidget()
        backgroundView.addSubview(loginBtn)
        setupLoginBtn()
    }
    
    @objc func loginBtnClicked(){
        guard (emailInput.text != "" && emailInput.text != nil)else {return}
        loginPresenterNesnesi?.tryLogin(email: emailInput.text!)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension LoginViewController : PresenterToViewLoginProtocol{
    func sendDataView(user: UserModel?) {
        if user != nil {
            localeStorageManager.saveUser(user: user!)
            emailInput.text = ""
            let vc = HomeTabBarController()
            navigationController?.navigationBar.isHidden = true
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.modalPresentationStyle = .fullScreen
            
        }else{
            let alert = UIAlertController(title: "Warning", message: "Email not found", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel){ action in}
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }

    }
    

}

extension LoginViewController{
    
    func setupBackgroundView(){
        let guide = self.view.safeAreaLayoutGuide
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: guide.topAnchor,constant:0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: guide.bottomAnchor,constant:0).isActive = true
        backgroundView.backgroundColor = .white
        
    }
    
    func setuplabelWidget(){
        label.text = "LOGIN"
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: backgroundView.topAnchor,constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    }
    
    func setupEmailInputWidget(){
        emailInput.textColor = .white
        emailInput.tintColor = .white
        emailInput.borderStyle = .roundedRect
        emailInput.backgroundColor = .lightGray
        emailInput.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.topAnchor.constraint(equalTo: label.topAnchor,constant: 150).isActive = true
        emailInput.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20).isActive = true
        emailInput.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupLoginBtn(){
        loginBtn.setTitle("LOGIN", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = .systemBlue
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.topAnchor.constraint(equalTo: emailInput.topAnchor,constant: 50).isActive = true
        loginBtn.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 60).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -60).isActive = true
        loginBtn.layer.cornerRadius = 5
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
    }
}
