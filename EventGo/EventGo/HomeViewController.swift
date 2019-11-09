//
//  HomeViewController.swift
//  EventGo
//
//  Created by Ankit Luthra on 11/6/19.
//  Copyright © 2019 ankitluthra. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import GooglePlaces


class HomeViewController: UIViewController, UISearchControllerDelegate{
    
    var results: GMSAutocompleteResultsViewController!
    var searchController: UISearchController!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        mapView.delegate = self as? MKMapViewDelegate
        self.view = mapView
        mapView.showsUserLocation = true
        mapView.addSubview(searchBar)
      
        self.view.superview?.bringSubviewToFront(searchBar)
        searchBar.placeholder = "Search for Events"
    }

    func setsearchController(){
        results = GMSAutocompleteResultsViewController()
        searchController = UISearchController(searchResultsController: results)
        searchController?.searchResultsUpdater = results
        
        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for Places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
     searchController?.hidesNavigationBarDuringPresentation = false
        
    }


}
