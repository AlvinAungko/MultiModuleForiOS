//
//  Font+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 25/09/2023.
//

import UIKit

extension UIFont {
    
    // MARK: - MuseoSans
    public class func poppinsBlack(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Black", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    public class func poppinsSemiBold(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-SemiBold", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    public class func poppinsRegular(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Regular", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    public class func poppinsBold(ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Poppins-Bold", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
