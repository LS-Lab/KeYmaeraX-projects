TACTICAL CONTRACT COMPOSITION FOR HYBRID SYSTEM COMPONENT VERIFICATION
==================================================

We present an approach for hybrid systems that combines the advantages of component-based modeling (e.g., reduced model 
complexity) with the advantages of formal verification (e.g., guaranteed contract compliance). Component-based modeling 
can be used to split large models into multiple component models with local responsibilities to reduce modeling 
complexity. Yet, this only helps the analysis if verification proceeds one component at a time. In order to benefit 
from the decomposition of a system into components for both modeling and verification purposes, we prove that the 
safety of compatible components implies safety of the composed system. We implement our composition theorem as a tactic 
in the KeYmaera X theorem prover, allowing automatic generation of a KeYmaera X proof for the composite system from 
proofs for the components without soundness-critical changes to KeYmaera X. Our approach supports component contracts 
(i.e., input assumptions and output guarantees for each component) that characterize the magnitude and rate of change 
of values exchanged between components. These contracts can take into account what has changed between two components 
in a given amount of time since the last exchange of information.

Andreas Müller, Stefan Mitsch, Werner Retschitzegger, Wieland Schwinger and André Platzer.
[Tactical contract composition for hybrid system component verification](https://doi.org/10.1007/s10009-018-0502-9). 
STTT, 20(6), pp. 615-643, 2018. Special issue for selected papers from FASE'17.