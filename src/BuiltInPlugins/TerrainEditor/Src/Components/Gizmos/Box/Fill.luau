local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local v5 = require(script.Parent.Border);
local v6 = require(l_script_FirstAncestor_0.Src.Util.getBoxBorderDimensions);
return function(v7)
    local v8 = l_useRef_0(false);
    l_useEffect_0(function()
        local l_current_0 = v8.current;
        if not (not l_current_0 or not l_current_0:IsA("WireframeHandleAdornment")) then
            l_current_0:clear();
            if v7.Lines then
                l_current_0:addLines(v7.Lines);
            end;
        end;
    end, {
        v7.Lines
    });
    local l_Adornee_0 = v7.Adornee;
    local l_AlwaysOnTop_0 = v7.AlwaysOnTop;
    local l_Color_0 = v7.Color;
    local l_LineThickness_0 = v7.LineThickness;
    local l_Lines_0 = v7.Lines;
    local l_Scale_0 = v7.Scale;
    local l_Size_0 = v7.Size;
    local l_Transform_0 = v7.Transform;
    local l_Transparency_0 = v7.Transparency;
    local v19 = v6(l_Transform_0, l_Size_0, l_LineThickness_0);
    local v20 = {};
    for v21, v22 in v19, nil, nil do
        v20[v21] = v1.createElement(v5, {
            Adornee = l_Adornee_0, 
            AlwaysOnTop = l_AlwaysOnTop_0, 
            Transform = v22.Transform, 
            Color = l_Color_0, 
            Size = v22.Size, 
            Transparency = l_Transparency_0
        });
    end;
    return v1.createElement("Folder", {}, {
        Borders = v1.createElement("Folder", {}, v20), 
        Main = v1.createElement("BoxHandleAdornment", {
            AlwaysOnTop = l_AlwaysOnTop_0, 
            Adornee = l_Adornee_0, 
            CFrame = l_Transform_0, 
            Color3 = l_Color_0, 
            Transparency = l_Transparency_0, 
            Size = l_Size_0, 
            ZIndex = 0
        }), 
        Lines = if not l_Lines_0 then nil else v1.createElement("WireframeHandleAdornment", {
            AlwaysOnTop = l_AlwaysOnTop_0, 
            Adornee = l_Adornee_0, 
            CFrame = l_Transform_0, 
            Color3 = l_Color_0, 
            Transparency = l_Transparency_0 * 0.8, 
            Scale = l_Scale_0, 
            ZIndex = 0, 
            [v2.Ref] = v8
        })
    });
end;
