
#pragma once

/**
   reynolds number culcuration library

   # function name RegEx
   reynolds_v?(f|l)_(rhoVLmu|VLnu)

   # function name meaning

   | keyword       | selection | meaning                              |
   | :------------ | :-------- | :----------------------------------- |
   | v             | optional  | vectorized                           |
   | f, l          | choice    | type: f -> float l -> double         |
   | rhoVLmu, VLnu | choice    | V[m/s] L[m] ρ[kg/m3] μ[Pa s] ν[m2/s] |
*/

#ifdef __cplusplus
#include <cstddef>
typedef std::size_t c_size_t;
#else
#include <stddef.h>
typedef size_t      c_size_t;
#endif /* __cplusplus */

#ifdef __cplusplus
#define EXTERN_C extern "C"
#else
#define EXTERN_C
#endif /* __cplusplus */

EXTERN_C float  reynolds_f_rhoVLmu
(
 float   rho, float   V, float   L, float   mu
 );

EXTERN_C void   reynolds_vf_rhoVLmu
(
 c_size_t size, float  *re,
 const float  *rho, const float  *V, const float  *L, const float  *mu
 );

EXTERN_C double reynolds_l_rhoVLmu
(
 double  rho, double V, double L, double mu
 );

EXTERN_C void   reynolds_vl_rhoVLmu
(
 c_size_t size, double *re,
 const double *rho, const double *V, const double *L, const double *mu
 );

EXTERN_C float  reynolds_f_VLnu
(
 float   V, float   L, float   nu
 );

EXTERN_C void   reynolds_vf_VLnu
(
 c_size_t size, float  *re,
 const float  *V, const float  *L, const float  *nu
 );


EXTERN_C double reynolds_l_VLnu
(
 double  V, double  L, double  nu
 );

EXTERN_C void   reynolds_vl_VLnu
(
 c_size_t size, double *re,
 const double *V, const double *L, const double *nu
 );

#undef EXTERN_C

#ifdef __cplusplus

float  reynolds(float  rho, float  V, float  L, float  mu);
double reynolds(double rho, double V, double L, double mu);
float  reynolds(float  V, float  L, float  nu);
double reynolds(double V, double L, double nu);

#endif /* __cplusplus */
