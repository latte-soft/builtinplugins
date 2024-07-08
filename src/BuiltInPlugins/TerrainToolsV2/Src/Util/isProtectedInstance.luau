local function v0()
end;
return function(v1)
    if xpcall(function()
        local _ = v1.Name;
    end, v0) then
        return false;
    else
        return true;
    end;
end;
