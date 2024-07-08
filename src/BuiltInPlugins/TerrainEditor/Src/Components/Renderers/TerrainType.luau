local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_IconButton_0 = v1.UI.IconButton;
local _ = v1.UI.Image;
local l_Pane_0 = v1.UI.Pane;
local _ = v1.UI.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v11 = require(l_script_FirstAncestor_0.Src.Util.getItems);
local v12 = require(l_script_FirstAncestor_0.Src.Types);
local l_EnumType_0 = v12.EnumType;
local l_TerrainType_0 = v12.TerrainType;
return function(v15)
    local v16 = l_Localization_0:use();
    local v17 = l_useMemo_0(function()
        return v11(v16, nil, l_EnumType_0.TerrainType);
    end);
    local v18 = l_Stylizer_0:use("TerrainTypeRenderer");
    local l_ItemsPerRow_0 = v18.ItemsPerRow;
    local v20 = {};
    local v21 = {};
    local v22 = 0;
    local v23 = 1;
    for _, v25 in v17, nil, nil do
        local l_Id_0 = v25.Id;
        if l_Id_0 ~= l_TerrainType_0.None then
            local l_Label_0 = v25.Label;
            v23 = math.floor(v22 / l_ItemsPerRow_0) + 1;
            local v28 = v22 % l_ItemsPerRow_0 + 1;
            v21[l_Id_0] = v2.createElement(l_Pane_0, {
                LayoutOrder = v28, 
                Size = UDim2.new(1 / l_ItemsPerRow_0, -v18.Spacing * ((l_ItemsPerRow_0 - 1) / l_ItemsPerRow_0), 0, v18.Height)
            }, {
                Button = v2.createElement(l_IconButton_0, {
                    BorderColor = if l_Id_0 == v15.Value then v18.BorderColor else nil, 
                    IconSize = v18.IconSize, 
                    LeftIcon = ("rbxasset://textures/TerrainEditor/%*.png"):format((string.lower(l_Id_0))), 
                    OnClick = function()
                        if v15.Value == l_Id_0 then
                            v15.OnChanged(l_TerrainType_0.None);
                            return ;
                        else
                            v15.OnChanged(l_Id_0);
                            return ;
                        end;
                    end, 
                    Size = UDim2.fromScale(1, 1), 
                    Text = l_Label_0
                })
            });
            if v28 == l_ItemsPerRow_0 then
                v20[("Row%*"):format(v23)] = v2.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Horizontal, 
                    LayoutOrder = v23, 
                    Size = UDim2.new(1, 0, 0, v18.Height), 
                    Spacing = v18.Spacing
                }, v21);
                v21 = {};
            end;
            v22 = v22 + 1;
        end;
    end;
    if next(v21) then
        v20.FinalRow = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v23, 
            Size = UDim2.new(1, 0, 0, v18.Height), 
            Spacing = v18.Spacing
        }, v21);
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = v18.Spacing
    }, v20);
end;
