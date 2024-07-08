local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function(v12)
    local v13 = v3:use():get();
    local l_Avatar_0 = l_Stylizer_0:use("ImportPage").Avatar;
    local v15 = l_LayoutOrderIterator_0.new();
    local v19 = v2.useMemo(function()
        local v16 = v12.Cell.Avatar:Clone();
        for _, v18 in v16:GetDescendants() do
            if not (not v18:IsA("LuaSourceContainer") and not v18:IsA("Sound")) then
                v18:Destroy();
            end;
        end;
        return v16;
    end, {
        v12.Cell.Avatar
    });
    return v2.createElement(l_Button_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = v12.Position, 
        OnClick = function()
            v13:Set({
                v12.Cell.Avatar
            });
        end, 
        Size = v12.Size
    }, {
        v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Padding = l_Avatar_0.InnerPadding, 
            Spacing = l_Avatar_0.Padding
        }, {
            Preview = v2.createElement(l_AssetRenderModel_0, {
                FocusDirection = v19.PrimaryPart.CFrame.LookVector, 
                Model = v19, 
                Static = true, 
                Ambient = l_Avatar_0.PreviewAmbient, 
                LayoutOrder = v15:getNextOrder(), 
                LightColor = Color3.new(1, 1, 1), 
                LightDirection = -v19.PrimaryPart.CFrame.LookVector, 
                Size = UDim2.fromOffset(l_Avatar_0.IconSize, l_Avatar_0.IconSize)
            }), 
            Name = v2.createElement(l_TextLabel_0, {
                LayoutOrder = v15:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_Avatar_0.NameFontSize * l_Avatar_0.NameLines), 
                Text = v12.Cell.Avatar.Name, 
                TextColor = l_Avatar_0.TitleColor, 
                TextSize = l_Avatar_0.NameFontSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            })
        })
    });
end;
