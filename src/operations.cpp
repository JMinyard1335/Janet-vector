#include "operations.h"

void same_size(const std::vector<double> &v1, const std::vector<double> &v2)
{
    if (v1.size() != v2.size())
    {
        int32_t v1_size = v1.size();
        int32_t v2_size = v2.size();

        janet_panicf("Vectors must have the same size! \nvector 1: %d\nvector 2: %d", v1_size, v2_size);
    }
}

/*
    Adds two vectors element wise.
    @param v1: vector 1
    @param v2: vector 2

    @return: a new vector with the result of the addition.
*/
std::vector<double> element_add(const std::vector<double> &v1, const std::vector<double> &v2)
{
    same_size(v1, v2);
    std::vector<double> result;
    for (int i = 0; i < v1.size(); i++)
    {
        double sum = v1[i] + v2[i];
        result.push_back(sum);
    }
    return result;
}

/*
    Subtracts two vectors element wise.
    @param v1: vector 1
    @param v2: vector 2

    @return: a new vector with the result of the subtraction.
*/
std::vector<double> element_sub(const std::vector<double> &v1, const std::vector<double> &v2)
{
    same_size(v1, v2);
    std::vector<double> result;
    for (int i = 0; i < v1.size(); i++)
    {
        result.push_back(v1[i] - v2[i]);
    }
    return result;
}

/*
    Multiplies two vectors element wise.
    @param v1: vector 1
    @param v2: vector 2

    @return: a new vector with the result of the multiplication.
*/
std::vector<double> element_mult(const std::vector<double> &v1, const std::vector<double> &v2)
{
    same_size(v1, v2);
    std::vector<double> result;
    for (int i = 0; i < v1.size(); i++)
    {
        result.push_back(v1[i] * v2[i]);
    }
    return result;
}

/*
    Scales a vector by vector by adding a constant to the elements.
    @param v1: vector 1
    @param c: constant

    @return: a new vector with the result of the scaling.
*/
std::vector<double> scale_add(const std::vector<double> &v1, const double &c)
{
    std::vector<double> result;
    for (int i = 0; i < v1.size(); i++)
    {
        result.push_back(v1[i] + c);
    }
    return result;
}

/*
    Scales a vector by vector by multiplying a constant to the elements.
    @param v1: vector 1
    @param c: constant

    @return: a new vector with the result of the scaling.
*/
std::vector<double> scale_mult(const std::vector<double> &v1, const double &c)
{
    std::vector<double> result;
    for (int i = 0; i < v1.size(); i++)
    {
        result.push_back(v1[i] * c);
    }
    return result;
}

/*
    Dot product of two vectors.
    @param v1: vector 1
    @param v2: vector 2

    @return: a scalar with the result of the dot product.
*/
double dot_product(const std::vector<double> &v1, const std::vector<double> &v2)
{
    same_size(v1, v2);
    double result = 0;
    for (int i = 0; i < v1.size(); i++)
    {
        result += v1[i] * v2[i];
    }
    return result;
}

/*
    Outer product of two vectors.
    @param v1: vector 1
    @param v2: vector 2

    @return: a matrix with the result of the outer product.
*/
std::vector<std::vector<double>> outer_product(const std::vector<double> &v1, const std::vector<double> &v2)
{

    std::vector<std::vector<double>> result(v1.size(), std::vector<double>(v2.size(), 0));
    for (int i = 0; i < v1.size(); i++)
    {
        for (int j = 0; j < v2.size(); j++)
        {
            result[i][j] = v1[i] * v2[j];
        }
    }
    return result;
}
