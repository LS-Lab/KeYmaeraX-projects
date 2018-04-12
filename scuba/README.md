This repository contains artifacts for our work on verified SCUBA diving.

There are three models/proofs:

 * tApprox: Contains the theorem statement, proof, and proof documentation for the basic model.
 * tApproxUpdate: Theorem 2 from the paper. Allows occasional manual ground truth updates for `t`.
 * nitrogen: Theorem 3 from the paper. Establishes both nitrogen safety and oxygen safety.

You can check each of these proofs by changing into the appropriate directory and running KeYmaera X
with the -check flag on the appropriate .kya file. For example,

    cd nitrogen;
    java -jar path/to/keymaerax.jar -check final.kya

Notice tht you will need:

 * Mathematica installed
 * KeYmaera X version 4.4 installed
 * KeYmaera X version 4.4 configured to use Mathematica as its arithmetic backend.
