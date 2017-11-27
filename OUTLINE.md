1. Intro
   1. Winchester Mystery House
1. Bad Names
   1. Table names != schema names
   2. Column names != field names (`:source`)
2. Bad Types
   1. Float => Decimal
   2. Unix Timestamps
   3. Comma Separated Lists
   4. JSON Strings
      * TODO: read up on embedded schemas
3. Bad Structure
   1. Tables that shoudn't exist
      1. It's okay to omit caches
      2. Join table to custom type - `order_statuses`
   2. Tables that don't exist but should
      1. Structs not schemas
      2. `to_whatever/1` methods
   3. TODO: read up on `virtual: true`
4. Conclusion (Putting it all together?)
