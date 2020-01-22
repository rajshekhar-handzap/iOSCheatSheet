

// Operators

/* Stored Properties - a stored property is a constant or a variable that is a part of an instance of class and stucts. */

class SProperties {
    var name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let storeObj = SProperties(name: "Raj", age: 25)

storeObj.name = "SHekhar"

//storeObj.age = 32  // error as this is constant stored property can not be changed later in code...can change value before initialzation is complete

/* Lazy Stored Properties - A lazy stored property is a property whose initial value is not calculated until the first time it is used
   - Always declare with variable stored properties i.e 'var' keyword.
   - Constant properties cannot be lazy as its must have a value before initialization is complete
   - Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete.

 NOTE: Global constants and variables are always computed lazily, in a similar manner to  Lazy Stored Properties. Unlike lazy stored properties, global constants and variables do not need to be marked with the lazy modifier.
 */
class DataManager {
    var fileName = "abc.text"
}

class Manager {
    lazy var dataMgr = DataManager()
    var data = [String]()
}
let manager = Manager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.dataMgr.fileName)  // the instance of DataMgr is now created

/* Computed Properties - doesn't store any value, instead they provide a getter and an optional setter to retreive and set other values and properties */

struct user {
    var firstName: String
    var lastName: String

    var fullName: String {   // Computed Properties
        get {
            return firstName + " " + lastName
        }
    }
}

/* Property Observers - Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set.
 - willSet is called just before the value is stored.  - newValue
 - didSet is called immediately after the new value is stored.  - oldValue
 */

struct gymUserSteps {
    var steps: Int {
        willSet {
            print("I am going to run \(newValue) steps")
        }
        didSet {
            if steps < oldValue {
                print("I have run that much of \(steps) steps")
            }
        }
    }

    func toCheckWhetherItWillObserve(steps: inout Int) {
        steps = 10
        print("I am checking whether observers are called when passed as inout arguement")
    }

}

var gymUser = gymUserSteps(steps: 100)
gymUser.steps = 50
gymUser.toCheckWhetherItWillObserve(steps: &gymUser.steps)

/* You can also define type properties, these properties does'nt  belong to an instance of a type rather belong to type itself
    - There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.
    - You define type properties with the static keyword. For computed type properties for class types, you can use the class keyword instead to allow subclasses to override the superclass’s implementation
 */

struct TypeProperties {
    static let sProperty = "This is type Properties"
}

class TypeClassProperties {
    static var staticSPropert: String {
        return "This is static type property but not overridable"
    }
    class var sProprty: String {
        return "This is class type properties"
    }
}

class OverridableClass: TypeClassProperties {
    override class var sProprty: String {
        return "This is Overrridable class property"
    }
}

TypeClassProperties.sProprty
OverridableClass.sProprty




