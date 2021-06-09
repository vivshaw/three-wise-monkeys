# 🙈🙉🙊 Three Wise Monkeys 🙈🙉🙊

An exercise in obfuscated Haskell vis-a-vis a primate proverb.

## What does it do?

This program simply prints the text "siddhartha" using the [SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus). This is further obfuscated through the abuse of arbitrary Unicode identifiers, as well as the the C preprocessor.

The key to understanding how this works goes like so:

```Haskell
-- What the heck is this?
wisdom See no e vil is (no -> e -> vil) -> (no -> e) -> no -> vil
-- Well, take a look at the S combinator:
type S f x y = (f -> x -> y) -> (f -> x) -> f -> y
-- Yup, the first monkey is just an obfuscated S combinator
(🙈) :: See no e vil

-- So this one should be easier:
wisdom Hear no evil is no -> evil -> no
-- Compare to the K combinator:
type K x y = x -> y -> x
-- Yup, the second monkey is just the K combinator (a.k.a const)
(🙉) :: Hear no evil
```

From here, we can construct the I combinator 🙊 (a.k.a. `id`), and have the whole of the SKI combinator calculus at our disposal. Additionally, I define [the B and C combinators](https://en.wikipedia.org/wiki/B,_C,_K,_W_system) for ease of use, as 🐵 and 🐒 respectively. From that point the rest is not too complex. If you wish to see which chunks of code correspond to which letters, simply undo all the ASCII art made from the monkeys and linebreak each time you see a ton of closing parenthesis, then study the repeating monkey patterns leading up to them. It will become clear that there are 10 main blobs (one for each character in "siddhartha") and each repeats the pattern `((🙈)(🐵)` equal to the character's ASCII codepoint minus 10. This rather telling pattern should make it obvious [how the rest works](https://www.reddit.com/r/haskell/comments/ypcu7/hello_world_in_ski_combinator_calculus/c5y5uvq/).

## Obfuscation techniqes

### Unicode abuse

Haskell is generous. Haskell loves you. Haskell allows arbitrary Unicode characters in identifiers and operators, because you deserve it.

 - Type names and variable names can have any Unicode letter or number in them, with the caveat that types must start with a `C`apital letter, and variables must start with a `l`owercase letter. As it turns out, you can use things like Hanzi, hangul, or kana as well- Haskell simply treats them as lowercase letters.
 - Operators names can have any non-special unicode symbol (pretty much everything except ``()|,;[]`{}_:"'``), including emoji. However YMMV - some symbols or combinations thereof will make GHCI wig out, especially anything 'bracket-like'.

### `{-# LANGUAGE CPP #-}`

With this GHC extension, we can run the C preprocessor on our Haskell source before compilation. This allows a large number of unusual substitutions that *don't* need to follow the rules of regular Haskell syntax, but *do* require obeying C identifier rules. As an added bonus, the behavior may be platform-dependent based on whether your system runs `clang` or `gcc`.

### the SKI combinatory calculus

anything written with combinatory logic is obfuscated by default lol

## Do you have any suggestions to further beautiful, comfound, or obfuscate?

PR's welcome if there's any other ~"FUN"~ things you can make GHC do. I didn't look too far into TH, rewrite rules, or RebindableSyntax.

## Credit where credit is due

Inspiration is due to Sami Hangaslammi's [SKI Hello World](https://gist.github.com/shangaslammi/3438688) and the [technique used to construct it](https://www.reddit.com/r/haskell/comments/ypcu7/hello_world_in_ski_combinator_calculus/c5y5uvq/).
