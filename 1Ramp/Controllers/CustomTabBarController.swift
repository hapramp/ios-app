//
//  CustomTabBarController.swift
//  1Ramp
//
//  Created by Ankit Kumar on 23/01/19.
//  Copyright © 2019 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController, CustomTabDelegate{
    let homeViewController: HomeViewController = {
        return HomeViewController()
    }()
    
    let contestController: ContestViewController = {
        return ContestViewController()
    }()
    
    let profileController: ProfileViewController = {
        return ProfileViewController()
    }()
    
    let settingsController: SettingsViewController = {
        return SettingsViewController()
    }()
    
    func onTabPressed(tabId: Int) {
        setSelectedTab(tabId: tabId)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }
    
    let statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.primaryColorDark
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actionBarView: HomeActionBarView = {
        let view = HomeActionBarView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let childViewControllerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomBarContainer: UIView = {
        let bottomBar = UIView()
        bottomBar.backgroundColor = UIColor.white
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        return bottomBar
    }()
    
    let homeTab: CustomTabItem = {
        let view = CustomTabItem()
        view.setTabId(tabId: 0)
        view.setSelectedIcon(iconName: AssetsUtil.HomeSelected)
        view.setUnSelectedIcon(iconName: AssetsUtil.Home)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contestTab: CustomTabItem = {
        let view = CustomTabItem()
        view.setTabId(tabId: 1)
        view.setSelectedIcon(iconName: AssetsUtil.ContestSelected)
        view.setUnSelectedIcon(iconName: AssetsUtil.Contest)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let plusButtonTab: PlusTabItem = {
        let view = PlusTabItem()
        view.setTabId(tabId: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileTab: CustomTabItem = {
        let view = CustomTabItem()
        view.setTabId(tabId: 3)
        view.setSelectedIcon(iconName: AssetsUtil.ProfileSelected)
        view.setUnSelectedIcon(iconName: AssetsUtil.Profile)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let settingsTab: CustomTabItem = {
        let view = CustomTabItem()
        view.setTabId(tabId: 4)
        view.setSelectedIcon(iconName: AssetsUtil.SettingsSelected)
        view.setUnSelectedIcon(iconName: AssetsUtil.Settings)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews(){
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        view.addSubview(childViewControllerContainer)
        view.addSubview(statusBar)
        view.addSubview(actionBarView)
        view.addSubview(bottomBarContainer)
        //add tabs
        bottomBarContainer.addSubview(homeTab)
        bottomBarContainer.addSubview(contestTab)
        bottomBarContainer.addSubview(plusButtonTab)
        bottomBarContainer.addSubview(profileTab)
        bottomBarContainer.addSubview(settingsTab)
        
        //status Bar
        statusBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        statusBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        statusBar.heightAnchor.constraint(equalToConstant: statusBarHeight).isActive = true
        statusBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        //action bar
        actionBarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        actionBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight).isActive = true
        actionBarView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        actionBarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    
        //container
        childViewControllerContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        childViewControllerContainer.topAnchor.constraint(equalTo: actionBarView.bottomAnchor, constant: 0).isActive = true
        childViewControllerContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        childViewControllerContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        //bottom bar
        bottomBarContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        bottomBarContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        bottomBarContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bottomBarContainer.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        let tabWidth = UIScreen.main.bounds.width/5
        homeTab.leftAnchor.constraint(equalTo: bottomBarContainer.leftAnchor, constant: 0).isActive = true
        homeTab.topAnchor.constraint(equalTo: bottomBarContainer.topAnchor, constant: 0).isActive = true
        homeTab.widthAnchor.constraint(equalToConstant: tabWidth).isActive = true
        homeTab.heightAnchor.constraint(equalTo: bottomBarContainer.heightAnchor, constant: 0).isActive = true
        
        contestTab.leftAnchor.constraint(equalTo: homeTab.rightAnchor, constant: 0).isActive = true
        contestTab.topAnchor.constraint(equalTo: bottomBarContainer.topAnchor, constant: 0).isActive = true
        contestTab.widthAnchor.constraint(equalToConstant: tabWidth).isActive = true
        contestTab.heightAnchor.constraint(equalTo: bottomBarContainer.heightAnchor, constant: 0).isActive = true
        
        plusButtonTab.leftAnchor.constraint(equalTo: contestTab.rightAnchor, constant: 0).isActive = true
        plusButtonTab.topAnchor.constraint(equalTo: bottomBarContainer.topAnchor, constant: 0).isActive = true
        plusButtonTab.widthAnchor.constraint(equalToConstant: tabWidth).isActive = true
        plusButtonTab.heightAnchor.constraint(equalTo: bottomBarContainer.heightAnchor, constant: 0).isActive = true
        
        profileTab.leftAnchor.constraint(equalTo: plusButtonTab.rightAnchor, constant: 0).isActive = true
        profileTab.topAnchor.constraint(equalTo: bottomBarContainer.topAnchor, constant: 0).isActive = true
        profileTab.widthAnchor.constraint(equalToConstant: tabWidth).isActive = true
        profileTab.heightAnchor.constraint(equalTo: bottomBarContainer.heightAnchor, constant: 0).isActive = true
        
        settingsTab.leftAnchor.constraint(equalTo: profileTab.rightAnchor, constant: 0).isActive = true
        settingsTab.topAnchor.constraint(equalTo: bottomBarContainer.topAnchor, constant: 0).isActive = true
        settingsTab.widthAnchor.constraint(equalToConstant: tabWidth).isActive = true
        settingsTab.heightAnchor.constraint(equalTo: bottomBarContainer.heightAnchor, constant: 0).isActive = true
        
        
        selectHome(select: true)
        contestTab.delegate = self
        plusButtonTab.delegate = self
        profileTab.delegate = self
        settingsTab.delegate = self
        homeTab.delegate = self
    }
    
    fileprivate func addShadowToBottomBar(){
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bottomBarContainer.bounds.width, height: 4))
        bottomBarContainer.layer.masksToBounds = false
        bottomBarContainer.layer.shadowColor = UIColor.black.cgColor
        bottomBarContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottomBarContainer.layer.shadowOpacity = 0.2
        bottomBarContainer.layer.shadowPath = shadowPath.cgPath
    }
    
    fileprivate func addShadowToActionBar(){
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: actionBarView.bounds.height, width: actionBarView.bounds.width, height: 1))
        actionBarView.layer.masksToBounds = false
        actionBarView.layer.shadowColor = UIColor.black.cgColor
        actionBarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        actionBarView.layer.shadowOpacity = 0.4
        actionBarView.layer.shadowRadius = 2
        actionBarView.layer.shadowPath = shadowPath.cgPath
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addShadowToBottomBar()
        actionBarView.addBottomShadow()
    }
    
    var recentSelectedViewController: UIViewController?
    var upcomingViewController: UIViewController?
    var recentSelectedTabId: Int = 0
    
    fileprivate func setSelectedTab(tabId: Int){
        if recentSelectedTabId == tabId{
            return
        }
        recentSelectedTabId = tabId
        
        switch tabId {
        case 0:
            selectHome(select: true)
            break
            
        case 1:
            selectContest(select: true)
            break
            
        case 2:
            print("add new")
            break
            
        case 3:
            selectProfile(select: true)
            break
            
        case 4:
            selectSettings(select: true)
            break
            
        default:
            print("invalid tab \(tabId)")
        }
    }
    
    fileprivate func selectHome(select: Bool){
        if select{
            homeTab.setSelected(selected: true)
            selectContest(select: false)
            selectProfile(select: false)
            selectSettings(select: false)
            upcomingViewController = homeViewController
            switchViewChildViewContollers()
        }else{
            homeTab.setSelected(selected: false)
        }
    }
    
    fileprivate func selectContest(select: Bool){
        if select{
            contestTab.setSelected(selected: true)
            selectHome(select: false)
            selectProfile(select: false)
            selectSettings(select: false)
            
            upcomingViewController = contestController
            switchViewChildViewContollers()
            
        }else{
            contestTab.setSelected(selected: false)
        }
    }
    
    fileprivate func selectProfile(select: Bool){
        if select{
            profileTab.setSelected(selected: true)
            selectContest(select: false)
            selectHome(select: false)
            selectSettings(select: false)
            upcomingViewController = profileController
            switchViewChildViewContollers()
        }else{
            profileTab.setSelected(selected: false)
        }
    }
    
    
    fileprivate func selectSettings(select: Bool){
        if select{
            settingsTab.setSelected(selected: true)
            selectContest(select: false)
            selectProfile(select: false)
            selectHome(select: false)
            upcomingViewController = settingsController
            switchViewChildViewContollers()
        }else{
            settingsTab.setSelected(selected: false)
        }
    }
    
    private func switchViewChildViewContollers(){
        //remove old view controller
        if recentSelectedViewController != nil{
            recentSelectedViewController?.willMove(toParent: nil)
            recentSelectedViewController?.view.removeFromSuperview()
            recentSelectedViewController?.removeFromParent()
        }
        
        //add new view controller
        if upcomingViewController != nil{
            addChild(upcomingViewController!)
            upcomingViewController?.view.frame = childViewControllerContainer.bounds
            childViewControllerContainer.addSubview(upcomingViewController!.view)
            upcomingViewController?.didMove(toParent: self)
            recentSelectedViewController = upcomingViewController
        }
    }
}
