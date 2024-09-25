#include "conversion.h"

std::vector<double> janet_to_vector(const Janet &arg)
{
    std::vector<double> v;
    JanetType type = janet_type(arg);

    if (type != JANET_ARRAY)
    {
        janet_panic("Expected an array");
        exit(1);
    }

    const JanetArray *array = janet_unwrap_array(arg);
    for (int i = 0; i < array->count; i++)
    {
        Janet element = array->data[i];
        if (janet_type(element) != JANET_NUMBER)
        {
            janet_panicf("Expected a number at index %d", i);
        }
        double num = janet_unwrap_number(element);
        v.push_back(num);
    }
    return v;
}