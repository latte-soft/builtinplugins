local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_collectArray_0 = require(l_Parent_0.Packages.Dash).collectArray;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_Select_0 = l_UI_0.PropertyCell.Renderers.Select;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v9 = require(l_Parent_0.Src.Util.sortByLabel);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("PropertyCellSize");
return v1.connect(function(v14)
    return {
        Fonts = v14.Asset.Fonts
    };
end)(function(v15)
    return v2.createElement(l_Select_0, {
        OnChanged = function(v16)
            local l_Value_0 = v15.Value;
            l_Value_0.Family = v16;
            v15.OnChanged(l_Value_0);
        end, 
        OnRenderItem = function(v18, v19, v20, _)
            return v2.createElement(l_Button_0, {
                LayoutOrder = v19, 
                OnClick = function()
                    v20();
                end, 
                Size = l_Attribute_0
            }, {
                Label = v2.createElement(l_TextLabel_0, {
                    RichText = true, 
                    Text = ("<font family='%*'>%*</font>"):format(v18.Id, v18.Label), 
                    [v2.Tag] = "X-Fill X-Pad ItemTextSize TextXAlignLeft"
                })
            });
        end, 
        PlaceholderText = v15.Value.Family == "rbxasset://fonts/families/LegacyArial.json" and "Arial (Legacy)" or "Font...", 
        Schema = {
            Items = l_useMemo_0(function()
                return v9((l_collectArray_0(v15.Fonts, function(_, v23)
                    if v23.AssetId == "rbxasset://fonts/families/LegacyArial.json" then
                        return nil;
                    else
                        return {
                            Id = v23.AssetId, 
                            Label = v23.Name, 
                            Value = v23.AssetId
                        };
                    end;
                end)));
            end, {
                v15.Fonts
            })
        }, 
        Value = v15.Value.Family
    });
end);
