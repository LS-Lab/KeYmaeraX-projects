# stability

This directory contains [KeYmaera X](http://keymaeraX.org/) stability proofs for several example systems:

- `pendulum` and `pendulumexp` prove asymptotic stability and global exponential stability for a (linearized) pendulum ODE. Similarly, `invpendulum` proves asymptotic stability for a linearized inverted pendulum with PD control.

- `rigidbody` and `frictionalrigidbody` prove stability properties for rotations of 3D rigid bodies.

- `mooregreitzer` proves epsilon-stability for a simple jet engine model.

- `synlyap` proves stability for several examples using Lyapunov functions generated by an inductive synthesis approach.

- `switchedsystems` contains stability proofs for several switched systems stabilized using different switching approaches (Examples from ADHS'21, Section 5). The directory `switched_systems` contains more stability proofs for switched systems.

See the respective `.kyx` files for further details.

# References
Yong Kiam Tan and André Platzer. Deductive stability proofs for ordinary differential equations. 
In Jan Friso Groote and Kim G. Larsen, editors, Tools and Algorithms for the Construction and Analysis of Systems, TACAS 2021, Proceedings, LNCS. Springer, 2021. 

Yong Kiam Tan and André Platzer. Switched systems as hybrid programs. Analysis and Design of Hybrid Systems, ADHS 2021. To appear.