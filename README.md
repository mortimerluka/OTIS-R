# OTIS-R

## One dimensional transport with inflow and storage modified to simulate radon (OTIS-R).
OTIS-R is a modified version of OTIS<sup>1</sup>. The model simulates one dimensional solute transport in streams including advection, dispersion, lateral inflow and exchange with a transient storage as well as optional sorption, first order decay, production in the storage zone and gas exchange.

## Repository structure
This repository contains
- the source code of the model written in FORTRAN 77 (/FORTRAN source code)
- the readily compiled model for iOS (/compiled model (mac)), compiled and tested on an M1 Pro processor under macOS 14 Sonoma
- the readily compiled model for Windows (/compiled model (PC))

Alongside the compiled model, the model folders contain the input files that provide the input parameters for the general model set up and solute (PARAMS.INP), the flow (Q.INP) and the input/output files (control.inp).






## References
1 Runkel, R. (1998), ‘One-dimensional transport with inflow and storage (otis): A solute transport
model for streams and rivers’, U.S. Geol. Surv. Water Resour. Invest. Rep. 98–4018.
