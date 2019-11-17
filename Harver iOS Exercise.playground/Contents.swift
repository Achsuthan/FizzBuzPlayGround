import UIKit


let words = ["start", "citizen", "flour", "circle", "petty", "neck", "seem", "lake", "page", "color", "ceiling", "angle", "agent", "mild", "touch", "bite", "cause", "finance", "greet", "eat", "minor", "echo", "aviation", "baby", "role", "surround", "incapable", "refuse", "reliable", "imperial", "outer", "liability", "struggle", "harsh", "coerce", "front", "strike", "rage", "casualty", "artist", "ex", "transaction", "parking", "plug", "formulate", "press", "kettle", "export", "hiccup", "stem", "exception", "report", "central", "cancer", "volunteer", "professional", "teacher", "relax", "trip", "fountain", "effect", "news", "mark", "romantic", "policy", "contemporary", "conglomerate", "cotton", "happen", "contempt", "joystick", "champagne", "vegetation", "bat", "cylinder", "classify", "even", "surgeon", "slip", "private", "fox", "gravity", "aspect", "hypnothize", "generate", "miserable", "breakin", "love", "chest", "split", "coach", "pound", "sharp", "battery", "cheap", "corpse", "hobby", "mature", "attractive", "rock"]


func getRandomWordSync() -> String {
    let index = randomInRange(min: 0, max: 100)
    let word = words[index]
    return word
}

func getRandomWord(slow: Bool = false, completion:@escaping(_ word: String?, _ error: String?)->()) {
    let index = randomInRange(min: 0, max: 200)
    guard let word = words[safe: index] else {
        return completion(nil, "Fatal error: Index out of range")
    }
    
    let delay = slow ? 10 : 0.0
    
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        completion(word, nil)
    }
}

func randomInRange(min: Int, max: Int) -> Int {
    return Int.random(in: min ..< max)
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

//Q1
func question1(){
    print("\nQ1 Answer = > \n")
    for i in 1...100{
        print("\(i) : \(getRandomWordSync())")
    }
}

//Q2
func question2(){
    print("\nQ2 Answer = > \n")
    for i in 1...100 {
        var randomString = ""
        if(i%15 == 0){
            randomString = "FizzBuzz"
        }
        else if(i%5 == 0){
            randomString = "Buzz"
        }else if(i%3 == 0){
            randomString = "Fizz"
        }
        else {
            randomString = getRandomWordSync()
        }
        print("\(i) : \(randomString)")
    }
    
}

func question3(){
    print("\nQ3 Answer = > \n")
    let myGroup = DispatchGroup()
    for i in 1...100 {
        var randomString = ""
        if(i%15 == 0){
            randomString = "FizzBuzz"
        }
        else if(i%5 == 0){
            randomString = "Buzz"
        }else if(i%3 == 0){
            randomString = "Fizz"
        }
        else {
            myGroup.enter()
            getRandomWord(slow: true) { (word, error) in
                if let val = word{
                    randomString = val
                }
                else {
                    randomString = ""
                }
                myGroup.leave()
            }
        }
        myGroup.notify(queue: .main) {
            print("\(i) : \(randomString)")
        }
    }
}

func question4(){
    print("\nQ4 Answer = > \n")
    let myGroup = DispatchGroup()
    for i in 1...100 {
        var randomString = ""
        if(i%15 == 0){
            randomString = "FizzBuzz"
        }
        else if(i%5 == 0){
            randomString = "Buzz"
        }else if(i%3 == 0){
            randomString = "Fizz"
        }
        else {
            myGroup.enter()
            getRandomWord(slow: true) { (word, error) in
                if let val = word{
                    randomString = val
                }
                else {
                    randomString = "It shouldn't break anything!"
                }
                myGroup.leave()
            }
        }
        myGroup.notify(queue: .main) {
            print("\(i) : \(randomString)")
        }
    }
}

question1()
//question2()
//question3()
//question4()



//Q5 and Q6 in the git link  https://github.com/Achsuthan/FizzBuz.git
