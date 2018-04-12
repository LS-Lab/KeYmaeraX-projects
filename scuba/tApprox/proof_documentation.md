# tApprox proof


	composeb(1) ; assignb(1) ; composeb(1) ; assignb(1) ; composeb(1) ; assignb(1) ; composeb(1) ; composeb(1.1) ; composeb(1.1.1) ; assignb(1.1.1.1) ; 
	dC({`HRmin<=x&x<=HRmax`}, 1.1.1) ; <(
		unfold
		,
		nil
	)

## Controller caes prefix

	boxAnd(1); andR(1) <(
		dI(1) /* inductive invariants */
		,
		boxAnd(1); andR(1) <(
			dW(1); QE /* dW invariants */
			,
			boxAnd(1); andR(1) <(
				nil /* t bound (or maybe tApprox) */
				,
				nil /* tApprox bound (or maybe t) */
			)
		)	
	)


## Descend case

Run the controller case prefix (above). There are two open goals: the tApprox bound and the t bound

### tApprox bounds proof

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)


### t bounds proof

Note: This could be streamlined and tree-ified. Do the dI stuff then the dW one then dW;QE.

	dC({`d=old(d)+vDesc*c`}, 1) <( nil, dI(1) );
	dC({`t >= old(t)-tau*HRmax*c`}, 1) <( nil, dI(1) );
	dC({`t >= tApprox-tau*HRmax*c`}, 1) <( nil, dI(1) );
	dC({`t >= tApprox-tau*HRmax*c`}, 1) <( nil, dI(1) );
	dC({`tApprox > tau*HRmax*(-(d_0+vDesc*C)/vAsc)+tau*HRmax*C `}, 1) <( nil, dW(1); QE );
	dW(1);
	QE

## Stay case

Run the controller case prefix (above). There are two open goals: the tApprox bound and the t bound

### tApprox bounds proof

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)

### t bounds proof

	dC({`t>=old(t)-tau*HRmax*c & tApprox-tau*HRmax*c>tau*HRmax*(-d/vAsc)+tau*HRmax*C-tau*HRmax*c`}, 1) ; <(
		dC({`old(t)-tau*HRmax*c>=tApprox-tau*HRmax*c`}, 1) ; <(
			dW(1) ; QE,
			dW(1) ; QE
		),
		dI(1)
	)


## Ascend case

Run the controller case prefix (above). There are two open goals: the tApprox bound and the t bound

### tApprox bounds proof

	dC({`tApprox<=old(t)&old(t)-tau*HRmax*c<=t`}, 1) <(
		dW(1) ; QE,
		dI(1)
	)


### t bounds proof

	dC({`d=vAsc*c+old(d)`}, 1) <( nil, dI(1) );
	dC({`t >= old(t) - tau*HRmax*c`}, 1) <( nil, dI(1) );
	dC({`old(t) > tau*HRmax*-old(d)/vAsc`}, 1) <( nil, dW(1); QE );
	dW(1); QE

## HRmin <= x <= HRmax bounds

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
