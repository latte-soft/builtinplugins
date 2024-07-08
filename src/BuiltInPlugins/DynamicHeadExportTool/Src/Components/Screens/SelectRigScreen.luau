local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local l_Selection_0 = game:GetService("Selection");
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_UI_0 = v6.UI;
local l_Button_0 = v6.UI.Button;
local l_InstanceTreeView_0 = v6.UI.InstanceTreeView;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleKey_0 = v6.Style.StyleKey;
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetRig);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
local v16 = require(l_script_FirstAncestor_0.Src.Util.getImportedRig);
local v17 = require(l_script_FirstAncestor_0.Src.Constants);
local v18 = v3.PureComponent:extend("SelectRigScreen");
v18.init = function(v19)
    v19.state = {
        Expansion = {
            [l_Workspace_0] = true
        }, 
        Selection = {}, 
        Instances = {
            l_Workspace_0
        }
    };
end;
v18.didMount = function(v20)
    local v21 = {};
    for _, v23 in l_Selection_0:Get() do
        if v23:IsDescendantOf(l_Workspace_0) then
            v21[v23] = true;
        end;
    end;
    if next(v21) == nil then
        local v24 = v16();
        if v24 then
            v21[v24] = true;
        end;
    end;
    if next(v21) ~= nil then
        v20:setState({
            Selection = v21
        });
    end;
end;
v18.render = function(v25)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    local l_Localization_0 = l_props_0.Localization;
    local v29 = {};
    for v30 in l_state_0.Selection, nil, nil do
        if typeof(v30) == "Instance" then
            table.insert(v29, v30);
        end;
    end;
    local v31 = (#v29 == 1 and v29[1].ClassName == "Model") and v29[1] or nil;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_props_0.Stylizer[l_StyleKey_0.MainBackground], 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v17.Padding), 
            PaddingLeft = UDim.new(0, v17.Padding), 
            PaddingRight = UDim.new(0, v17.Padding), 
            PaddingTop = UDim.new(0, v17.Padding)
        }), 
        Content = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(30 + v17.Padding))
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v17.Padding)
            }), 
            TextLabel = v3.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Text = l_Localization_0:getText("Plugin", "SelectImportedRig"), 
                Style = "Title", 
                Size = UDim2.new(1, 0, 0, 20), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            MeshPartSelector = v3.createElement(l_InstanceTreeView_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, -100, 0, 200), 
                Expansion = l_state_0.Expansion, 
                Selection = l_state_0.Selection, 
                Instances = l_state_0.Instances, 
                OnSelectionChange = function(v32)
                    v25:setState({
                        Selection = v32
                    });
                end, 
                OnExpansionChange = function(v33)
                    v25:setState({
                        Expansion = v5.Dictionary.join(v25.state.Expansion, v33)
                    });
                end
            })
        }), 
        Button = v3.createElement(l_Button_0, {
            Text = l_Localization_0:getText("Plugin", "NextButton"), 
            Style = not v31 and "Round" or "RoundPrimary", 
            TextSize = 24, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 1, -30), 
            OnClick = function()
                if v31 then
                    l_props_0.setRig(v31);
                    l_props_0.setScreen(v17.Screens.InputSurfaceAppearanceIds);
                end;
            end
        })
    });
end;
return v4.connect(nil, function(v34)
    return {
        close = function()
            v34(v13(false));
        end, 
        setRig = function(v35)
            v34(v14(v35));
        end, 
        setScreen = function(v36)
            v34(v15(v36));
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v18)));
