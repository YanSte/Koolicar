//
//  KPVehicleTableViewCell.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ImageSlideshow

final class KPVehicleTableViewCell: UITableViewCell, ReusableIdentifierCell {
    
    @IBOutlet fileprivate weak var vehiculePlaceLabel:      UILabel!
    @IBOutlet fileprivate weak var vehiculeFuelLabel:       UILabel!
    @IBOutlet fileprivate weak var vehiculeDoorLabel:       UILabel!
    @IBOutlet fileprivate weak var vehiculeGearBoxLabel:    UILabel!
    @IBOutlet fileprivate weak var vehiculeNameLabel:       UILabel!
    @IBOutlet fileprivate weak var vehiculeCategoryLabel:   UILabel!
    @IBOutlet fileprivate weak var vehicleSlideshow:        ImageSlideshow!
    
    fileprivate var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate?
    fileprivate weak var delegate:UIViewController?
    
    static let reusableIdentifier = "KPVehicleTableViewCell"
    
    // MARK: Cycle life
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vehicleSlideshow.backgroundColor = UIColor.white
        vehicleSlideshow.slideshowInterval = 8.0
        vehicleSlideshow.pageControlPosition = PageControlPosition.hidden
        vehicleSlideshow.pageControl.currentPageIndicatorTintColor = UIColor.white;
        vehicleSlideshow.pageControl.pageIndicatorTintColor = UIColor.black;
        vehicleSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        vehicleSlideshow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(KPVehicleTableViewCell.click)))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Set Content
    
    public func setContent(delegate:UIViewController, vehicle: VehicleModel) {
        self.delegate = delegate
        
        // TODO: Ceci est un exemple pour une pagination d'images..
        vehicleSlideshow.setImageInputs(
            [
                AlamofireSource(urlString: vehicle.thumbnailUrl)!,
                AlamofireSource(urlString: vehicle.thumbnailUrl)!,
                AlamofireSource(urlString: vehicle.thumbnailUrl)!
            ])
        
        // TODO: Mettre en place NSLocalizedString String
        vehiculePlaceLabel.text     = "\(vehicle.placesCount) places"
        vehiculeDoorLabel.text      = "\(vehicle.doorsCount) portes"
        vehiculeFuelLabel.text      = "\(vehicle.fuelTypeCd == 0 ? "Essence" : "Gazole")"
        vehiculeGearBoxLabel.text   = "\(vehicle.gearsTypeCd == 0 ? "Manuelle" : "Automatique")"
        vehiculeNameLabel.text      = vehicle.brand + " " + vehicle.vehicle_model + " " + "\(vehicle.year)"
        vehiculeCategoryLabel.text  = vehicle.category
    }
    
    // MARK: Handler event
    
    public func click() {
        guard let delegate = delegate else {
            return
        }
        let ctr:FullScreenSlideshowViewController = {
            let c = FullScreenSlideshowViewController()
            c.pageSelected = {
                (page: Int) in
                self.vehicleSlideshow.setScrollViewPage(page, animated: false)
            }
            c.initialImageIndex = vehicleSlideshow.scrollViewPage
            c.inputs = vehicleSlideshow.images
            slideshowTransitioningDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: vehicleSlideshow, slideshowController: c)
            c.transitioningDelegate = slideshowTransitioningDelegate
            return c
        }()
        
        delegate.present(ctr, animated: true, completion: nil)
    }
}
