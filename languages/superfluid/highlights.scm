;; Keywords
[
  "data"
  "def"
  "repr"
  "unrepr"
  "as"
  "prim"
  "case"
  "if"
  "else"
  "let"
  "do"
  "impossible"
  "to"
] @keyword

;; Conditionals
(if_expr
  "if" @conditional
  "else" @conditional)

;; Functions
(def_item
  "def" @keyword
  name: (identifier) @function)

(lambda "\\" @function)
(lambda "=>" @function)

;; Types
(data_def
  "data" @keyword
  name: (identifier) @type)

(type_term) @type
(sigma_type "*" @type.operator)
(pi_type "->" @type.operator)

;; Variables
((identifier) @type
 (#match? @type "^[A-Z]"))

;; Variables (explicitly excluding uppercase identifiers)
((identifier) @variable
 (#match? @variable "^[a-z_]"))

(variable
  ((identifier) @variable
   (#match? @variable "^[a-z_]")))

;; Parameters
(typed_binding
  ((identifier) @variable.parameter
   (#match? @variable.parameter "^[a-z_]")))
(typed_binding
  ((identifier) @type.parameter
   (#match? @variable.parameter "^[A-Z]")))

(lambda_param
  (pattern) @variable.parameter)

;; Constructors
(constructor_decl
  name: (identifier) @constructor)

;; Patterns
(pattern) @constructor

;; Operators
[
  ":"
  "="
  "<-"
  "=>"
] @operator

;; Punctuation
[
  "("
  ")"
  "["
  "]"
  "[["
  "]]"
  "{"
  "}"
  ","
  ";"
] @punctuation.bracket

;; Literals
(char_lit) @string
(string_lit) @string
(nat_lit) @number
(fin_lit) @number

;; Special
(hole "?" @special)

;; Quantities
(quantity) @constant

;; Comments
(comment) @comment

;; Tags
(tags
  "#" @punctuation.special
  (identifier) @constant)
