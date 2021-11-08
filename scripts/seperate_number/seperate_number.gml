// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function seperate_number(_value, _seperator, _digits){
/// num_separator(value, separator, digits)
// num_separator(12345678, "_", 3); // Result: 12_345_678

_value = string(round(_value));
_digits = _digits-1;

var res = "";

var cnt = 0;
for (var i=string_length(_value); i>0; i--)
{
    res = string_char_at(_value, i) + res;
    if cnt++ == _digits and i > 1
    {
        cnt = 0;
        res = _seperator + res;
    }
}

return res;
}