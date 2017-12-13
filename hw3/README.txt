The files are:

q1:
   data:
      ploter_strong.py 
      ploter_weak.py 
      q1_strong.dat 
      q1_weak.dat
   source:
      errormod.f90 
      make.sh 
      make_weak.sh 
      mandelbrot.f90 
      question1.f90 
      question_weak.f90
q2:
   data:
      ploter_strong.py 
      ploter_weak.py 
      q2_strong.dat 
      q2_weak.dat
   source:
      makepi.sh 
      makepi_weak.sh 
      pi.f90 
      pi_weak.f90
report:
   inverseq1_strong.png 
   inversespeedupq2_weak.png  
   report_morse.pdf       
   speed_coresq1_weak.png 
   speedupq1_weak.png  
   timeq1_strong.png 
   timeq2_weak.png
   inverseq2_strong.png   
   report_morse.aux   
   report_morse.synctex.gz 
   speed_coresq2_weak.png 
   speedupq2_strong.png
   timeq1_weak.png
   inversespeedupq1_weak.png  
   report_morse.log 
   report_morse.tex 
   speedupq1_strong.png 
   speedupq2_weak.png   
   timeq2_strong.png
run: 
   hw3pi.sh 
   hw3pi_weak.sh
   hw3.sh 
   hw3_weak.sh



As I has more time to dedicate to this homework, things are more automated. To compile the code for the strong scaling use make.sh for question 1 and makepi.sh for question 2. For the weak scaling the source code is compiled useing make_weak.sh and makepi_weak.sh

The run files follow the same naming convention as the make files. The run files this time automatically loop over the number of cores and and code writes out the result to the .out file. The only part of this I did not automate was the creation of the .dat files which I made by copying the relatent block of code from the .out file to a .dat file. This could have been easily acutomated and would be in the future if more work was being done.

Finally, the plots are created using the ploter_weak/strong.py files. These python codes also calculate the linear regression for the F_s in the report and the Karp-Flatt metric.

Thank you for your time and Happy Holidays,
Michael
