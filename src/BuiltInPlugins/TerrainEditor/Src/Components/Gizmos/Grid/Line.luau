local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useMouseDown);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v6)
    local v7 = l_Stylizer_0:use("Line");
    local l_Color_0 = v7.Color;
    local v9 = if not v4() then v7.Transparency else v7.TransparencyActive;
    return v2.createElement("BoxHandleAdornment", {
        Adornee = v6.Adornee, 
        AlwaysOnTop = v6.AlwaysOnTop, 
        Archivable = false, 
        CFrame = v6.CFrame, 
        Color = l_Color_0, 
        Size = v6.Size, 
        Transparency = if not v6.AlwaysOnTop then v9 else 0.5 + 0.5 * v9, 
        Visible = v6.Visible, 
        ZIndex = not v6.AlwaysOnTop and -1 or 0
    });
end;
