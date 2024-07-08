local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local v7 = v2.PureComponent:extend("UploadDestinationProperty");
local function _(v8, v9)
    for v10, v11 in v9, nil, nil do
        if v11 == v8 then
            return v10;
        end;
    end;
end;
v7.render = function(v13)
    local l_props_0 = v13.props;
    local v15 = {
        l_props_0.Localization:getText("UploadDestination", "Me")
    };
    local v16 = {
        -1
    };
    for _, v18 in l_props_0.ManagedGroups, nil, nil do
        table.insert(v15, v18.name);
        table.insert(v16, v18.groupId);
    end;
    local l_Value_0 = l_props_0.Value;
    local v20;
    for v21, v22 in v16, nil, nil do
        if v22 == l_Value_0 then
            v20 = v21;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v20 = nil;
    ::label0::;
    if v20 == nil then
        v20 = 1;
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = l_props_0.Size
    }, {
        WrapperContents = v2.createElement(l_SelectInput_0, {
            OnItemActivated = function(_, v24)
                l_props_0.OnSetItem(v16[v24]);
            end, 
            Items = v15, 
            SelectedIndex = v20, 
            Focus = v15[v20], 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;
return v3.connect(function(v25)
    return {
        ManagedGroups = v25.Preview.managedGroups
    };
end)(v7);
