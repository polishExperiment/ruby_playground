### Caesar's Cipher

* accept a string and return ciphered string
* cipher should take every character and substitutes it with another character 
shifted by a number of places in the latin alphabet
* cipher is case sensitive
* when cipher takes only one argument then it is a string and it's being 
shifted by 13 (**ROT13** so that `c` becomes `p`)
* integer may be given as a second argument - it denotes how many places 
every character in a string is being shifted (3 shifts `c` to `p`)
* cipher should loop - shift by 5 moves `Z` to `E` or `x` to `c` 

__@todo__  
* add tests
