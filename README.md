# OTIS-R

## Contact
Please contact cglaser@uni-bonn.de for any questions.

## One-Dimensional Transport with Inflow and Storage to Simulate Radon Activity (OTIS-R).
OTIS-R is a modified version of the transient storage model OTIS<sup>1</sup> to simulate radon activity in streams. OTIS-R simulates one dimensional solute transport in streams including advection, dispersion, lateral inflow and exchange with a transient storage zone. Additional radon-specific processes considered in OTIS-R include decay in the stream as well as the storage zone, production in the storage zone and degassing from the stream into the atmosphere.

## Repository structure
This repository contains
- the source code of OTIS-R written in FORTRAN 77 (/FORTRAN source code)
- the readily compiled version of OTIS-R for iOS (/compiled model (mac)), compiled and tested on an M1 Pro processor running macOS 14 Sonoma
- the readily compiled version of OTIS-R for Windows (/compiled model (PC)), compiled and tested on an 11th Gen Intel® Core™ processor running Windows 11
- the input files required to run OTIS-R (/input files), these files are required to run the model independently of the Matlab calibration routine
- the Matlab Code to calibrate OTIS-R for chloride concentration and radon activity (/calibration), which is modified after<sup>2</sup>
- the Matlab Code to create plots after the calibration routine (/plots)
- the derivation of the numerical solution of OTIS-R (/OTISR_numerical_solution.pdf)

## How to calibrate OTIS-R
Two different calibration routines are provided in this repository. The routines differ in whether we assume that (I) there is lateral inflow from the groundwater to the stream (/inflow only) or (II) there is lateral inflow from the groundwater to the stream as well as water fluxes from the stream to the groundwater (/inflow and outflow). To run the calibration, you first need to complete the data preprocessing (/data preprocessing), regardless of which calibration routine you choose. This preprocessing step converts measured breakthrough curves (BTCs) of sodium chloride into BTCs with the temporal resolution required to run OTIS-R. Additionally, preprocessing converts measured radon activity to the required format to run OTIS-R.

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

Load all Matlab and data files into the same folder to start the preprocessing. Insert your measured sodium chloride concentrations into the Excel files (e.g., Reach 1.xlsx). Open the Matlab file "NaCl_conversion.m" and run the code. The code will generate matrices (e.g., NaClReach1.mat) containing the preprocessed data required for calibration. Similarly, open the Matlab file "Rn_conversion.m" to preprocess radon activities. Adapt these Matlab Files according to your study design and settings. To run the OTIS-R calibration, select one of the two assumptions and open the corresponding folder after data preprocessing.

### Calibration assuming only lateral groundwater inflow
The folder contains the following files:
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
- params_N.template
- params_R.template
- q_N.template
- q_R.template
- control.inp

For running the calibration routine on a Mac you additionally need the model file "otisrv3.out" from the folder "/compiled model (Mac)".

For running the calibration routine on a Windows PC you additionally need all files from the folder "/compiled model (PC)":
- libgcc_s_seh-1.dll
- libgfortran-5.dll
- libquadmath-0.dll
- libwinpthread-1.dll
- otisr_windows.exe

If none of the readily compiled models work for you, you might have to compile the model yourself using the provided FORTRAN scripts under "/FORTRAN source code/scripts". Exemplary workflows on how to compile the model are provided under "/FORTRAN source code/compilation".

Load all files into the same folder along with the folder containing the preprocessing results for chloride (NaCl_BTCs) and the preprocessing results for radon (Rn_data.mat). Copy the compiled version of OTIS-R for your operating system (otisrv3.out (mac) or otisr_windows.exe (PC)) from the respective folder (either “compiled model (mac)” or “compiled model (PC))” into the same folder. Open the Matlab code “BTC_analysis.m”. Change the degassing values according to your study and adapt line 51 (000.OSFLAG) based on which system (Mac, Windows, Linux) you are running. Run the Matlab code “BTC_analysis.m” to start the calibration routine. The Matlab code will create  a folder called 'Output_files_OTISR', which contains the output files:

- LHS_samling.mat
- OTIS_results_MC.mat
- OTIS_results.mat
- Start.mat

The file 'OTIS_results.mat' contains the final calibration output and can be used for plotting.

### Calibration assuming inflow and outflow
The folder contains the following files:
- behavioral.m
- BTC_analysis.m
- LHS_sampling.m
- ObjFun_N.m
- ObjFun_R.m
- OTIS_MonteCarlo.m
- OTIS_run_N.m
- OTIS_run_R.m
- params_N.template
- params_R.template
- q_N.template
- q_R.template
- control.inp

Proceed as described above under 'Calibration assuming  only lateral groundwater inflow’.

## How to create plots
Load all files from the folder /Plots into the same folder along with the calibration results from BOTH calibration routines ('R1Output_files_OTISR', 'R1Output_files_OTISR_Outflow', ..., 'R5Output_files_OTISR') and run the file 'Plot.m'.

Be careful: the plotting files currently processes the results of both calibration routines. Adapt accordingly.

## References
1 Runkel, R. (1998), 'One-Dimensional Transport with Inflow and Storage (OTIS): A solute transport
model for streams and rivers', U.S. Geol. Surv. Water Resour. Invest. Rep. 98–4018. \
2 Bonanno, E. (2022), 'BTC_analysis: GLaDY - GLobal and DYynamic identifiability analysis - BTC application (SoluteTransport)', Zenodo, https://doi.org/10.5281/zenodo.7381262
