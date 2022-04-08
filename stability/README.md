# stability

This directory contains [KeYmaera X](http://keymaeraX.org/) stability proofs for several example systems:

- `ODE` contains ODE stability proofs (Examples from TACAS'21, Section 5)

- `switchedsystems.kyx` contains stability proofs for several switched systems stabilized using different switching approaches (Examples from ADHS'21, Section 5). The directory `switched_systems` contains more experimental stability proofs for switched systems.

- `UGpAS` contains switched system stability case studies and proofs using the notion of uniform global asymptotic stability (Examples from HSCC'22, Section 5).

See the respective directories and `.kyx` files for further details.

# References
Yong Kiam Tan and André Platzer. Deductive stability proofs for ordinary differential equations. 
In Jan Friso Groote and Kim G. Larsen, editors, Tools and Algorithms for the Construction and Analysis of Systems, TACAS 2021, Proceedings, LNCS. Springer, 2021. [doi](https://doi.org/10.1007/978-3-030-72013-1_10)

Yong Kiam Tan and André Platzer. Switched systems as hybrid programs.
In Raphaël M. Jungers, Necmiye Ozay and Alessandro Abate, editors, Analysis and Design of Hybrid Systems, ADHS 2021. IFAC-PapersOnline, pp. 247-252. 2021. [doi](https://doi.org/10.1016/j.ifacol.2021.08.506)

Yong Kiam Tan, Stefan Mitsch, and André Platzer. Verifying switched system stability with logic.
In Ezio Bartocci and Sylvie Putot, editors, Hybrid Systems: Computation and Control, HSCC 2022, ACM. 2022. [doi](https://doi.org/10.1145/3501710.3519541)
