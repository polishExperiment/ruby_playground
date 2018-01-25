### Group students into passed and failed.

---

Write a function that returns hash of failed and passed students.

**Requirements:**
* function takes 2 arguments:
  * first argument is a hash of students and their grades
  * second argument is a threshold that divides students between
those who passed and those who failed
* function returns hash with two keys - `:failed` and `:passed`, each containing
hash with failed and passed students
* function should work flawlessly even when second argument is a string

**Example usage:**  
```ruby
hash = {"Mark" => 10, "Ellen" => 65, "Roger" => 20, "Mike" => 70}
passed_or_failed(hash, "65")
```

__Output__:  
```ruby
=> { passed: { "Ellen" => 65, "Mike" => 70 }, failed: { "Mark" => 10, "Roger" => 20 } }
```
