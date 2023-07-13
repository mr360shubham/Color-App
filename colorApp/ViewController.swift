//
//  ViewController.swift
//  colorApp
//
//  Created by Shubham Baliyan on 23/06/23.
//

import UIKit

class ViewController: UIViewController {
   
    var colors : [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    
    func addRandomColors (){
        for _ in 0..<50{
            colors.append(createRandomColors())
        }
    }
    
        
        func createRandomColors() -> UIColor{
            var randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                      green: CGFloat.random(in: 0...1 ),
                                      blue: CGFloat.random(in: 0...1),
                                      alpha: 1
                                    )
            return randomColor
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destVC = segue.destination as! colorsDetailVC
            destVC.color = sender as? UIColor
        
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell")
        else{
            return UITableViewCell()
        }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: "ToColorsDetailVC", sender: color)
    }
}

