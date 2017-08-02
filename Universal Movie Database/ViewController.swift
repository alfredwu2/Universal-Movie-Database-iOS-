//
//  ViewController.swift
//  Universal Movie Database
//
//  Created by Alfred Wu on 7/29/17.
//  Copyright © 2017 Alfred Wu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, XMLParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bundle = Bundle.main
        
        //let path = bundle.path(forResource: "movies", ofType: "xml")
        //let parser: XMLParser = XMLParser(contentsOf: URL(fileURLWithPath: path!))!

        if let url = bundle.url(forResource: "movies", withExtension: "xml") {
            if let parser: XMLParser = XMLParser(contentsOf: url) {
                parser.delegate = self
                parser.parse()
            }
        }
        
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        
        switch elementName {
            
        case "movie":
            print(attributeDict["Title"] ?? "Title is missing")
            print(attributeDict["Rating"] ?? "Rating is missing")
            print(attributeDict["Runtime"] ?? "Runtime is missing")
            print("\n")
        default:
            break
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

