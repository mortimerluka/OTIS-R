# OTIS-R

## One dimensional transport with inflow and storage modified to simulate radon (OTIS-R).
OTIS-R is a modified version of OTIS<sup>1</sup>. The model simulates one dimensional solute transport in streams including advection, dispersion, lateral inflow and exchange with a transient storage as well as optional sorption, first order decay, production in the storage zone and gas exchange.

## Repository structure
This repository contains
- the source code of the model written in FORTRAN 77 (/FORTRAN source code)
- the readily compiled model for iOS (/compiled model (mac)), compiled and tested on an M1 Pro processor under macOS 14 Sonoma
- the readily compiled model for Windows (/compiled model (PC))
- the input files providing the model parameters (/input files)
- the Matlab Code to calibrate the model for sodium chloride and radon (/calibration), which is modified after<sup>2</sup>
- the Matlab Code to create Plots from th ecalibration results (/Plots)
- the derivation of the numerical solution of the OTIS-R model (/OTISR_numerical_solution.pdf)

## How to conduct the model calibration
The calibration routine is written in Matlab and split in three parts: the data preprocessing to obtain sodium chloride input breakthrough curves and radon values along the stream (/calibration/data preprocessing), the calibration assuming only inflow into the stream (calibration/inflow only) and the calibration assuming inflow into and outflow from the stream (/calibration/inflow and outflow).

### Data preprocessing
The folder contains the Matlab files
- NaCl_conversion.m
- ParamEst_BTC_hour.m
- ParamEst_BTC_second.m
- Rn_conversion.m

and the example data files
- Reach_1.m
- Reach_2.m
- Reach_3.m
- Reach_4.m
- Reach_5.m

Load all files into the same folder and run the matlab files to create the output file for radon 'Rn_data.mat' as well as the folder 'NaCl_BTCs' containing the output files for sodium chloride.

### Calibration assuming no outflow from the stream
The folder contains the Matlab files
- behavioral.m
- BTC_analysis.m
- LHS_sampling.m
- ObjFun_N.m
- ObjFun_R.m
- OTIS_MonteCarlo.m
- OTIS_run_N_Qfix.m
- OTIS_run_N.m
- OTIS_run_R_Qfix.m
- OTIS_run_R.m

Load all files into the same folder along with the files created in the preprocessing (NaCL_BTCs and Rn_data.mat), the model for your operating system (otisrv3.out (mac) or otisr_v3.exe (PC)) and the input files for the model from the folder /input files. Run BTC_analysis.m to run the calibration routine.

The output is stored in the folder 'Output_files_OTISR', which contains the output files:
- LHS_samling.mat
- OTIS_results_MC.mat
- OTIS_results.mat
- Start.mat

The file 'OTIS_results.mat' contains the final calibration output and can be used to create figures.

### Calibration assuming inflow and outflow
The folder contains the Matlab files
- behavioral.m
- BTC_analysis.m
- LHS_sampling.m
- ObjFun_N.m
- ObjFun_R.m
- OTIS_MonteCarlo.m
- OTIS_run_N.m
- OTIS_run_R.m

Proceed as described above under 'Calibration assuming no outflow from the stream'.

## How to create plots
Load all files from the folder /Plots into the same folder along with the calibration results ('R1Output_files_OTISR', ..., 'R5Output_files_OTISR') and run the file 'Plot.m'.

## References
1 Runkel, R. (1998), 'One-dimensional transport with inflow and storage (otis): A solute transport
model for streams and rivers', U.S. Geol. Surv. Water Resour. Invest. Rep. 98–4018. \
2 Bonanno, E. (2022), 'BTC_analysis: GLaDY - GLobal and DYynamic identifiability analysis - BTC application (SoluteTransport)', Zenodo, https://doi.org/10.5281/zenodo.7381262
