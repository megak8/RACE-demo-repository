cas casauto;                                           
caslib mycaslib datasource=(srctype="path") 
   path="/myCasTables/" sessref=casauto;             
libname mycas cas caslib=mycaslib;                      

data mycas.cars;
   set sashelp.cars;  run; 

/* PROC PRINT, MEANS, FREQ are SAS version 9 procedures */
proc print data=mycas.cars (obs=50) ; run;            
proc means data= mycas.cars; var msrp invoice; run;
proc freq data= mycas.cars; tables type *  cylinders; run;

/* The MDSUMMARY SAS Viya procedure creates descriptive statistics
for variables across all observations or within groups of observations
IN PARALLEL for data in SAS Cloud Analytic Services (CAS). */

proc mdsummary data=mycas.cars;
  var mpg_highway;
  groupby type / out=mycas.mdsummary;
run;
