import Test.HUnit

deleteRepetitions [] = []
deleteRepetitions [x] = [x]
deleteRepetitions (x:y:xs) =
  if x == y
     then deleteRepetitions (y:xs)
     else x:(deleteRepetitions (y:xs))


-- TESTS
tests = TestList [
  (TestCase (assertEqual "not correct" [4, 5, 2, 11, 2] (deleteRepetitions [4, 5, 5, 2, 11, 11, 11, 2, 2]))),
  (TestCase (assertEqual "not correct" [1] (deleteRepetitions [1]))),

  -- default check
  (TestCase (assertEqual "" True  True )) ]

run = do runTestTT tests
main = run
