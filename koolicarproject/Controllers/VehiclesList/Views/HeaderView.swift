//
//  HeaderView.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit
import MapKit

final class HeaderView: UIView {

    @IBOutlet private(set) weak var mapView:   MKMapView!
    @IBOutlet fileprivate weak var topView:    UIView!
    @IBOutlet fileprivate weak var topLabel:   UILabel!
    
    // MARK: Cycle life
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: Animate
    
    public func animateAtTop() {
        UIView.animate(withDuration: 0.35) { 
            self.topView.backgroundColor = KPColor.b.color()
            self.topLabel.text = "Autour de vous"
        }
        
    }
    public func animateAtBottom() {
        UIView.animate(withDuration: 0.35) {
            self.topView.backgroundColor = KPColor.c.color()
            self.topLabel.text = "Voir carte"
        }
    }
}
