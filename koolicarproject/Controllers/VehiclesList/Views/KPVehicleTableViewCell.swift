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

final class KPVehicleTableViewCell: UITableViewCell, ReusableIdentifierCell {
    
    @IBOutlet fileprivate weak var vehicleImageView: UIImageView!
    
    static let reusableIdentifier = "KPVehicleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: Set Content
    
    func setContent(vehicle: Vehicle) {
        resetCell()
        setupImage(url: vehicle.thumbnailUrl)
    }
    
    fileprivate func setupImage(url:String) {
        Alamofire.request(url).responseImage { response in
            guard let image = response.result.value else {
                return
            }
            UIView.transition(with: self.vehicleImageView,
                              duration:0.5,
                              options: UIViewAnimationOptions.transitionCrossDissolve,
                              animations: { self.vehicleImageView.image = image },
                              completion: nil)
            
        }
    }
    
    fileprivate func resetCell() {
        vehicleImageView.image = nil
    }
    
}
