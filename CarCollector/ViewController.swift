//
//  ViewController.swift
//  CarCollector
//
//  Created by Work on 21/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cars : [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        performSegue(withIdentifier: "addUpdateSegue", sender: car)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CarViewController
        nextVC.car = sender as? Car
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let car = cars[indexPath.row]
        cell.textLabel?.text = car.title
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.image = UIImage(data: car.image as! Data)
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            cars = try context.fetch(Car.fetchRequest())
            tableView.reloadData()
        } catch{
            
        }
        
    }
    
}


