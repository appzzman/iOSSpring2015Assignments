//
//  LocationsModel.swift
//  UWFMap
//
//  Created by Janusz Chudzynski on 2/23/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import Foundation



class Location{
    var image1 = "warsaw1.jpg"
    var image2 = "warsaw2.jpg"
    var description = "Warsaw, is the capital and largest city of Poland. It is located on the Vistula River, in east-central Poland. Its population is estimated at 1.729 million residents within a greater metropolitan area of 2.666 million residents, which makes Warsaw the 9th most populous capital city in the European Union. The first historical reference to Warsaw dates back to the year 900/1000 (9th/10th) century."
    var latitude = 52.233
    var longitude = 21.0167
    var title = "Warsaw"
}


class MyLocationsManager{
    var locations = [Location]()
    
    init(){
        
        var warsaw:Location = Location()
        warsaw.image1 = "warsaw1.jpg"
        warsaw.image2 = "warsaw2.jpg"
        warsaw.description = "Warsaw, is the capital and largest city of Poland. It is located on the Vistula River, in east-central Poland. Its population is estimated at 1.729 million residents within a greater metropolitan area of 2.666 million residents, which makes Warsaw the 9th most populous capital city in the European Union. The first historical reference to Warsaw dates back to the year 900/1000 (9th/10th) century."
        warsaw.latitude = 52.233
        warsaw.longitude = 21.0167
        warsaw.title = "Warsaw"
        
        locations.append(warsaw)
        
        var sj:Location = Location()
       sj.image1 = "puertorico1.jpg"
       sj.image2 = "puertorico2.png"
       sj.description = "San Juan is the capital of most populous city in Puerto Rico.  Founded in 1521 and located on the Northern Coast of the island.  The population is estimated at 395,362 residents, out of 3.7 million residents of Puerto Rico.   San Juan metropolitan area has facilities for petroleum and sugar refining, brewing and distilling and produces cement, pharmaceuticals, metal products, clothing and tobacco.  San Juan is center of Caribbean shipping and is the 2nd largest sea port in the area (after New York City).  Most of San Juan history comes from 1493 when Spain conquered Puerto Rico.  Later 1898 during Spanish-American War, Spanish commissions met in San Juan to discuss cession of the island to USA.  In 1917 Puerto Rico became US territory (“organized but unincorporated”) and Puerto Ricans were granted citizenship."
     
        sj.latitude = 18.450
        sj.longitude = -66.0667
        sj.title = "San Juan"
        
        locations.append(sj)
        
        
        
    }

}