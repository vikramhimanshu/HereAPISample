//
//  MasterViewController.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 27/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class MasterViewController: UITableViewController {

    private lazy var location = CurrentLocation()
    
    private var detailViewController: DetailViewController? = nil
    private var objects = [Stn]() {
        didSet (oldVal) {
            if oldVal != objects {
                DispatchQueue.main.async(execute: { 
                    self.tableView.reloadData()
                })
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        self.title = "Stations Around Here"
        location.requestAuthorizationIfNeeded { [weak self] (status: CLAuthorizationStatus, error: NSError?) in
            switch status {
            case .authorizedAlways, .authorizedWhenInUse :
                self?.fetchLocation()
            default:
                self?.locationErrorAlert()
                break
            }
        }
    }
    
    private func fetchLocation() {
        location.get(withCompletionBlock: { [weak self] (loc: CLLocationCoordinate2D) in
            self?.fetchTransitInfo(forLat: loc.latitude, long: loc.longitude)
        }, and: { [weak self] (status: CLAuthorizationStatus, error: NSError?) in
            self?.locationErrorAlert()
        })
    }
    
    private func fetchTransitInfo(forLat lat: Double, long: Double) {
        var service = TransitService()
        let request = TransistRequest(withLat: lat, long: long)
        
        service.fetch(request: request, successHandler: { [weak self] (data: TransitRoot) in
            if let objs = data.res?.stations?.stn {
                self?.objects = objs
            }
        }) { (responseCode: Int, error: NSError?) in
            
        }
    }
    
    private func locationErrorAlert() {
        let alert = UIAlertController(title: "Unable to determine location", message: "In order to provide you the services we would need to use your current location", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: {(action: UIAlertAction) in
            if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = objects[indexPath.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name
        return cell
    }

}

