/* wsq.i */
%module wsq
%begin %{
#define SWIG_PYTHON_STRICT_BYTE_CHAR
%}
%include "typemaps.i"

%apply char* {unsigned char*};

%typemap(in) unsigned char* = char*;

%typemap(in,numinputs=0) (unsigned char **, int *)(unsigned char *odata, int * olen){
  $1 = (unsigned char **)&odata;
  $2 = (int *)&olen;
}
%typemap(argout) (unsigned char **, int *){
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$2)));
  $result = SWIG_Python_AppendOutput(resultobj, PyBytes_FromStringAndSize((const char*)(*$1), *$2));
}

%typemap(in,numinputs=0) (unsigned char **, int *, int *, int *, int *, int *)(unsigned char *odata, int *ow, int *oh, int *od, int *oppi, int *loosyflag){
  $1 = (unsigned char **)&odata;
  $2 = (int *)&ow;
  $3 = (int *)&oh;
  $4 = (int *)&od;
  $5 = (int *)&oppi;
  $6 = (int *)&loosyflag;
}
%typemap(argout) (unsigned char **, int *, int *, int *, int *, int *){
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$6)));
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$5)));
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$4)));
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$3)));
  $result = SWIG_Python_AppendOutput(resultobj, SWIG_From_int((*$2)));
  $result = SWIG_Python_AppendOutput(resultobj, PyBytes_FromStringAndSize((const char*)(*$1), ((*$2)*(*$3))));
}

%{
#include "wsq.h"
int debug=0;
%}

%include "wsq.h"
//extern int wsq_encode_mem(unsigned char **, int *, const float, unsigned char *,
//                 const int, const int, const int, const int, char *);
//extern int wsq_decode_mem(unsigned char **, int *, int *, int *, int *, int *,
//                 unsigned char *, const int);

