//
//  TrafficDataViewController.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 1/03/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class TrafficDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var cordinates: CLLocation?
    
    internal var data = [TRAFFICITEM]() {
        didSet(oldVal) {
            if data != oldVal {
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Traffic Information"
        
        let nib = UINib(nibName: TrafficDetailTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TrafficDetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let loc = cordinates?.coordinate {
            fetchTransitInfo(forLat: loc.latitude, long: loc.longitude)
        } else {
            locationErrorAlert()
        }
    }

    private func locationErrorAlert() {
        let alert = UIAlertController(title: "Unable to determine location", message: "In order to provide you the services we would need to use your current location", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchTransitInfo(forLat lat: Double, long: Double) {
        var service = TrafficService()
        let request = TrafficRequest(withLat: lat, long: long)
        
        service.fetch(request: request, successHandler: { [weak self] (data: TrafficRoot) in
            if let trafficItems = data.trafficItems?.trafficItem {
                self?.data = trafficItems
            }
        }) { (responseCode: Int, error: NSError?) in
            
        }
    }
}

extension TrafficDataViewController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return TrafficDetailTableViewCell.sizeFromNib().height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TrafficDetailTableViewCell.sizeFromNib().height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TrafficDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: TrafficDetailTableViewCell.identifier, for: indexPath) as! TrafficDetailTableViewCell
        
        if indexPath.row <= data.count {
            let object = data[indexPath.row]
            cell.pupulate(data: object)
        }
        return cell
    }
    
}
