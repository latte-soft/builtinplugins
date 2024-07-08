return function(v0)
    if v0 then
        return (string.gsub(v0, "[\n\t]", ""));
    else
        return nil;
    end;
end;
