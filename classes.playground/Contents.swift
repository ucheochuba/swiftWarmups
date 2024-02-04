import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("bark, bark")
    }
}

class Corgi: Dog {

}

class Poodle: Dog {

}

class Cat: Animal {
    func speak() {
        print("meow, meow")
    }
}

class Persian: Cat {

}

class Lion: Cat {

}

var myDog = Dog(legs: 4)
myDog.speak()
