(comment) @comment
(note) @comment.doc

[
  "include"
  "type"
  "with"
  "namespace"
  "abstract"
  "concrete"
  "begin"
  "end"
  "block"
] @keyword

(class) @keyword

(class
  "@" @keyword
  name: (identifier) @keyword)

(action) @keyword

(action
  "#" @keyword
  name: (identifier) @keyword)

(qualified_identifier
  space: (identifier) @namespace
  name: (identifier) @variable)

(statement
  (index
    (identifier) @variable.definition))

(namespace_block
  name: (identifier) @namespace)

(include_statement
  source: (quoted_string) @string.special)

(include_statement
  source: (file_path) @string.special)

(pair
  key: (identifier) @property)

((pair
  key: (identifier) @property.special)
  (#match? @property.special "^(units|output|compartment|isAmount|actors|modifiers|slope)$"))

[
  (boolean)
  (null)
] @constant.builtin

((identifier) @constant.builtin
  (#match? @constant.builtin "^(Infinity|NaN|pi|e)$"))

(number) @number
(quoted_string) @string
(title) @string.special
((pair
  key: (identifier) @property.special
  value: (metadata_value
    (identifier) @string.special))
  (#match? @property.special "^units$"))

((pair
  key: (identifier) @property.special
  value: (metadata_value
    (unit_fragment) @string.special))
  (#match? @property.special "^units$"))

((pair
  key: (identifier) @property.special
  value: (metadata_value
    (metadata_raw) @string.special))
  (#match? @property.special "^units$"))

((pair
  key: (identifier) @property.special
  value: (metadata_value
    (number) @string.special))
  (#match? @property.special "^units$"))

(call_expression
  function: (identifier) @function)

(assignment_operator) @operator
(process_arrow) @operator

[
  "+"
  "-"
  "*"
  "/"
  "^"
  "%"
  "=="
  "!="
  "<="
  ">="
  "<"
  ">"
  "&&"
  "||"
  "and"
  "or"
] @operator

[
  "{"
  "}"
  "["
  "]"
  "("
  ")"
] @punctuation.bracket

[
  ","
  ":"
  ";"
  "::"
] @punctuation.delimiter

(switch_assignment_operator) @operator

(switch_assignment_operator
  "[" @operator
  "]=" @operator)

((identifier) @function
  (#match? @function "^(V_|v_)[A-Za-z0-9_]*$"))
