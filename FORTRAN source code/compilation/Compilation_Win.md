# How to compile OTISR under Windows

This is an exemplary compilation routine. You may have to change the routine according to the system you are using.

1. Go to the folder „share“

Create .o files from .f files (for this purpose, you might need to download MSYS2 UCRT64 or a similar software). You can create the f.files using the following commands in the MSYS2 UCRT64 shell after navigating to the share folder:

gfortran -c bcchange.f conser.f decomp.f distance.f dynamic.f error.f error2.f error3.f flowinit.f getline.f header.*.f init.f input1.f input2.f input3.f input4.f input5.f input6.f input7.f inputgas.f inputq.f matrix.f openfile2.f openin.f outinit.f output.f outputss.f preproc.f preproc1.f preproc2.f preproc3.f qainit.f qchange.f qsteady.f qunsteady.f qweights.f react.f readq.f setstop.f settype.f ssconc.f ssdiff.f steady.f substit.f update.f weights.f wtavg.f yinterp.f saven.f


Create a share.a file using the following command in the shell:

ar r share.a bcchange.o conser.o decomp.o distance.o dynamic.o error.o error2.o error3.o flowinit.o getline.o header.*.o init.o input1.o input2.o input3.o input4.o input5.o input6.o input7.o inputgas.o inputq.o matrix.o openfile2.o openin.o outinit.o output.o outputss.o preproc.o preproc1.o preproc2.o preproc3.o qainit.o qchange.o qsteady.o qunsteady.o qweights.o react.o readq.o setstop.o settype.o ssconc.o ssdiff.o steady.o substit.o update.o weights.o wtavg.o yinterp.o saven.o


2. Navigate to the otisr folder

Create .o files from .f files:

gfortran -c closef.f input.f ldainit.f maininit.f mainrun.f openfile.f

Copy share.a into the folder “otisr”

Create the model:

gfortran main.f closef.o input.o ldainit.o maininit.o mainrun.o openfile.o share.a
