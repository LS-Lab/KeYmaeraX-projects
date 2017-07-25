The canonical 1-dimensional Saddle-node bifurcation.
See [Wiki page](https://en.wikipedia.org/wiki/Saddle-node_bifurcation)

This proof demonstrates two "big ideas".

First, to reason about bifurcation points, cut in a disjucntion and then
split the proof along the bifurcation point. In this case,
there's a bifurcation point at `r=0`, so we cut in `r<0 | r=0`
and then split the proof into these two cases.

Second, once this bifurcation is done,
the proof becomes a tour de force of ghost-based reasoning.

 * Multiple differential ghosts are used in each case.
 * An arithmetic ghost is used in the `r < 0` case to reason about sqrts.

