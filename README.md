Barretina v0.2.1
=========
**WORK IN PROGRESS**

A 2D and 3D figure modeler.

Or, in other words: _my own Blender_.

## Why?

Well, it's a good question. But maybe the answer isn't good enough: _just for fun_.

It's a fun, chill and cozy project thah I enjoy doing, and an awesome way to learn while playing on my computer!

### My diary

I write in a diary every big commit, and I summarize the evolution of the project.

[If you feel some interest, take a look to it now: it's free!](diary.md)

## Index of contents

- [BCM: Barretina Console Mode](#bcm-barretina-console-mode)
    - [Run BCM](#run-bcm)
- [Tests](#tests)
    - [Run tests](#run-tests)
        - [Using Rake](#using-rake)
        - [Test files separately](#test-files-separately)
- [Algebraic classes](#algebraic-classes)
    - [Generic vectors](#generic-vectors)
        - [Vector](#vector)
        - [Line](#line)
    - [2D vectors](#2d-vectors)
    - [3D vectors](#3d-vectors)

## BCM: Barretina Console Mode

BCM is a way to run all Barretina's code without the graphic interface. I created with the intention to review the code while working on this project.

It's really usefull to work with the algebraic classes about vector spaces.

In fact, it's IRB but with a particular configuration.

### Run BCM

You can run BCM with the `bin/bcm` file:

```
$ bin/bcm
BCM - Barretina Console Mode
bcm:001:0> p = VectorSpace::Vector.new 1, 5
-> #<Vector (1, 5)>
bcm:002:0> q = VectorSpace::Vector.new 2, -3
-> #<Vector (2, -3)>
bcm:003:0> p + q
-> #<Vector (3, 2)>
```

## Tests

This project uses [Minitest](https://github.com/minitest/minitest).

All tests are situated in `test/`, and actually them only review the geometry classes.

### Run tests

#### Using Rake

Using the `rake` command will execute the tests.

It's recomended to use a specific command to only start the tests under the Bundle

```
$ bundle exec rake test
Run options: --seed 17133

# Running:

................................................

Finished in 0.004434s, 10826.1088 runs/s, 30448.4310 assertions/s.

48 runs, 135 assertions, 0 failures, 0 errors, 0 skips
```

To see other options, read the [Minitest official documentation](https://github.com/minitest/minitest?tab=readme-ov-file#rake-tasks-).

#### Test files separately

It's possible to choose the files to run, using the Ruby command and the path of the file:

```
$ ruby test/barretina/vector_space/test_vector.rb
Run options: --seed 5323

# Running:

.........

Finished in 0.003157s, 2851.0290 runs/s, 19006.8599 assertions/s.

9 runs, 60 assertions, 0 failures, 0 errors, 0 skips
```

## Algebraic classes

### Generic vectors

I came up with the idea for this project because I awas studying algebra, which had vector spaces as main subject matter.

For that reason, I started with a class to work with vectors: `Barretina::VectorSpace::Vector`.

This class can work with vectors from all dimensions, but at the same time is to slow for a render application. In order to create a better app, there is a module specific for 2D vectors (and will be another for 3D).

But was really fun to implement that class and study how ruby can adapt the behavior for every number of dimensions.

#### Vector

For definition, a vector can add with another and results into a vector, and also can be scaled by a scalar number (integer or rational).

The `Barretina::VectorSpace::Vector` meet the requeriments.

**Important**: the vectors only work correctly with other vectors in same dimension.

The `BCM` interpreter has includeds the different vector spaces modules, then it's possible to invoke `Barretina::VectorSpace::Vector` with only `Vector`.

```
$ bin/bcm
BCM - Barretina Console Mode
bcm:001:0> v = Vector.new(1, 3, 5, 1)
-> #<Vector (1, 3, 5, 1)>
bcm:002:0> w = Vector[2, 2, 3, -1]
-> #<Vector (2, 2, 3, -1)>
bcm:003:0> v + w
-> #<Vector (3, 5, 8, 0)>
bcm:004:0> v - w
-> #<Vector (-1, 1, 2, 2)>
bcm:005:0> v * 3
-> #<Vector (3, 9, 15, 3)>
bcm:006:0> v.to_s
-> "(1, 3, 5, 1)"
bcm:007:0> "#{v} + #{w} = #{v + w}"
-> "(1, 3, 5, 1) + (2, 2, 3, -1) = (3, 5, 8, 0)"
```

#### Line

It's possible to have a line object, `Barretina::VectorSpace::Line`, that includes two vectors and can calculate the distance between both:

```
$ bin/bcm
BCM - Barretina Console Mode
bcm:001:0> v = Vector.new(1, 3, 5, 1)
-> #<Vector (1, 3, 5, 1)>
bcm:002:0> w = Vector[2, 2, 3, -1]
-> #<Vector (2, 2, 3, -1)>
bcm:003:0> l = Line.new(v, w)
-> #<Line (1, 3, 5, 1)-(2, 2, 3, -1)>
bcm:004:0> l.length
-> 3.1622776601683795
```

### 2D vectors

In that module there are three important elements to calculate the objects to render: vectors, lines and polygons.

- `Barretina::VectorSpace2D::Vector2D`
- `Barretina::VectorSpace2D::Line2D`
- `Barretina::VectorSpace2D::Polygon`

All of these are usefull to calculate the objects coordenates and transformations to start with graphic rendering.

### 3D vectors

At the moment I didn't started with 3D spaces.
