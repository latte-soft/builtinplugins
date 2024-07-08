local v0 = false;
return function()
    if not v0 then
        v0 = true;
        require(script.Parent.defineLuaFlags);
        return ;
    else
        return ;
    end;
end;
