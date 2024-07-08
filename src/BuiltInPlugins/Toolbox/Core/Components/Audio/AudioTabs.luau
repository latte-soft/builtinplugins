local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v9 = require(l_script_FirstAncestor_0.Core.Util.Images);
local v10 = v2.PureComponent:extend("AudioTabs");
v10.init = function(v11, _)
    v11.state = {};
end;
v10.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnTabSelect_0 = l_props_0.OnTabSelect;
    local l_SelectedTab_0 = l_props_0.SelectedTab;
    local l_audioTabs_0 = l_props_0.Stylizer.audioTabs;
    local function v23(v19, v20, v21)
        local l_name_0 = v19.name;
        return v2.createElement("ImageButton", {
            Size = UDim2.new(0.5, 0, 1, 0), 
            LayoutOrder = v21, 
            BackgroundColor3 = if l_SelectedTab_0 == l_name_0 then l_audioTabs_0.selectedButtonColor else l_audioTabs_0.backgroundButtonColor, 
            [v2.Event.MouseButton1Click] = function()
                l_OnTabSelect_0(l_name_0);
            end
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 5)
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            Icon = v2.createElement("Frame", {
                Size = UDim2.new(0, 20, 0, 20), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                v2.createElement("ImageLabel", {
                    Image = v20, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 20, 0, 20), 
                    LayoutOrder = 1, 
                    ImageColor3 = if l_SelectedTab_0 == l_name_0 then l_audioTabs_0.selectedTextColor else l_audioTabs_0.textColor
                })
            }), 
            Text = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Text = l_Localization_0:getText("Audio", l_name_0), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Font = v7.FONT, 
                TextSize = v7.FONT_SIZE_MEDIUM, 
                TextColor3 = if l_SelectedTab_0 == l_name_0 then l_audioTabs_0.selectedTextColor else l_audioTabs_0.textColor
            })
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        SoundEffectTab = v23(v8.SOUND_EFFECTS, v9.SOUND_EFFECT_ICON, 1), 
        MusicTab = v23(v8.MUSIC, v9.MUSIC_ICON, 2)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
