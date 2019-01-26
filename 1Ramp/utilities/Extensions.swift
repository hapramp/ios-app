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

extension UIView{
    public func addBottomShadow(){
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: 1))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2
        self.layer.shadowPath = shadowPath.cgPath
    }
}

var textHeightDictionary = [String: CGFloat]()
extension UITextView{
    public static func calculateHeightOfText(string: String, font: UIFont, width: CGFloat) -> CGFloat{
        let string = string
        if let textHeight = textHeightDictionary[string]{
            return textHeight
        }
        
        let constraintRect = CGSize(width: width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = string.boundingRect(with: constraintRect,
                                              options: .usesLineFragmentOrigin,
                                              attributes: [.font: font],
                                              context: nil)
        let height = ceil(boundingBox.height) + 16
        //store height
        textHeightDictionary[string] = height
        return height
    }
}



extension UICollectionView{
    public func calculateHeightOfText(string: String,font: UIFont,completion: @escaping(_ newCalculatedHeight: CGFloat, _ string: String) -> ()){
        //check in the dict
        if let textHeight = textHeightDictionary[string]{
            print("returning from dictionary")
            completion(textHeight,string)
            return
        }
        
        let constraintRect = CGSize(width: self.frame.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = string.boundingRect(with: constraintRect,
                                              options: .usesLineFragmentOrigin,
                                              attributes: [.font: font],
                                              context: nil)
        let height = ceil(boundingBox.height) + 16
        //store height
        textHeightDictionary[string] = height
        print("returning fresh")
        completion(height,string)
    }
}
