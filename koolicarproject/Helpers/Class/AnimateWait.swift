//
//  AnimateWait.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 02/10/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

/// MARK: - MNWait, animation d'attente

final class AnimateWaitView:UIView {
    
    class func animateIn(delegateView:UIView, center:CGPoint? = nil) {
        AnimateWaitView.animateIn(delegateView: delegateView,
                                  backgroundColor: UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15 ),
                                  center: center)
    }
    
    class func animateOut(delegateView:UIView, completion:(()->())? = nil) {
        guard let hasWaitView = delegateView.viewWithTag(666) else {
            return
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            hasWaitView.alpha = 0
            }, completion: { (bool) -> Void in
                hasWaitView.removeFromSuperview()
                for subview in delegateView.subviews where subview.tag == 666 { subview.removeFromSuperview() }
                completion?()
        })
    }
    
    private class func animateIn(delegateView:UIView,backgroundColor:UIColor, center:CGPoint? = nil) {
        
        let activityIndicator:NVActivityIndicatorView = {
            let activityIndicator = NVActivityIndicatorView(
                frame: CGRect(
                    x: UIScreen.main.bounds.width / 2 - 20 ,
                    y: UIScreen.main.bounds.height / 2 - 20,
                    width: 40,
                    height: 40),
                type: .ballScaleRipple,
                color: UIColor.white)
            return activityIndicator
        }()
        let v:UIView = {
            let v = UIView(frame: delegateView.frame)
            v.alpha = 0
            v.backgroundColor = backgroundColor
            v.tag = 666
            v.layer.zPosition = 10
            v.isUserInteractionEnabled = true
            v.addSubview(activityIndicator)
            delegateView.addSubview(v)
            return v
        }()
        activityIndicator.startAnimating()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            v.alpha = 1
        }, completion: {(bool) -> Void in })
    }
}
