import Test.Hspec
import Data.Char (isUpper)
import Data.List (intercalate, init, last)

main = hspec $ do
    describe "greeting" $ do    
        it "should say Hello Bob when given Bob" $ do
            greet ["Bob"]  `shouldBe`  "Hello, Bob."
            greet ["Mark"]  `shouldBe`  "Hello, Mark."
        it "should say Hello my friend when no name given" $ do
            greet []  `shouldBe` "Hello, my friend." 
        it "should shout when given a name in uppercase" $ do
            greet ["JERRY"] `shouldBe` "HELLO JERRY!"
            greet ["MARY"] `shouldBe` "HELLO MARY!"
        it "should say hello to two people" $ do
            greet ["Jill","Jane"] `shouldBe` "Hello, Jill and Jane."
        it "should say hello to more than two people" $ do
            greet ["Amy","Brian","Charlotte"]  `shouldBe` "Hello, Amy, Brian, and Charlotte." 
            greet ["Dave","Eric","Fred"]  `shouldBe` "Hello, Dave, Eric, and Fred."
        

sayHello name = "Hello, " ++ name ++ "." 

shoutHello name = "HELLO " ++ name ++ "!"

greet [name] | all isUpper name  = shoutHello name
greet [name] = sayHello name
greet []     = sayHello "my friend"
greet [n,m]  = sayHello (n ++ " and " ++ m) 
greet names = greet [firstNames, last names]
    where firstNames = intercalate ", " (init names) ++ ","
