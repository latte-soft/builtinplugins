local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
return function(v1)
    local v2 = nil;
    local v3 = nil;
    if v1.Adornee.ClassName == "Attachment" then
        v2 = v1.Adornee.Parent;
        v3 = v1.Adornee.CFrame;
    else
        v2 = v1.Adornee;
    end;
    return v0.createElement("SphereHandleAdornment", {
        Adornee = v2, 
        CFrame = v3, 
        Color3 = v1.Color, 
        AlwaysOnTop = v1.AlwaysOnTop, 
        Transparency = 0.3, 
        ZIndex = if not v1.AlwaysOnTop then nil else 1
    });
end;
