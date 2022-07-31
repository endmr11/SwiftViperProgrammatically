//
//  HomeViewController.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    var homePresenterNesnesi : ViewToPresenterHomeProtocol?
    final let localeStorageManager = LocaleStorageManager()
    var photoList:[PhotoModel] = []
    let backgroundView = UIView()
    let exitBarBtn = UIBarButtonItem()
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeRouter.createModule(ref: self)
        navigationItem.title = "Home"
        navigationController?.navigationBar.backgroundColor = .systemBlue
        tableView.dataSource = self
        tableView.delegate = self
        setupWidgets()
        homePresenterNesnesi?.getAllPhotos()
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
        self.navigationItem.rightBarButtonItem = exitBarBtn
        setupExitBarBtn()
        backgroundView.addSubview(tableView)
        setupTableView()
    }
    
    @objc func exit(){
        localeStorageManager.clear()
        let vc = LoginViewController()
        vc.hidesBottomBarWhenPushed = true
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.modalPresentationStyle = .fullScreen
        }

    }
}

extension HomeViewController:PresenterToViewHomeProtocol{
    func sendDataView(photos: Array<PhotoModel>?) {
        if photos != nil {
            photoList = photos!
            tableView.reloadData()
        }
    }
}

extension HomeViewController{
    
    func setupBackgroundView(){
        let guide = self.view.safeAreaLayoutGuide
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        backgroundView.backgroundColor = .white
    }
    
    func setupExitBarBtn(){
        exitBarBtn.image = UIImage(systemName: "clear")
        exitBarBtn.style = .plain
        exitBarBtn.target = self
        exitBarBtn.action = #selector(self.exit)
        exitBarBtn.tintColor = .black
    }
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:backgroundView.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:backgroundView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:backgroundView.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:backgroundView.bottomAnchor).isActive = true
        tableView.backgroundColor = .white
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")

    }
}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let photoData = photoList[indexPath.row]
        cell.label.text = photoData.title
        if let url = URL(string:photoData.thumbnailUrl!){
            DispatchQueue.global().async {
                let data = try?  Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.photo.image = UIImage(data: data!)
                }
            }
        }
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.lightGray
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoData = photoList[indexPath.row]
        let photoDetailVC = PhotoDetailViewController()
        photoDetailVC.model = photoData
        present(photoDetailVC, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


