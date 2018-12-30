//
//  Extensions.swift
//  1Ramp
//
//  Created by Ankit Kumar on 25/12/18.
//  Copyright © 2018 Hapramp Studios Pvt Ltd. All rights reserved.
//

import UIKit
import SVProgressHUD
extension UIViewController {
    
    fileprivate func initHUD(){
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultMaskType(.custom)
    }
    
    func showHUD(withStatus: String){
        initHUD()
        SVProgressHUD.show(withStatus: withStatus)
    }
    
    func showHUD(){
        initHUD()
        SVProgressHUD.show()
    }
    
    func dismissHUD() {
        SVProgressHUD.dismiss()
    }
}

extension UIView {
    func setGradient(from color1: UIColor, to color2: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.layer.frame
        print("Setting gradient \(self.layer.frame)")
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension URL{
    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
}
