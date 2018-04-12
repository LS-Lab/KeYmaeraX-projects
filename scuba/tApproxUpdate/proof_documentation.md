Apply the loop tactic, work through the previous value assignments and then, when you get to the "update" program, run:

	MR({`tApprox <= t`}, 1) <(master, nil)

On the remaining goal, run "basically" the same program that proves the `tApprox` goal, but with the loopy stuff removed. See `tApproxFragment.kyt` and diff with
`../tApprox/tApprox.kyt` to see where it case from.
