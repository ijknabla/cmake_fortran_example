
#include "reynolds.h"

float  reynolds(float  rho, float  V, float  L, float  mu){
  return reynolds_f_rhoVLmu(rho, V, L, mu);
};

double reynolds(double rho, double V, double L, double mu){
  return reynolds_l_rhoVLmu(rho, V, L, mu);
};

float  reynolds(float  V, float  L, float  nu){
  return reynolds_f_VLnu(V, L, nu);
};

double reynolds(double V, double L, double nu){
  return reynolds_l_VLnu(V, L, nu);
};
