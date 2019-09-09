Robot Waypoint Navigation
=========================

Models and proofs on robot waypoint navigation. We present a reusable formally verified safety net 
that provides end-to-end safety and liveness guarantees for 2D waypoint-following of 
Dubins-type ground robots with tolerances and acceleration. We: 
* Model a robot in differential dynamic logic (dL), and specify assumptions on the controller and robot kinematics, and
* Prove formal safety and liveness properties for waypoint-following with speed limits.
The guarantees for the safety net apply to any robot as long as the waypoints are chosen safely and the physical assumptions 
in its model hold.

Brandon Bohrer, Yong Kiam Tan, Stefan Mitsch, Andrew Sogokon and André Platzer. 
[A formal safety net for waypoint following in ground robots](https://doi.org/10.1109/LRA.2019.2923099).
IEEE Robotics and Automation Letters. 4(3), pp. 2910-2917, 2019.
