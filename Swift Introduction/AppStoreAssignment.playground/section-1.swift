// Playground - noun: a place where people can play

import UIKit



//Create a Swift playground with a model that simulates how AppStore works.
/*
    Model should consists of three classes
    Developers
    Apps
    AppStore

    App store will have following rules:
        Developers have following properties and capabalities:
            they have unique id (Int)
            they can create apps
            they can transfer apps to other developer, which means that they can receive apps from other developers as well
            they can submit apps to the AppStore
            they own a bank account that is presented as profit (Double)

    Apps have following properties:
        developer (owner of the application)
        name (name of the app)
        price (price of the app)

    AppStore have following properties
        apps (collection ofthe apps submitted and approved to the app store)
        profit variable that stores profit of the store
        submission process (developers can submit apps to the store but they are not always accepted. Use an arc4random_uniform function to randomize the submission process

        every day customers buy apps from the App Store. Use an arc4random_uniform function to choose randomly which apps will be sold on the store and how many apps are sold. When the apps are sold app store receives 30% of the revenue and 70 percent of the revenue goes to the developer.


        every day it will computes number of sold copies and send information to developer

        when developer submits the app to the store, and submission is successful AppStore should update its app listings represented as array of apps

    
    Scoring:
    
    Valid structure of Classes (50%)
    Submission process (10%)
    Randomized process of selling apps(10%)
    Transferring apps between developers (10%)
    Testing behavior of the store (20%)

*/



class AppStore
{

    var apps:[App] = []
    var profit:Double = 0.0
    
    func submit(app:App)->Bool{
        var approved = false
        var random = arc4random_uniform(2)
        if random == 1 {
            apps.append(app)
            
            return true
        }
        return false;
            
    }
    
    /*Randomly select the app and sell it. It has to update the balance of Apple and Developer's salary */
    func sellApps()
    {
        var randomNumber = Int(arc4random_uniform(40))
        
        for index in  0 ... randomNumber {
            var randomIndex = Int(arc4random_uniform(UInt32(apps.count)))
            var app =  apps[randomIndex]
            app.developer.receiveCheck(app.price * 0.7)
            self.profit = self.profit + app.price * 0.3
        }
        
        println("balance at the end of the day is \(self.profit)")
    }
    
    
}


class App{
    var name:String
    var price:Double
    var developer:Developer
    
    
    init(developer:Developer, price:Double, name:String){
        self.name = name
        self.developer = developer
        self.price = price
    }
    
}

class Developer{

    var apps: [App] = []
    var profit = 0.0
    var id:Int
    init(id:Int){
        self.id = id
    }
    
    func developApp(name:String, price:Double)->App
    {
        var app = App(developer: self, price: price, name: name);
        apps.append(app)
        return app;
    }
    
    func submitToAppStore(app:App, appstore:AppStore)->Bool
    {
        return appStore.submit(app)
    }
    
    func receiveCheck(checkAmount:Double){
        self.profit += checkAmount
        println("Received check \(checkAmount)")
        println("Developer's profit is \(self.profit)")
    }

    func transferFrom(app:App, developer: Developer){
    
        if(app.developer.id != self.id ){
            self.apps.append(app)
        }
    }
    func transferTo(app:App, developer: Developer){
        //check if app belongs to developer
        if(app.developer.id == self.id)
        {//if yes transfer it
            developer.apps
        }
       
    }
    
}

//Create an instance of the appstore
var appStore: AppStore = AppStore()

//Create several developers objects
var developer:Developer = Developer(id: 1)
var developer2:Developer = Developer(id: 2)

//Developer develops several apps
var app:App = developer.developApp("Facebook", price: 1)
var app1:App = developer.developApp("Candy Crush", price: 10)
var app2:App = developer.developApp("Google Drive", price: 11)


//Developer submits apps to the appstore. It might take more attempt but he doesn't give up until attempt is successful
var try = true
while(try){
    try = developer.submitToAppStore(app, appstore: appStore)
}
try = true
while(try){
    try = developer.submitToAppStore(app1, appstore: appStore)
}
try = true
while(try){
    try = developer.submitToAppStore(app2, appstore: appStore)
}

//Apps are sold on the App Store
appStore.sellApps()
appStore.sellApps()
appStore.sellApps()
appStore.sellApps()


//some of the apps are transferred to other developer
developer.transferTo(app, developer: developer2);

//prints apps that belong to second developer
println(developer2.apps)













