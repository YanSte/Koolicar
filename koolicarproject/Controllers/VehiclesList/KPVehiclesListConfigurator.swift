//
//  KPVehiclesListConfigurator.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright (c) 2016 koolicar. All rights reserved.
//
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension KPVehiclesListViewController: KPVehiclesListPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension KPVehiclesListInteractor: KPVehiclesListViewControllerOutput {
}

extension KPVehiclesListPresenter: KPVehiclesListInteractorOutput {
}

final class KPVehiclesListConfigurator {
    
    // MARK: Object lifecycle
    
    static var sharedInstance: KPVehiclesListConfigurator = KPVehiclesListConfigurator()
    
    // MARK: Configuration
    
    func configure(viewController: KPVehiclesListViewController) {
        let router = KPVehiclesListRouter()
        router.viewController = viewController
        
        let presenter = KPVehiclesListPresenter()
        presenter.output = viewController
        
        let interactor = KPVehiclesListInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
