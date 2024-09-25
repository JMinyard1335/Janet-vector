#ifndef CONVERSION_H
#define CONVERSION_H

#include <janet.h>
#include <vector>
#include <iostream>

std::vector<double> janet_to_vector(const Janet &arg);

#endif // CONVERSION_H