// Playground - noun: a place where people can play

import UIKit
import CoreImage

func getAllFilterNames(){
    var filterNames = CIFilter.filterNamesInCategories(nil)
    println("All Filters: ")
    println(filterNames);
    println("\n")
}

func getDescriptionOfTheFilter(filterName: String){

    if let filter  = CIFilter(name: filterName) {
    println("\nAttributes for the filter: \n")
    println(filter.attributes())

    println("\nInput Keys for the filter: ")
    println(filter.inputKeys())
    
    println("\nOutput Keys for the filter: ")
    println(filter.outputKeys())
    
    }
    else{
        println("\n Unfortunately filter that you are looking for is not available on this platform \n");
    }
}

getAllFilterNames()
getDescriptionOfTheFilter("CIToneCurve")
