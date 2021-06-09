# 🙈🙉🙊 Three Wise Monkeys 🙈🙉🙊

An exercise in obfuscated Haskell vis-a-vis a primate proverb.

## What does it do?

This program simply prints the text "siddhartha" using the [SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus). This is further obfuscated through the abuse of arbitrary Unicode identifiers, as well as the the C preprocessor.

The key to understanding how this works goes like so:

```Haskell
-- What the heck is this?
wisdom See no e vil is (no -> e -> vil) -> (no -> e) -> no -> vil
-- Well, take a look at the S combinator
type S f x y = (f -> x -> y) (f -> x) f -> y
-- Yup, the first monkey is just an obfuscated S combinator
(🙈) :: See no e vil

-- So this one should be easier
wisdom Hear no evil is no -> evil -> no
-- Compare to the K combinator
type K x y = x -> y -> x
-- Yup, the second monkey is just the K combinator (a.k.a const)
(🙉) :: Hear no evil
```

From here, we can construct the I combinator 🙊 (a.k.a. `id`), and have the whole of the SKI combinator calculus at our disposal. Additionally, I define [the B and C combinators](https://en.wikipedia.org/wiki/B,_C,_K,_W_system) for ease of use, as 🐵 and 🐒 respectively. From that point the rest is not too complex. If you wish to see which chunks of code correspond to which letters, simply undo all the ASCII art made from the monkeys and linebreak each time you see a ton of closing parenthesis, then study the repeating monkey patterns leading up to them. It will become clear that there are 10 main blobs (one for each character in "siddhartha") and each repeats the pattern `((🙈)(🐵)` equal to the character's ASCII codepoint minus 10. This rather telling pattern should make it obvious [how the rest works](https://www.reddit.com/r/haskell/comments/ypcu7/hello_world_in_ski_combinator_calculus/c5y5uvq/).

## Credit where credit is due

Inspiration is due to Sami Hangaslammi's [SKI Hello World](https://gist.github.com/shangaslammi/3438688) and the [technique used to construct it](https://www.reddit.com/r/haskell/comments/ypcu7/hello_world_in_ski_combinator_calculus/c5y5uvq/).
