# OTIS-R

## One-Dimensional Transport with Inflow and Storage to Simulate Radon Activity (OTIS-R).
OTIS-R is a modified version of the transient storage model OTIS<sup>1</sup> to simulate radon activity in streams. OTIS-R simulates one dimensional solute transport in streams including advection, dispersion, lateral inflow and exchange with a transient storage zone. Additional radon-specific processes considered in OTIS-R include decay in the stream as well as the storage zone, production in the storage zone and gas exchange between the stream and the atmosphere.

## Repository structure
This repository contains
- the source code of OTIS-R written in FORTRAN 77 (/FORTRAN source code)
- the readily compiled version of OTIS-R for iOS (/compiled model (mac)), compiled and tested on an M1 Pro processor under macOS 14 Sonoma
- the readily compiled version of OTIS-R for Windows (/compiled model (PC))
- the input files required to run OTIS-R (/input files)
- the Matlab Code to calibrate OTIS-R for chloride concentration and radon activity (/calibration), which is modified after<sup>2</sup>
- the Matlab Code to create plots after the calibration routine (/plots)
- the derivation of the numerical solution of OTIS-R (/OTISR_numerical_solution.pdf)

## How to calibrate OTIS-R
Two different calibration routines are provided in this repository. The routines differ in whether we assume that (I) there is lateral inflow from the groundwater to the stream (/inflow only) or (II) there is lateral inflow from the groundwater to the stream as well as water fluxes from the stream to the groundwater (/inflow and outflow). To run the calibration, you first need to complete the data preprocessing (/data preprocessing), regardless of which calibration routine you choose. This preprocessing step converts measured breakthrough curves (BTCs) of sodium chloride into BTCs with the temporal resolution and converts measured radon activity to the required format to run OTIS-R.

### Data preprocessing
The folder contains the following Matlab files
- NaCl_conversion.m
- ParamEst_BTC_hour.m
- ParamEst_BTC_second.m
- Rn_conversion.m
- conversion.m

and the example data files
- Reach_1.m
- Reach_2.m
- Reach_3.m
- Reach_4.m
- Reach_5.m

Load all Matlab and data files into the same folder. Insert your measured sodium chloride concentrations into the Excel files (e.g., Reach 1.xlsx). Open the Matlab file "NaCl_conversion.mat" and run the code. The code will generate matrices (e.g., NaClReach1.mat) containing the preprocessed data required for calibration. Similarly, open the file "Rn_conversion.m" to preprocess radon activities. Adapt these Matlab Files according to your study design and settings. To run the OTIS-R calibration, select one of the two assumptions and open the corresponding folder after data preprocessing.

### Calibration assuming only lateral groundwater inflow
The folder contains the following Matlab files:
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

Load all files into the same folder along with the folder containing the preprocessing results for chloride (NaCl_BTCs) and the preprocessing results for radon (Rn_data.mat). Copy the compiled version of OTIS-R for your operating system (otisrv3.out (mac) or otisr_v3.exe (PC)) from the respective folder (either “compiled model (mac)” or “compiled model (PC)” into the same folder. Additionally, copy the input files from the folder “input files” into the same folder. Run the Matlab code “BTC_analysis.m” to start the calibration routine.The Matlab code will create  a folder called 'Output_files_OTISR', which contains the output files:

- LHS_samling.mat
- OTIS_results_MC.mat
- OTIS_results.mat
- Start.mat

The file 'OTIS_results.mat' contains the final calibration output and can be used for plotting.

### Calibration assuming inflow and outflow
The folder contains the following Matlab files:
- behavioral.m
- BTC_analysis.m
- LHS_sampling.m
- ObjFun_N.m
- ObjFun_R.m
- OTIS_MonteCarlo.m
- OTIS_run_N.m
- OTIS_run_R.m

Proceed as described above under 'Calibration assuming  only lateral groundwater inflow’.

## How to create plots
Load all files from the folder /Plots into the same folder along with the calibration results ('R1Output_files_OTISR', ..., 'R5Output_files_OTISR') and run the file 'Plot.m'.

## References
1 Runkel, R. (1998), 'One-dimensional transport with inflow and storage (OTIS): A solute transport
model for streams and rivers', U.S. Geol. Surv. Water Resour. Invest. Rep. 98–4018. \
2 Bonanno, E. (2022), 'BTC_analysis: GLaDY - GLobal and DYynamic identifiability analysis - BTC application (SoluteTransport)', Zenodo, https://doi.org/10.5281/zenodo.7381262
