local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Components.RegionVisual.Border);
local v3 = require(l_Parent_0.Src.Util.getBoxBorderDimensions);
local v4 = v1.PureComponent:extend("Box");
v4.init = function(v5)
    v5.wireframeRef = v1.createRef();
end;
v4.didUpdate = function(v6, v7)
    v6:setLines(v7.Lines ~= v6.props.Lines);
end;
v4.didMount = function(v8)
    v8:setLines(v8.props.Lines);
end;
v4.setLines = function(v9, v10)
    local l_props_0 = v9.props;
    if not (not l_props_0.Wireframe or not v10) then
        local l_current_0 = v9.wireframeRef.current;
        if l_current_0 then
            l_current_0:clear();
            if l_props_0.Lines then
                l_current_0:addLines(l_props_0.Lines);
            end;
        end;
    end;
end;
v4.render = function(v13)
    local l_props_1 = v13.props;
    local l_Adornee_0 = l_props_1.Adornee;
    local l_AlwaysOnTop_0 = l_props_1.AlwaysOnTop;
    local l_CFrame_0 = l_props_1.CFrame;
    local l_Color_0 = l_props_1.Color;
    local l_LineThickness_0 = l_props_1.LineThickness;
    local l_Lines_0 = l_props_1.Lines;
    local l_Scale_0 = l_props_1.Scale;
    local l_Size_0 = l_props_1.Size;
    local l_Transparency_0 = l_props_1.Transparency;
    local v24 = v3(l_CFrame_0, l_Size_0, l_LineThickness_0);
    local v25 = {};
    for v26, v27 in v24, nil, nil do
        v25[v26] = v1.createElement(v2, {
            Adornee = l_Adornee_0, 
            AlwaysOnTop = l_AlwaysOnTop_0, 
            CFrame = v27.CFrame, 
            Color = l_Color_0, 
            Size = v27.Size, 
            Transparency = l_Transparency_0
        });
    end;
    return v1.createElement("Folder", {}, {
        Borders = v1.createElement("Folder", {}, v25), 
        Main = v1.createElement("BoxHandleAdornment", {
            AlwaysOnTop = l_AlwaysOnTop_0, 
            Adornee = l_Adornee_0, 
            Color3 = l_Color_0, 
            Transparency = l_Transparency_0, 
            Size = l_Size_0, 
            CFrame = l_CFrame_0, 
            ZIndex = 0
        }), 
        Lines = if not l_Lines_0 then nil else v1.createElement("WireframeHandleAdornment", {
            AlwaysOnTop = l_AlwaysOnTop_0, 
            Adornee = l_Adornee_0, 
            Color3 = l_Color_0, 
            Transparency = not l_AlwaysOnTop_0 and 0.5 or 0.92, 
            CFrame = l_CFrame_0, 
            Scale = l_Scale_0, 
            ZIndex = 0, 
            [v1.Ref] = v13.wireframeRef
        })
    });
end;
return v4;
