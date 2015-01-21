//Assignment
/*
Create a set of classes (Rectangle, Square, Circle, Triangle) that can be used for computing perimiter and are of shapes. All mentioned before classes inherit from the Shape class that defines two operations, area()-> Double, and perimeter()->Double and property called name.

Keep in mind that classes will have to override the default initializer located in Shape method. Also create new constructors that will be passing values helpful in creating classes, for example constructor for Rectangle class will be different than constructor of Circle or triangle class. Create several objects, add it to the Array<Shape>, loop through it printing the values of area and perimiter and name of the class.

You can use the Shape class below or use protocol 
*/

class Shape{
    var name = "Shape"
    func area()->Double {return 0}
    func perimeter()->Double {return 0}
}
