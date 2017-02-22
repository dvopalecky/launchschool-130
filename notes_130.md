# Danny's notes for 130 Course

## Closure
- closure: save chunk of code and be able to call it later
  - like a method without a specific name
  - retains references to its binding - surrounding artifacts (methods, variables, objects)
  - Ruby uses `Proc` object
  - 3 ways to work with closures in Ruby
    - instantiating `Proc` object
    - using lambdas
    - using blocks

## Blocks
- surrounded by `do` and `end` or `{ }`
- blocks are passed as arguments to methods
- every method can take block as optional block as implicit parameter
- `yield` to call block which was passed to a method
- `yield(arguments)` to call block with arguments
- block returns a value
- `block_given?` to determine if block was passed to method
- block local variable, e.g. `|num|` - careful about naming, should not name collide with other variables

## Other
- you can define alias of a method by `alias_method :method1, :method2`
- HereDocuments
  - e.g.
```
expected_result = <<HEREDOC
  whatever text
  on multiple lines
HEREDOC
```

## Minitest
- in test file, put
  - `require 'minitest\autorun'`
  - `require_relative 'file_to_test.rb'`
- test classes inherit from `Minitest::Test`
- each test method must start with `test_`
- make assertions inside test method
  - `assert_equal(expected, actual)` uses `==`
  - `assert_same()` for object equality
  - `assert_nil(expected)`
  - `assert_raises(expected_exception) { ... }`
  - `assert_instance_of(cls, obj)`
  - `refute_equal(expected, actual)`
- skip tests with `skip` keyword in the test definition
- SEAT approach
  - `setup`
  - execute
  - assert
  - `teardown`
