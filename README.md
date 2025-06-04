Barretina
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
