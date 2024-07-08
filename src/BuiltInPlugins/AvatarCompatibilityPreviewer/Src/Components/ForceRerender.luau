local v0 = require(script.Parent.Parent.Parent.Packages.React);
return function(v1)
    local v2, v3 = v0.useState(false);
    v0.useEffect(function()
        v3(true);
    end, v1.dependencies);
    v0.useEffect(function()
        if v2 then
            v3(false);
            return ;
        else
            return ;
        end;
    end, {
        v2
    });
    if not v2 then
        return v0.createElement(v1.component, v1.innerProps);
    else
        return nil;
    end;
end;
