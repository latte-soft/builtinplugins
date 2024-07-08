local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Select_0 = require(l_Parent_0.Packages.Framework).UI.PropertyCell.Renderers.Select;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
return v1.connect(function(v9)
    return {
        Fonts = v9.Asset.Fonts
    };
end)(function(v10)
    local l_Value_0 = v10.Value;
    return v2.createElement(l_Select_0, {
        OnChanged = function(v12)
            l_Value_0.Weight = v12;
            v10.OnChanged(l_Value_0);
        end, 
        PlaceholderText = "Bold (procedural)", 
        Schema = {
            Items = l_useMemo_0(function()
                return l_collectArray_0(if not v10.Fonts[l_Value_0.Family] then {} else v10.Fonts[l_Value_0.Family].Faces, function(_, v14)
                    if v14.Style == Enum.FontStyle.Italic then
                        return nil;
                    else
                        local l_Weight_0 = v14.Weight;
                        return {
                            Id = l_Weight_0, 
                            Label = l_Weight_0.Name, 
                            Value = l_Weight_0
                        };
                    end;
                end);
            end, {
                l_Value_0.Family
            })
        }, 
        Value = l_Value_0.Weight
    });
end);
