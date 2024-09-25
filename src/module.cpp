#include <vector>
#include <janet.h>
#include "operations.h"
#include "conversion.h"

static Janet add_vectors(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    std::vector<double> result = element_add(v1, v2);

    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

Janet sub_vectors(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    std::vector<double> result = element_sub(v1, v2);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

Janet mult_vectors(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    std::vector<double> result = element_mult(v1, v2);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

Janet dot_vectors(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    double result = dot_product(v1, v2);
    return janet_wrap_number(result);
}

Janet outer_vectors(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    std::vector<std::vector<double>> result = outer_product(v1, v2);
    JanetArray *array = janet_array(0);
    for (int i = 0; i < result.size(); i++)
    {
        JanetArray *inner_array = janet_array(0);
        for (int j = 0; j < result[i].size(); j++)
        {
            janet_array_push(inner_array, janet_wrap_number(result[i][j]));
        }
        janet_array_push(array, janet_wrap_array(inner_array));
    }
    return janet_wrap_array(array);
}

Janet scale_a(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    double c = janet_getnumber(argv, 1);
    std::vector<double> result = scale_add(v1, c);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

Janet scale_m(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    double c = janet_getnumber(argv, 1);
    std::vector<double> result = scale_mult(v1, c);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

Janet norm(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 1);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    double result = norm(v1);
    return janet_wrap_number(result);
}

Janet cross(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 2);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> v2 = janet_to_vector(argv[1]);
    std::vector<double> result = cross_product(v1, v2);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }

    return janet_wrap_array(array);
}

Janet length(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 1);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    int result = length(v1);
    return janet_wrap_integer(result);
}

Janet normalize(int32_t argc, Janet *argv)
{
    janet_fixarity(argc, 1);
    std::vector<double> v1 = janet_to_vector(argv[0]);
    std::vector<double> result = normalize(v1);
    JanetArray *array = janet_array(result.size());
    for (int i = 0; i < result.size(); i++)
    {
        janet_array_push(array, janet_wrap_number(result[i]));
    }
    return janet_wrap_array(array);
}

static JanetReg cfuns[] = {
    {"el-add", add_vectors, "(vector/el-add v1 v2)\n\nTakes in two Janet Arrays 'v1' 'v2' and adds the elements of 'v2' to 'v1'."},
    {"el-sub", sub_vectors, "(vector/el-sub v1 v2)\n\nTakes in two Janet Arrays 'v1' 'v2' and subtracts the elements of 'v2' from 'v1'."},
    {"el-mult", mult_vectors, "(vector/el-mult v1 v2)\n\nTakes in two Janet Arrays 'v1' 'v2' and multiplies the arrays element-wise."},
    {"sc-add", scale_a, "(vector/sc-add v1 c)\n\nTakes in a Janet Array 'v1' and a Janet Number 'c' and adds 'c' to each element of 'v1'."},
    {"sc-mult", scale_m, "(vector/sc-mult v1 c)\n\nTakes in a Janet Array 'v1' and a Janet Number 'c' and multiplies each element of 'v1' by 'c'"},
    {"dot", dot_vectors, "(vector/dot v1 v2)\n\nTakes in two Janet Arrays 'v1' and 'v2' and finds the dot product of the two arrays."},
    {"outer", outer_vectors, "(vector/outer v1 v2)\n\nTakes in two Janet Arrays 'v1' and 'v2' and creates the matrix resulting from taking the outer product."},
    {"norm", norm, "(vector/norm v1)\n\nTakes in a Janet Array 'v1' and finds the norm of the array."},
    {"cross", cross, "(vector/cross v1 v2)\n\nTakes in two Janet Arrays 'v1' and 'v2' and finds the cross product of the two arrays."},
    {"length", length, "(vector/length v1)\n\nTakes in a Janet Array 'v1' and finds the length of the array."},
    {"normalize", normalize, "(vector/normalize v1)\n\nTakes in a Janet Array 'v1' and normalizes the array."},
    {NULL, NULL, NULL}};

JANET_MODULE_ENTRY(JanetTable *env)
{
    janet_cfuns(env, "vector", cfuns);
}