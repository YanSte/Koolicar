//
//  KPVehiclesListViewController.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright (c) 2016 koolicar. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import MXParallaxHeader
import MapKit

public protocol KPVehiclesListViewControllerInput {
    func displayVehicles()
    func displayFailVehicles(description:String)
}

public protocol KPVehiclesListViewControllerOutput {
    var vehicles: [VehicleModel] { get }
    func fetchVehicleData()
    func fetchFilteredVehicleData(coordinates:[CLLocationCoordinate2D])
}

final class KPVehiclesListViewController: KPGenericViewController, KPVehiclesListViewControllerInput {
    
    @IBOutlet fileprivate weak var tableView:   UITableView!
    @IBOutlet fileprivate weak var topView:     UIView!
    fileprivate weak var headerView:HeaderView!
    
    var output: KPVehiclesListViewControllerOutput!
    var router: KPVehiclesListRouter!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        KPVehiclesListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setToolbarHidden(true, animated: false)
        setupHeaderView()
        setupTableView()
        AnimateWaitView.animateIn(delegateView: view)
        output.fetchVehicleData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: Event handling
    
    func actionTapScrollToTop() {
        tableView?.setContentOffset(CGPoint.zero, animated: true)
    }
    
    // MARK: Display logic
    
    func displayVehicles() {
        AnimateWaitView.animateOut(delegateView: view)
        tableView.reloadData()
    }
    
    func displayVehiclesMap() {
        for v in output.vehicles {
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = v.location
            dropPin.title = v.brand + " " + v.vehicle_model
            headerView.mapView.addAnnotation(dropPin)
        }
        
        if let v = output.vehicles.first {
            let span = MKCoordinateSpanMake(0.08, 0.08)
            let region = MKCoordinateRegion(center: v.location, span: span)
            headerView.mapView.setRegion(region, animated: true)
        }
    }
    
    func displayFailVehicles(description:String) {
        UIAlertController.openKPStandardAlert(delegate: self, title: "Un erreur c'est produite", message: description, buttonCancel: "Ok")
    }
    
    // MARK: ScrollView
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if  scrollView.parallaxHeader.progress > -0.82 {
            topView.isUserInteractionEnabled = false
            headerView.animateAtTop()
        } else {
            topView.isUserInteractionEnabled = true
            headerView.animateAtBottom()
        }
    }
    
    // MARK: Setup
    
    func setupHeaderView() {
        headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as? HeaderView
        headerView.mapView.delegate = self
        topView.addTapGesture(target: self, action: #selector(KPVehiclesListViewController.actionTapScrollToTop))
    }
    
    func setupTableView() {
        tableView.parallaxHeader.view = headerView
        tableView.parallaxHeader.height = 365
        tableView.parallaxHeader.mode = MXParallaxHeaderMode.fill
        tableView.parallaxHeader.minimumHeight = 64
        tableView.register(UINib(nibName: KPVehicleTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: KPVehicleTableViewCell.reusableIdentifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 400
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension KPVehiclesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let vehicleAtIndex = output.vehicles.get(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: KPVehicleTableViewCell.reusableIdentifier) as? KPVehicleTableViewCell
            else {
                return getCellError()
        }
        cell.setContent(delegate: self, vehicle: vehicleAtIndex)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.vehicles.count
    }
}

// MARK: - MKMapViewDelegate

extension KPVehiclesListViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        output.fetchFilteredVehicleData(coordinates:
            mapView.annotations(in: mapView.visibleMapRect).flatMap({ ($0 as? MKAnnotation)?.coordinate })
        )
    }
}
