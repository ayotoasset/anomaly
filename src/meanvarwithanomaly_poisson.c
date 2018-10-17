#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include <math.h>
#include <stdlib.h>

#include "Functions.h"



SEXP PoissonAnomaly(SEXP Rx, SEXP Rn, SEXP Rminlength, SEXP Rmaxlength, SEXP Rbetachange, SEXP Rbetaanomaly)
{
  
  /* 
  Rx    : Data
  Rn    : Length of data
  */
	 
 	PROTECT(Rx) ; 
 	PROTECT(Rn) ;
	PROTECT(Rminlength) ;
	PROTECT(Rmaxlength) ;
	PROTECT(Rbetachange) ;
	PROTECT(Rbetaanomaly) ;
	
  	int n = 0, minlength = 0, maxlength = 0, error = 0;
  	double betachange = 0.0, betaanomaly = 0.0;
  	double* x = NULL;
	
  
 	minlength        = *(INTEGER(Rminlength));
	maxlength        = *(INTEGER(Rmaxlength));
	n                = *(INTEGER(Rn));
  	x          	 =   REAL(Rx);
  	betachange       = *REAL(Rbetachange);
  	betaanomaly      = *REAL(Rbetaanomaly);

	struct orderedobservationlist_mean* mylist;

	populateorderedobservationlist_mean(&mylist, x, n); 

	
	error = solveorderedobservationlist_poisson(mylist, n, betachange, betaanomaly, minlength, maxlength);
	
	if (error){
	  free(mylist);
	  UNPROTECT(6);
	  return R_NilValue ; 
	}

	int numberofchanges = 0, *changes = NULL;

	changepointreturn_mean(mylist, n, &numberofchanges, &changes);
	

	SEXP Rout ; 
  	PROTECT(Rout = allocVector(INTSXP, 2*numberofchanges));

	int *out;
  	out  = INTEGER(Rout);
  
 	int ii = 0;
  	
	for (ii = 0; ii < 2*numberofchanges; ii++)
	{
		out[ii] = changes[ii];
	}
	
	free(changes);

	free(mylist); 

  	UNPROTECT(7);
  	return(Rout) ; 
}









