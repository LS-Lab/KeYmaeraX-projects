Robot Collision Avoidance and Navigation
========================================

Models and proofs on safety and liveness of robot collision avoidance and navigation algorithms. The proofs analyze
(i) static safety, which ensures that no collisions can happen with stationary obstacles,
(ii) passive safety, which ensures that no collisions can happen with stationary or moving obstacles while the robot
moves, (iii) the stronger passive friendly safety in which the robot further maintains sufficient maneuvering distance
for obstacles to avoid collision as well, and (iv) passive orientation safety, which allows for imperfect sensor coverage
of the robot, i. e., the robot is aware that not everything in its environment will be visible. We formally prove that safety
can be guaranteed despite sensor uncertainty and actuator perturbation. We complement these provably correct
safety properties with liveness properties: we prove that provably safe motion is flexible enough to let the robot
navigate waypoints and pass intersections.

# References

Stefan Mitsch, Khalil Ghorbal, David Vogelbacher, André Platzer.
[Formal verification of obstacle avoidance and navigation of ground robots](https://doi.org/10.1177/0278364917733549).
International Journal of Robotics Research. 36(12), pp. 1312-1340, 2017. 

