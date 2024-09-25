#ifndef OPERATIONS_H
#define OPERATIONS_H

#include <vector>
#include <janet.h>

// functions that will return a new vector
std::vector<double> element_add(const std::vector<double> &v1, const std::vector<double> &v2);
std::vector<double> element_sub(const std::vector<double> &v1, const std::vector<double> &v2);
std::vector<double> element_mult(const std::vector<double> &v1, const std::vector<double> &v2);
std::vector<double> scale_add(const std::vector<double> &v1, const double &c);
std::vector<double> scale_mult(const std::vector<double> &v1, const double &c);

// functions that return a scaler
double dot_product(const std::vector<double> &v1, const std::vector<double> &v2);
std::vector<std::vector<double>> outer_product(const std::vector<double> &v1, const std::vector<double> &v2);

#endif // OPERATIONS_H