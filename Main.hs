module Main where

import BiTree (BinaryTree(..), Wallet(..), insert, delete, findMin, findMax, printTree)
import Data.UUID (fromString)
import Control.Monad (foldM)

main :: IO ()
main = do
    let wallets = [ Wallet "Alice" 100
                  , Wallet "Bob" 50
                  , Wallet "Charlie" 200
                  , Wallet "David" 25
                  , Wallet "Eve" 300
                  , Wallet "Frank" 150
                  , Wallet "Grace" 75
                  , Wallet "Hannah" 225
                  , Wallet "Ivan" 175
                  , Wallet "Jack" 125
                  ]
    
    -- Insert wallets into the tree
    tree <- foldM (flip insert) Empty wallets
    
    -- Print the tree
    putStrLn (printTree tree 0)
    
    -- Find minimum and maximum wallets
    putStrLn "Minimum:"
    print (findMin tree)
    
    putStrLn "Maximum:"
    print (findMax tree)

    -- Delete a wallet from the tree
    let Node uuid1 _ _ _ _ _ = tree
    let newTree = delete uuid1 tree

    putStrLn "Tree after deleting Alice:"
    putStrLn (printTree newTree 0)
