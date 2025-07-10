# Document

Generates documentation for Ruby code using YARD with 100% coverage enforcement.

## Commands

Generate documentation:
```bash
bundle exec rake yard
```

Format YARD comments:
```bash
bundle exec rake yard:format
```

Verify 100% documentation coverage:
```bash
bundle exec rake verify_measurements
```

Check for documentation quality issues:
```bash
bundle exec rake yard:junk
```

Generate coverage report:
```bash
bundle exec rake yardstick_measure
```

## Configuration

Requires `.yardstick.yml` in project root with 100% threshold:
```yaml
threshold: 100
rules:
  ApiTag::Presence: { enabled: true }
  ApiTag::Inclusion: { enabled: true }
  ApiTag::ProtectedMethod: { enabled: true }
  ApiTag::PrivateMethod: { enabled: true }
  ExampleTag: { enabled: true }
  ReturnTag: { enabled: true }
  Summary::Presence: { enabled: true }
  Summary::Delimiter: { enabled: true }
```

## Coverage Report

After running measurement, check detailed line-by-line issues:
```bash
cat measurements/report.txt
```

Report shows specific file, line number, method, and documentation issues that need fixing.

## Documentation Standards

### Required Tags
- Every public/private method, class, and module requires `@api public` or `@api private`
- All parameters: `@param name [Type] Description`
- All returns: `@return [Type] Description` (use `[void]` if no return)
- Examples required for all public methods: `@example Description`
- Error conditions: `@raise [ExceptionClass] When this occurs`

### Type Notation
- Use `String` not `string`
- Arrays: `Array<String>` for string arrays
- Hashes: `Hash{String=>Object}` for hash types
- Use `Boolean` not `bool`, `Integer` not `int`
- Nullable types: `String, nil` or `String|nil`

### Formatting Rules
- Blank lines required between YARD tag groups
- Exception: `@param` and `@option` tags can be grouped together
- Wrap class/method names in `+` markers: `+PrivateKey+`
- Cross-reference related methods: `@see #other_method`

### Documentation Structure
```ruby
# Brief one-line summary ending with period.
#
# @api public
#
# @example Description of example
#   code_example
#   result # => expected_output
#
# @param name [Type] Description
# @param other [Type] Other description  
#
# @return [Type] Description
#
# @raise [ExceptionClass] When this exception occurs
#
def method_name
end
```

## Integration

Documentation verification is included in the quality assurance pipeline:
```bash
bundle exec rake qa
```