# Final Proof

## Getting started

	unfold ; 
	loop({`(0 < HRmin&HRmin < HRmax&HRmin<=a&a<=HRmax&b>0&tau>0&vAsc < 0&vDesc>0&d=d0+v*c&c>=0&C>0&stopTime>0&stopDepth>0)&(d>=0&HRmin<=x&x<=HRmax)&tau*HRmax*(-d/vAsc)+tau*HRmax*(stopTime-stoppedTimer)<t&tApprox<=t&stopTime>=stoppedTimer&(d>=stopDepth|stoppedTimer>=stopTime)`}, 1) ; <( 
		QE
		, 
		QE
		, 
		composeb(1) ; assignb(1) ; 
		composeb(1) ; assignb(1) ; 
		composeb(1) ; assignb(1) ; 
		composeb(1) ; 
		MR({`tApprox<=t`}, 1) ; <( 
			master
			, 
			andL('L)* ; composeb(1) ; composeb(1.1) ; composeb(1.1.1) ; assignb(1.1.1.1) ; dC({`HRmin<=x&x<=HRmax`}, 1.1.1) <(
				unfold
				,
				nil
			)
		) 
	)

This produces five subgoals (four control modes and a global differential invariant):

 * Descend
 * Stay with time on
 * Stay with timer off
 * Ascend
 * `HRmin <= x <= HRmax`

Each of the control cases start with the "control case preamble" tactic:

	boxAnd(1); andR(1) <(
		dI(1) /* inductive invariants */
		,
		boxAnd(1); andR(1) <(
			dW(1); QE /* dW invariants */
			,
			boxAnd(1); andR(1) <(
				nil /* t bound */
				,
				boxAnd(1); andR(1) <(
					nil /* tApprox bound */
					,
					boxAnd(1); andR(1) <(
						dW(1); QE /* stopTime >= stoppedTimer */
						,
						nil /* nitrogen safety */
					)
				)
			)
		)	
	)


## Descend case

First run the "control case premable" tactic given above.

### tApprox bounds

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)

### t bounds

Something like this. Basically the first two of the long invariant are `dI` and the second two are `dW`. Proof could be refactored for readability!

	dC({`t >= old(t)-tau*HRmax*c & d=old(d)+vDesc*c`}, 1) <(
		dC({`
	
			old(t) - tau*HRmax*c >= tApprox - tau*HRmax*c &
			tApprox - tau*HRmax*c > tau*HRmax*(-(d_0+vDesc*C)/vAsc)+tau*HRmax*C+tau*HRmax*(stopTime-stoppedTimer) - tau*HRmax*c &
			tau*HRmax*(-(d_0+vDesc*C)/vAsc)+tau*HRmax*C+tau*HRmax*(stopTime-stoppedTimer) - tau*HRmax*c >= tau*HRmax*(-d/vAsc)+tau*HRmax*C+tau*HRmax*(stopTime-stoppedTimer) - tau*HRmax*c &
			tau*HRmax*(-d/vAsc)+tau*HRmax*C+tau*HRmax*(stopTime-stoppedTimer) - tau*HRmax*c >= tau*HRmax*(-d/vAsc)+tau*HRmax*(stopTime-stoppedTimer)
		    `}, 1) 
		<(
			dW(1); QE
			,
			boxAnd(1) ; andR(1) ; <(
				dI(1),
				boxAnd(1) ; andR(1) ; <(
					dI(1),
					boxAnd(1) ; andR(1) ; <(
						dW(1) ; QE,
						dW(1) ; QE
					)
				)
			)
		)
		,
		dI(1)
	)

### nitrogen safety

	orL('L) <(
		ODE(1)
		,
		ODE(1)
	)

## Stay cases (timer on, timer off)

### Nitrogen safety property (both cases)

	auto

### tApprox proof (both cases)

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)

### t proof (timer off)

	dC({`t>=old(t)-tau*HRmax*c & old(t)-tau*HRmax*c>=tApprox-tau*HRmax*c & tApprox>tau*HRmax*(-d/vAsc)+tau*HRmax*C+tau*HRmax*(stopTime-stoppedTimer)`}, 1) ; <( 
		dW(1) ; QE
		, 
		ODE(1) 
	)

### t proof (timer on)

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) ; <( 
		dI(1)
		, 
		dI(1) 
	)


## Ascend case

### t bound

	dC({`d=old(d)+vAsc*c`}, 1) ; <(
		dC({`t>=old(t)-tau*HRmax*c`}, 1) ; <(
			dI(1)
			,
			dI(1)
		)
		,
		dI(1)
	)

### tApprox bound

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)

### nitrogen safety

Note: this orL should happen at whatever position has the assumption that `stoppedTimer = stopTime | d > stopDepth`.
But a `orL('L)` won't work because there are other disjuctions in the antecedent.

	orL(-31) <(
		dC({`stoppedTimer = stopTime`}, 1) <(
			dW(1); QE
			,
			dC({`stoppedTimer=old(stoppedTimer)`}, 1) ; <(
				dW(1) ; QE
				,
				dI(1)
			)
		)
		,
		dC({`d0 = old(d) & old(d) > stopDepth`}, 1) <(
			dW(1); QE
			,
			dI(1)
		)	
	)

## Heart Rate Bounds (`HRmin <= x <= HRmax`)

Note: See scala for a slightly better formatted output.

	MR({`HRmin<=x&x<=HRmax&HRmin<=a&a<=HRmax`}, 1) ; <(
	master, 
	  assignb(1) ; boxAnd(1) ; andR(1) ; <(
	  unfold ; ((cut({`x>=a|x < a`}) ; <(
	    nil, 
	      hideR(1) ; QE
	    )) ; orL('Llast)) ; <(
	    ((((MR({`x>=a`}, 1) ; <(
	      nil, 
		QE
	      )) ; cut({`x=a|x>a`})) ; <(
	      nil, 
		hideR(1) ; QE
	      )) ; orL('Llast)) ; <(
	      ((MR({`x=a`}, 1) ; <(
		nil, 
		  QE
		)) ; dG({`{y'=b*y}`}, {`y*(x-a)=0&y>0`}, 1) ; (cut({`\exists y (y*(x-a)=0&y>0)`}) ; <(
		nil, 
		  hideR(1) ; QE
		)) ; existsL('Llast) ; existsR({`y`}, 1) ; boxAnd(1) ; andR(1)) ; <(
		dI(1), 
		  ((dG({`{z'=(-b/2)*z}`}, {`y*z^2=1`}, 1) ; cut({`\exists z y*z^2=1`})) ; <(
		  nil, 
		    hideR(1) ; QE
		  )) ; existsL('Llast) ; existsR({`z`}, 1) ; dI(1)
		), 
		dG({`{y'=b/2*y}`}, {`y^2*(x-a)=1`}, 1) ; (cut({`\exists y y^2*(x-a)=1`}) ; <(
		nil, 
		  hideR(1) ; QE
		)) ; existsL('Llast) ; existsR({`y`}, 1) ; dI(1)
	      ), 
	      (((dC({`x < a`}, 1) ; <(
	      dI(1), 
		nil
	      )) ; dG({`{y'=b/2*y}`}, {`y^2*(x-a)=-1`}, 1) ; cut({`\exists y y^2*(x-a)=-1`})) ; <(
	      nil, 
		hideR(1) ; QE
	      )) ; existsL('Llast) ; existsR({`y`}, 1) ; dI(1) ; QE
	    ), 
	    unfold ; ((cut({`x<=a|x>a`}) ; <(
	    nil, 
	      hideR(1) ; QE
	    )) ; orL('Llast)) ; <(
	    ((((MR({`x<=a`}, 1) ; <(
	      nil, 
		QE
	      )) ; cut({`x=a|x < a`})) ; <(
	      nil, 
		hideR(1) ; QE
	      )) ; orL('Llast)) ; <(
	      ((MR({`x=a`}, 1) ; <(
		nil, 
		  QE
		)) ; dG({`{y'=b*y}`}, {`y*(x-a)=0&y>0`}, 1) ; (cut({`\exists y (y*(x-a)=0&y>0)`}) ; <(
		nil, 
		  hideR(1) ; QE
		)) ; existsL('Llast) ; existsR({`y`}, 1) ; boxAnd(1) ; andR(1)) ; <(
		dI(1), 
		  ((dG({`{z'=(-b/2)*z}`}, {`y*z^2=1`}, 1) ; cut({`\exists z y*z^2=1`})) ; <(
		  nil, 
		    hideR(1) ; QE
		  )) ; existsL('Llast) ; existsR({`z`}, 1) ; dI(1)
		), 
		(((MR({`x < a`}, 1) ; <(
		nil, 
		  QE
		)) ; dG({`{y'=b/2*y}`}, {`y^2*(x-a)=-1`}, 1) ; cut({`\exists y y^2*(x-a)=-1`})) ; <(
		nil, 
		  hideR(1) ; QE
		)) ; existsL('Llast) ; existsR({`y`}, 1) ; dI(1) ; QE
	      ), 
	      (dC({`x>a`}, 1) ; <(
	      dI(1), 
		nil
	      )) ; dG({`{y'=b/2*y}`}, {`y^2*(x-a)=1`}, 1) ; (cut({`\exists y y^2*(x-a)=1`}) ; <(
	      nil, 
		hideR(1) ; QE
	      )) ; existsL('Llast) ; existsR({`y`}, 1) ; dI(1)
	    )
	  )
	)
