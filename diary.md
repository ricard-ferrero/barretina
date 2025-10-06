# Diary and notes

Here is some notes of what I've been doing, not only for share but also for remember why I took some specific decisions.

I work on this project only in my spare time, that means a lot of time between work sessions and the necessity to review past sessions.

Note: the entries are in reverted order, like the entries of a blog.

## 06/10/2025

First time I put into the window the coordenate lines. Experimenting with that and origin.

## 24/09/2025

### Upgrading Gem

Today I've reviewed some tests, and create the Rakefile. At the moment, it only runs the tests.

I updated the README file and also upgrade the gem to `v0.2.1`.

### Starting the real app

Then, after upgrading and finishing the algebraic classes to work with 2D vector spaces, I buid the firsts elements for the real app, starting with the UI.

One important thing it's that I had defined an architecture for the project (but, at the moment, it's drawn in a paper, not digital).

### TO DO
- Review the architecture and add in the documentation

## 23/09/2025

I noticed that to define a constant `Vector2D::ZERO` as a vector zero has no sence: every instance can change his own public attributes, then the `Vector2D::ZERO` can be a vector with coordenates non zero.

For that reason, I removed that constant.

I also add the class method `Vector[]`, and performed non important methods for `Line` like `Line#to_s`, and compare methods like `Line#==` and `Line#!=`.

Finished tests:
- `TestLine`
- `TestLine2D`
- `TestPolygon`

### New versions gem

After I made the half of the updates, I pushed a new version `v0.1.2`, but later I had finished the most important algebraic elements to be able to start with the UI.

For that reason, I decided to push another version, but in this case increasing the minor number of the version: `v0.2.0`.

## 20/09/2025

New instance methods:
- `Vector2D#add!`
- `Vector2D#substract!`
- `Vector2D#scalar!`

New class methods:
- `Vector2D[]`
- `Vector2D.zero`

New constants:
- `Vector2D::ZERO`

Also completed the tests for `Vector2D` class.

## 19/09/2025

In order to improve the efficiency of the code, I did some benchmarks. I discovered that using `rescue` the performance decrease. The difference is not to wide, but I think that decision can be definitive when rendering a lot of vectors.

With the same ambition, I had to rewrited the following functions for `Vector2D`:
- +
- -
- *
- ==
- !=

And also I have decided to remove the extensions I built to integers and other numeric types, which I used to write scalar products like mathematician notation.

## 30/08/2025

### Structure problems

#### `VectorSpace` out from `Barretina`

I noticed that the structure was confusing because of the modules (like `VectorSpace`) are out from the `Barretina` module.

When I began the project, I focused to prepare the mathematics concepts into a specefic module, and then require it to construct the app. But, at the moment, I'm not sure to keep it as a separated module, and for that reason I packaged all into the `Barretina` module.

Maybe in the future, if I think it's really useful, I separate both and create a new Ruby Gem only to work with vector spaces.

Note: exists a lot of gems to manage vectors and geometry, but them have been abandoned in 2010 or 2013. I don't use it in order to improve my dev skills -and because I enjoy to code my apps. Is an option to separate the module `VectorSpace` into a different gem an publish it, but not now.

#### `VectorSpace2D` out from `VectorSpace`

When I started with `Vector2D` class, I put into `VectorSpace` module. But I will need more 2D classes, and I created a VectorSpace2D module.

At the begging, I put that module into `VectorSpace`, as a component inside a bigger concept. But it doesn't work correctly in the structure. I need to separate both, and use `VectorSpace2D` as a module which use `VectorSpace` as the classes works with inheritance, like a clone from `VectorSpace` but more oriented to 2D objects.

### Vector2D tests

I started a test file for `Vector2D`. It covers the few functionalities that class provide to the standard `Vector` class.

### `Line2D` and `Polygon` for `VectorSpace2D`

There are two important maths objects to start rendering 2D objects: lines and polygons. Of course, the last is a combination of lines -and, at the same time, a combination of vertices.

That vertices are represented by the `Vector2D` class, and today I constructed the other two important classes: `Barretina::Space2D::Line2D` and `Barretina::Space2D::Polygon`.

The responsability of both classes is to have an structure of themselves, and later create wrapper classes to render with Ruby2D (the gem to represent information into the screen).

### TO DO
- (✔️ 23/09/2025) Tests for `Barretina::Space2D::Line2D`
- (✔️ 23/09/2025) Test for `Barretina::Space2D::Polygon`

## 29/08/2025

I rolled back with the version file for gemspec, and also added some basic information about tests in the `README.md`. In order to increase the clarity of the gems used in the project, I remove the gems `Ruby2D` and `IRB` from the `Gemfile`, because of there are added into the gemspec file.

I restart this project from hollidays with the `VectorSpace::Vector2D`: a class with inheritance from `VectorSpace::Vector` and incorporates the classical coordenates `x` and `y` -I will need these for the graphical representation.


## 05/07/2025

I have wrote my firsts tests with MiniTest.

At the moment, I want to structure the tests copying the `lib/` structure.

I have made the tests for the object `VectorSpace::Vector`, which has the path `lib/barretina/vector_space/vector.rb`, therefore the tests will remain in the path `test/barretina/vector_space/test_vector.rb`.

I deleted the `lib/barretina/version.rb` file, and put the version in the properly `lib/barretina.rb` file.

### TO DO
- (✔️ 24/09/2025) Prepare a rake file to run all future tests

## 04/07/2025

After reading about tests, I have chosen "MiniTest", with the intention evoid spend too much time understanding a new DSL (like RSpec).

MiniTest is realy easy and it's only Ruby sintax.

I have already started with the firsts tests, testing the object `VectorSpace::Vector`.

## 03/07/2025

After studying about how to create a new gem, I build a gem and I published at https://rubygems.org/gems/barretina.

## 04/06/2025

I have explored and researched about how to structure correctly a Ruby project, and I move some files.

I named the console mode as BCM, from "Barretina Console Mode", and I make some configurations to play with the IRB interface. My intention is to make some kind of a config file for the BCM, but at the moment I put everithing in the same file. And also, isn't in a professional way, I need to invest some time to research and consult into professional projects to understand how really I can configure IRB to make my own PERL for the project (there isn't much information about that).

### TO DO
- Configure BCM in a file, not in `bin/bcm`.
- Explore a better way to run BCM.


## 30/05/2025

I have explained in the `README.dm` how to start the console mode.

I have changed the add and substract Vector methods for `.transpose.map(&:sum)` and `.transpose.map{|array| array.inject(:-)}`. I'm not sure that there are better, but these methods save on using `raise` to control the dimensions of the vectors (because of the `transpose` method do it).

### Decision about checking argument's class

At the last but not the least, I change from the `raise` exceptions into the methods with arguments. At first time, I made a check when starts every method which use parameters. The idea was to make sure every argument is an instance of a correct class.

For example, imagine the add method `def +(vector)`, with `vector` as a parameter. In this case, it was starting with a comprovation of the argument's class, something like: `raise 'The argument is not a Vector' unless vector.is_a?(Vector)`. If the argument isn't a vector, the method will stop (and raise an exception), but if the argument is a vector will execute the method.

But this force every method to start with a comprovation, and makes the class to work slowly.

In order to improve the performance of the `VectorSpace::Vector` methods, I reverse the order: the method start with his own execution, and if the argument is correct then will finish without any additional comprovation, but if the argument is incorrect the method will raise an exception because of the Ruby language nature (for example, if you try to multiplicate a string instead a scalar value), and then start the inspection of the arguments class, using a `rescue`.

Example:

```
def *(scalar)
  Vector.new *coordenates.map { |c| c * scalar }
rescue => e
  raise "Scalar value must be a Numeric instance (recomended Integer or Float), not a #{scalar.class}" unless scalar.is_a? Numeric
  raise e
end
```

### TO DO

It's time to start with tests!
- (✔️ 04/07/2025) study differents ways to test a Ruby application and choose one
- (✔️ 04/07/2025) prepare some tests before continuing with development

## 29/05/2025

I moved the modifications to other classes into `lib/extenders.rb`.

I create the repository on GitHub, adding a license and a readme.

### Decisions
- I need to create this diary.
- I removed a lot of the checkers from `Vector` methods, because I think are consumming to much. In the case of using badly de vectors methods (like adding with a string), they raise some errors. The only problem if don't show exacly what

### ✔️ TO DO
- (✔️ 30/05/2025) Maybe, if I use `begin`-`rescue` I can still evaluating the origin of the incorrect using of vectors methods.
- (✔️ 30/05/2025) Use `.transpose.map(&:sum)` to add and substract vectors

## 25/05/2025

In order to do scalars multiplications to Vectors, I made a little modification to `Integer` and `Float` classes adapting their own multiply method.

## 24/05/2025

I prepared some raise errors to some methods, to be clare with vector mistakes: don't add vectors with non-vectors objects, and can't multiply non-scalars objects to vectors.

To work and test, I create a console mode in `bin/console`.

## 23/05/2025

Starting the project.

**The concept of this project:** _to practice with what I learned in the assignature of algebra to create a 2D and 3D modeler._

**Objectives of this session:**
- Think a way to structure the project
- Start with simple idea
- Create the firsts concepts

**Decisions**
- At the moment, I don't want to create a complex and professional structre. I have put all in a `app/` directory.
- I have started creating vectors as a first concept, and I decided to use a namespace `VectorSpace`.
- I don't want to use a lot of dependencies, only one to display the graphics into the screen (I choosed [Ruby 2D](https://www.ruby2d.com/)). I'm working for fun and for learn, I'm not interested on other libraries like [Matrix](https://github.com/ruby/matrix).
- I want to separate matrizes from vectors as a class, becouse matrixes will work only as transformations to vectors.

I started with creating a class to work with vectors, `VectorSpace::Vector`, and I define the basics concepts as methods: how to add and substract vectors, and how to multiply with a scalar. Also I choose a string representation, using the horizontal vector form, like `(2, 3)`.
