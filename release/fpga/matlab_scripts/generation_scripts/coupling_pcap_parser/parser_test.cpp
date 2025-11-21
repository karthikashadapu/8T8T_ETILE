#include "mex.h"
#include "fun_pcap_parser.h"
#include <iostream>


int test(char *p_file,double *in1,double *in2, double *in3, double *in4, double *output)
{
    std::cout << "calling pcap_extraction" << std::endl; 
    pcap_extraction(p_file,in1,in2,in3,in4,output);
    return 0;
}

/* The gateway function */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[])
{
    char *input_buf;
    double *input1;
    double *input2;
	 double *input3;
	 double *input4;
    double *output_f;

    /* check for proper number of arguments */
    if(nrhs!=5) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nrhs","five inputs required.");
    }
    if(nlhs!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nlhs","One output required.");
    }

     /* input must be a string */
    if ( mxIsChar(prhs[0]) != 1)
      mexErrMsgIdAndTxt( "MATLAB:revord:inputNotString",
              "Input must be a string.");
     /* input must be a row vector */
    if (mxGetM(prhs[0])!=1)
      mexErrMsgIdAndTxt( "MATLAB:revord:inputNotVector",
              "Input must be a row vector.");

    
    /* check that number of rows in second input argument is 1 */
    if(mxGetM(prhs[1])!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector","Input1 must be a row vector.");
    }
    if(mxGetM(prhs[2])!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector","Input2 must be a row vector.");
    }
	if(mxGetM(prhs[3])!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector","Input2 must be a row vector.");
    }
	if(mxGetM(prhs[4])!=1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:notRowVector","Input2 must be a row vector.");
    }
    /* copy the string data from prhs[0] into a C string input_ buf.    */
    input_buf = mxArrayToString(prhs[0]);

    /* create a pointer to the real data in the input matrix  */
    input1 = mxGetPr(prhs[1]);
    input2 = mxGetPr(prhs[2]);
	input3 = mxGetPr(prhs[3]);
	input4 = mxGetPr(prhs[4]);
    /* create the output matrix */
    plhs[0] = mxCreateDoubleMatrix(6552,2600,mxREAL);

    /* get a pointer to the real data in the output matrix */
    //#if MX_HAS_INTERLEAVED_COMPLEX
    //output = mxGetDoubles(plhs[0]);
    //#else
    output_f = mxGetPr(plhs[0]);
    //#endif

    /* call the computational routine */
    test(input_buf,input1,input2,input3,input4,output_f);
}

