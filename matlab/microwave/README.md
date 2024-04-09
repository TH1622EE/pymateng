# Microwave Engineering with MATLAB

This repository contains application specific code for various Microwave Engineering purposes. The stucture of this directory is constructed to be as similar as possible to the Python directory and subfolders containing code designed for the same purposes, with the exception of a few language specific nuances that must be understood to optimize a users ability to leverage whichever of the two they so choose. More specifically, both Python and MATLAB support object-oriented programming (OOP), but they do it in very different ways.

## OOP in MATLAB

In the following subsection we are going to define what *Namespace* and *Class* folders are, as well as how and why they are used in support of object-oriented design (OOD).

### Namespaces and Classes in MATLAB

MATLAB folders beginning with a `+` symbol are folders representing [namespaces](https://www.mathworks.com/help/matlab/matlab_oop/namespaces.html) which are used to help structure your codebase. For example, the variable $\gamma$ represents the *propagation constant* $\gamma = \alpha + j\Beta$ when in Microwave Engineering when evaluating electromagnetic (EM) waves. However, $\gamma$ is also used to represent the *Lorentz Factor* $\gamma = 1/\sqrt{1-v^2/c^2}$ in Special Relativity.

Namespaces enable us to use $\gamma$ for both values by creating *Namespaces* which contain the contextually dependent variables, functions/methods, and classes applicable to that *namespace* specifically. For a *namespace* to be accessible to MATLAB, the parent directory of the *namespace* must be on the path, **but the *namespace* directory itself cannot be added to the path.** By adding the parent directory of a *namespace* directory to the MATLAB path you make the contents of the *namespace* accessible from the command line without having to be within that directory, or having the *namespace* folder addeded to the MATLAB path itself. For example, if given the following directory structure, where MATLAB is the top-level folder:

```text
MATLAB
MATLAB/config
MATLAB/data
MATLAB/scripts
MATLAB/+Electromagnetics
```

To access a method defined in the `+Electromagnetics` *namespace* from outside the directory itself, you would do so using dot notation (i.e., `namespaceName.methodName(arg1,arg2)`). Similar to *namespace* folders, we define [*class*](https://www.mathworks.com/help/matlab/matlab_oop/organizing-classes-in-folders.html) folders with an `@` symbol which is contained within a path folder, but not defined on the MATLAB path itself. However, *namespaces* and *classes* are used extensively in OOP. 

Therefore, you can define a *class* folder within a *namespace* folder, and it will be accessible without having to be in the directory, or added to the MATLAB path. It is also important to remember that within a *class* folder there should only be one (1) class definition, but there can be additional functions defined. Furthermore, the *class* file **MUST HAVE THE EXACT SAME NAME** as the *class* folder. For exammple, a *class* folder should have a *class* file defined as follows:

`MATLAB/@MyClass/MyClass.m`

In the above example, MATLAB is the *path* folder, which is defined in the MATLAB path, but the *class* folder `@MyClass/` itself is **NOT** on the MATLAB path. Now, to create an object of the class, you would do so as follows:

`obj = MyClass(arg1,arg2);`

Once an object of the *class* exists, you would use dot-notation to execute a method within the class and save it to a variable as follows:

`varName = obj.method(arg1,arg2)`

To access a public property of the *class*, you would use dot-notation similar to the above exammple as follows:

`getValue = obj.propertyName;`

If the property of the *class* is protected or private, you would obviously create getters and setters to access those values within the class, and execute those methods to return the value of a property within a class. **Which is to say, use good OOP practices when developing your classes!**

#### Creating Classes within Namespaces (THIS CAN BE CONFUSING)

It is good practice to create your *class* folders within *namespaces* for the same reasons as we discussed for variables defined within *namespaces* above. **Even though *namespace* folders are NOT on the MATLAB path, you can and it is good practice to define your *class* files within your *class* folders, within your *namespace* folders.** Even though your *namespace* folder is **NOT** on your MATLAB path, your *class* files will still be accessible.

If given the same directory structure as above, you would define a *class* file within a *class* folder, which is contained within a *namespace* folder as follows:

```text
MATLAB
MATLAB/config
MATLAB/data
MATLAB/scripts
MATLAB/+Electromagnetics/@TL/TL.m
```

While **ONLY** the MATLAB *path* folder is actually on the MATLAB path, your class would still be accessible. The following is an example of how you would instantiate an object of the `@TL` class from the command window while in the top-level MATLAB directory:

`obj = Electromagnetics/TL/TL(arg1,arg2);`

While it is not required you create *class* folders which contain *class* files within *namespace* folders, it is recommended. However, if you were to decide to simply create a *class* folder outside of a *namespace* you would simply create the *class* folder within a folder that **is in the MATLAB path**, but the *class* folder itself **would NOT** be added to the path. For example, if you wanted a stand-alone *class* folder within the MATLAB *path* folder, you would define both the *class* folder and file (definition) as follows:

`@newClass/newClass.m`

So long as the *class* folders parent directory is in the MATLAB path, the *class* file (i.e., definition) would be accessible from the command line without having to be in the same directory as the class file.

## Summary

OOP in MATLAB takes a little getting used to when coming from a language such as Python. However, to leverage the full capability of MATLAB, it is **strongly recommended** you use good OOP practices in the development of your code base. To add to the confusion, MATLAB (like any other langugae) has its own semantics, and I recommend you read through the links provided for *namespaces* and *classes*, and more specifically the order of precedence when executing commands from the command line to prevent from unexpected and/or undesirable behavior during execution.
