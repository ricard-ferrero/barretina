Barretina v0.2.0
=========
**WORK IN PROGRESS**

A 2D and 3D figure modeler.

Or, in other words: my own Blender.

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

## BCM: Barretina Console Mode

BCM is a way to run all Barretina's code without the graphic interface. I created with the intention to test while I work on this project.

Actually, it's IRB but with a particular configuration.

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

I use [Minitest](https://github.com/minitest/minitest) to create some unit tests.

### Run tests

At the moment, you can run the tests manually as a Ruby file. Eg:

```
$ ruby test/barretina/vector_space/test_vector.rb
Run options: --seed 5323

# Running:

.........

Finished in 0.003157s, 2851.0290 runs/s, 19006.8599 assertions/s.

9 runs, 60 assertions, 0 failures, 0 errors, 0 skips
```

Eventually, I will reorganize in a Rake file.
