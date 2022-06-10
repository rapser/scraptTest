//
//  ViewController.swift
//  ScrappTest
//
//  Created by miguel tomairo on 5/06/22.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
    
    let baseUrl = "https://diariamenteali.com"

    override func viewDidLoad() {
        super.viewDidLoad()

     
        do {
            guard let url = URL(string: "https://diariamenteali.com/") else {return}
            let html = try String(contentsOf: url)
            
            let document = try SwiftSoup.parse(html)
            
            let p: Element = try document.select("main").first()!
            
            let q: Element = try document.select("img[src]").first()!


            let tabnews: Element = try p.select("#tabnews").first()!
            let tabideas: Element = try p.select("#tabideas").first()!
            let tabnutritive: Element = try p.select("#tabnutritive").first()!

            let g : Element = try p.select("div").attr("class", "alicorp-product__item--thumb").first()!

            print(try g.className())

            if let imageLink = try q.select("img").first(){
                let src = try imageLink.attr("src")
                print("https://diariamenteali.com\(src)")
            } else {
                print("Try break the html your self")
            }
            
            
            let b: Element = try tabnews.select("ul").first()!
            let news: [Element] = try b.select("li").array()

            let b2: Element = try tabideas.select("ul").first()!
            let ideas: [Element] = try b2.select("li").array()
            
            let b3: Element = try tabnutritive.select("ul").first()!
            let nutritives: [Element] = try b3.select("li").array()
                        
            for j in news{
                let e: Element = try j.select("a").first()!
                print(try e.attr("title"))
                print(try e.attr("href"))
                let image: Elements = try e.select("div").attr("class", "item__image lazy")
                print(try image.attr("data-bg").replacingOccurrences(of: "url(", with: baseUrl))
            }

            print("------------------------------")

            for j in ideas{
                let e: Element = try j.select("a").first()!
                print(try e.attr("title"))
                print(try e.attr("href"))
                let image: Elements = try e.select("div").attr("class", "item__image lazy")
                print(try image.attr("data-bg").replacingOccurrences(of: "url(", with: baseUrl))
            }

            print("------------------------------")

            for j in nutritives{
                let e: Element = try j.select("a").first()!
                print(try e.attr("title"))
                print(try e.attr("href"))
                let image: Elements = try e.select("div").attr("class", "item__image lazy")
                print(try image.attr("data-bg").replacingOccurrences(of: "url(", with: baseUrl))
            }
            
            
        }catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        }catch {
            print("")
        }
        
    }


}

