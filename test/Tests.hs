import Test.Hspec (describe, it, shouldBe,)
import Test.Hspec.Runner (defaultConfig, hspecWith)

import ThreeWiseMonkeys

-- type See no e vil = (no -> e -> vil) -> (no -> e) -> no -> vil

main :: IO ()
main = hspecWith defaultConfig $ do
  --describe "🙊" $ do
  --  it "Mizaru should be the S combinator" $ do
  -- figure out how to test this

  describe "🙊" $ do
    it "Kikazaru should be the K combinator" $ do
      -- the K combinator can be spelled as `const`
      let first = 1
      let second = 2
      (🙉) first second `shouldBe` const first second

  describe "🙊" $ do
    it "Iwazaru should be the I combinator" $ do
      -- the I combinator can be spelled as `id`
      let first = 1
      (🙊) first `shouldBe` id first
  
  --describe "🐒" $ do
  --  it "Monkey emoji should be the C combinator" $ do
  -- figure out how to test this

  --describe "🐵" $ do
  --  it "Monkey face emoji should be the B combinator" $ do
  -- figure out how to test this