local v0 = {
    [Enum.MaterialPattern.Regular] = "Regular", 
    [Enum.MaterialPattern.Organic] = "Organic"
};
return function(v1)
    return v0[v1];
end;
