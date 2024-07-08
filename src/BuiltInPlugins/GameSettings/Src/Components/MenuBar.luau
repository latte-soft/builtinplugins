local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v7 = require(l_Parent_0.Src.Components.MenuEntry);
local v8 = v1.PureComponent:extend("MenuBar");
local v9 = {
    BasicInfo = {
        name = true, 
        description = true, 
        playableDevices = true
    }, 
    Avatar = {
        universeAvatarAssetOverrides = true
    }
};
local v10 = {
    Permissions = {
        isActive = true
    }, 
    Avatar = {
        universeAvatarType = true
    }
};
v9.BasicInfo.thumbnails = true;
v9.BasicInfo.gameIcon = true;
if settings():GetFFlag("DeveloperSubscriptionsEnabled") then
    v9.Monetization = {
        DeveloperSubscriptions = true
    };
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v15 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 1)
        })
    };
    for v16, v17 in ipairs(l_props_0.Entries) do
        local v18 = false;
        if v9[v17] then
            for v19 in pairs(l_props_0.Errors) do
                if v9[v17][v19] then
                    v18 = true;
                    break;
                end;
            end;
        end;
        local v20 = false;
        if v10[v17] then
            for _, v22 in ipairs(l_props_0.Warnings) do
                if v10[v17][v22] then
                    v20 = true;
                    break;
                end;
            end;
        end;
        table.insert(v15, v1.createElement(v7, {
            Title = l_Localization_0:getText("General", "Category" .. v17), 
            Selected = l_props_0.Selected == v16, 
            Index = v16, 
            Error = v18, 
            Warning = v20, 
            OnClicked = function()
                l_props_0.SelectionChanged(v16);
            end
        }));
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v6.MENU_BAR_WIDTH, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.menuBar.backgroundColor, 
        BorderSizePixel = 0
    }, v15);
end;
return v3.connect(function(v23, _)
    if v23 then
        return {
            Errors = v23.Settings.Errors, 
            Warnings = v23.Settings.Warnings
        };
    else
        return ;
    end;
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8)));
