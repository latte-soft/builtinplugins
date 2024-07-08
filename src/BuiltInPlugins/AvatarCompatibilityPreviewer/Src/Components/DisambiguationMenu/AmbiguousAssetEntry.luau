local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenu.DisambiguationMenuEntry);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v12)
    local v13 = l_Localization_0:use();
    local v14 = l_Stylizer_0:use("DisambiguationMenu");
    local v16 = v1.collectArray(v12.AmbiguousAsset.instances, function(v15)
        return {
            Id = v15, 
            Label = v13:getText("AssetPalettes", v15.Key)
        };
    end);
    table.sort(v16, function(v17, v18)
        return v17.Label < v18.Label;
    end);
    return v3.createElement(v4, {
        Name = v12.AmbiguousAsset.worldModel.Name, 
        Instance = v12.AmbiguousAsset.worldModel, 
        LayoutOrder = v12.LayoutOrder
    }, {
        Dropdown = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0, v14.DropdownWidth, 0, 0)
        }, {
            DropdownMenu = v3.createElement(l_SelectInput_0, {
                PlaceholderText = v13:getText("DisambiguationMenu", "DropdownPlaceholder"), 
                Width = v14.DropdownWidth, 
                SelectedId = v12.AssignedPalette, 
                OnItemActivated = function(v19)
                    v12.SetAssignedPalette(v19.Id);
                end, 
                Items = v16
            })
        })
    });
end;
