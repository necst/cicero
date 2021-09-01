# Cicero
 
Cicero is a domain specific architecture that can be employed to perform exact regular expression (RE) matching using FPGAs.
The cool fact about Cicero is that - as other software libraries one among the other RE2 - does not suffer from backtracking problem.
This means that when it elaborate a REs that carry some kind of non-determinsm (e.,g. a?a ) it does not take a guess and then backtrack but can explore all the different options in a single pass of the input string.

If you are interested in the topic I will suggest you to take a look at [Russ Cox article](https://swtch.com/~rsc/regexp/regexp1.html)

Here it follows an high level overview of Cicero Engines and how they can be combined together.


![cicero_engine_multi_char](https://user-images.githubusercontent.com/6527645/131694875-59f68606-6084-4b65-82a0-9701d72bcc01.png)
![cicero_multi_new_interconnection 1](https://user-images.githubusercontent.com/6527645/131694871-a9f412b9-7bad-4db2-8179-cbaa6ee1e2fd.png)




<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
