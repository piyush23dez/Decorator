//: Playground - noun: a place where people can play

import UIKit

protocol GameInterface {
    func setup()
}

struct Mario: GameInterface {
    
    func setup() {
        print("Default mario setup")
    }
}

struct Wario: GameInterface {
    
    func setup() {
        print("Default wario setup")
    }
}


struct SuperMario: GameInterface {
    
    let interface: GameInterface
   
    init(interface: GameInterface) {
        self.interface = interface
    }
    
    func setup() {
        
        //default setup
        interface.setup()
        
        //extra work
        addMorePower()
    }
    
    func addMorePower() {
        print("Added extra power to super mario")
    }
}


let marioInterface = Mario()
let warioInterface = Wario()

let superMarioInterface = SuperMario(interface: marioInterface)
//superMarioInterface.setup()


struct YoshiDecorator: GameInterface {
    
    let interface: GameInterface
    
    init(interface: GameInterface){
        self.interface = interface
    }
    
    func setup() {
        interface.setup()
    }
    
    func addSwingPower() {
        print("Added swing power")
    }
}

let yoshiDecorator = YoshiDecorator(interface: superMarioInterface)


struct ToadDecorator: GameInterface {
    
    let interface: GameInterface
    
    init(interface: GameInterface){
        self.interface = interface
    }
    
    func setup() {
        interface.setup()
    }
}
let toadDecorator = ToadDecorator(interface: yoshiDecorator)

let yoshiWithMario = YoshiDecorator(interface: SuperMario(interface: Mario()))
yoshiWithMario.setup()





