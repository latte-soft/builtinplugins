local v0 = newproxy(true);
getmetatable(v0).__tostring = function()
    return "Symbol(LoadingInProgress)";
end;
return v0;
