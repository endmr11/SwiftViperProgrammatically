//
//  ProfileViewController.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    var profilePresenterNesnesi : ViewToPresenterProfileProtocol?
    final let localeStorageManager = LocaleStorageManager()
    var todoList:[TodoModel] = []
    let backgroundView = UIView()
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileRouter.createModule(ref: self)
        navigationItem.title = "Profile"
        navigationController?.navigationBar.backgroundColor = .systemBlue
        setupWidgets()
        profilePresenterNesnesi?.getAllTodos()
        if #available(iOS 15.0, *) {
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBarController?.tabBar.standardAppearance = appearance
            tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBar.standardAppearance
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setupWidgets(){
        view.addSubview(backgroundView)
        setupBackgroundView()
        backgroundView.addSubview(label)
        setuplabelWidget()
    }
}

extension ProfileViewController:PresenterToViewProfileProtocol{
    func sendDataView(todos: Array<TodoModel>?) {
        if todos != nil {
            todoList = todos!
            print(todoList)
        }
    }
    
    
}
extension ProfileViewController{
    
    func setupBackgroundView(){
        let guide = self.view.safeAreaLayoutGuide
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        backgroundView.backgroundColor = .white
    }
    
    func setuplabelWidget(){
        label.text = "\(localeStorageManager.getUser()!.username!)"
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: backgroundView.topAnchor,constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    }

}
