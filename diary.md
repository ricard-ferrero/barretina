# Diary and notes

I will try to intriduce here some notes of what I've been doing, not only for share but also for remember why I maked some decisions.

I work on this project only in my spare time, that means a lot of time between work sessions and the need to review past sessions. 

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

## 24/05/2025

I prepared some raise errors to some methods, to be clare with vector mistakes: don't add vectors with non-vectors objects, and can't multiply non-scalars objects to vectors.

To work and test, I create a console mode in `bin/console`.

## 25/05/2025

In order to do scalars multiplications to Vectors, I made a little modification to `Integer` and `Float` classes adapting their own multiply method.

## 29/05/2025

I moved the modifications to other classes into `lib/extenders.rb`.

I create the repository on GitHub, adding a license and a readme.

### Decisions
- I need to create this diary.
- I removed a lot of the checkers from `Vector` methods, because I think are consumming to much. In the case of using badly de vectors methods (like adding with a string), they raise some errors. The only problem if don't show exacly what

### ✔️ TO DO
- (✔️ 30/05/2025) Maybe, if I use `begin`-`rescue` I can still evaluating the origin of the incorrect using of vectors methods.
- (✔️ 30/05/2025) Use `.transpose.map(&:sum)` to add and substract vectors

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
- study differents ways to test a Ruby application and choose one
- prepare some tests before continuing with development
