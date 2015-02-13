class Shape {
    var numberOfSides = 0
    let name = "Shape"
 
    func setName(_name: String)
    {

    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    init(){
    
    }
}
