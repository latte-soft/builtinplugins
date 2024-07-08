local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Components.FormScreen);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetAccessoryType);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.ProcessAccessory);
local v8 = v1.PureComponent:extend("InputAccessoryTypeScreen");
local function v12()
    local v9 = {};
    for _, v11 in Enum.AccessoryType:GetEnumItems() do
        table.insert(v9, {
            Id = v11.Name, 
            Label = v11.Name
        });
    end;
    return v9;
end;
v8.init = function(v13)
    v13.onExpansionChange = function(v14)
        v13:setState({
            Expansion = v14
        });
    end;
    v13.onChange = function(v15)
        v13:setState({
            Items = v15
        });
    end;
    v13.state = {
        Expansion = {}, 
        Items = {}
    };
end;
v8.didMount = function(v16)
    local l_Localization_0 = v16.props.Localization;
    v16:setState({
        Items = {
            {
                Id = "AccessoryType", 
                Label = l_Localization_0:getText("Plugin", "InputAccesoryType"), 
                Children = {
                    {
                        Id = "AccessoryType", 
                        Label = l_Localization_0:getText("Plugin", "AccesoryType"), 
                        Schema = {
                            Type = "Select", 
                            Items = v12()
                        }, 
                        Value = v16:inferAccessoryType().Name
                    }
                }
            }
        }
    });
end;
local function v21(v18)
    for _, v20 in v18:GetChildren() do
        if not (not v20:IsA("MeshPart") or not v20:FindFirstChildOfClass("WrapLayer")) then
            return v20;
        end;
    end;
    return nil;
end;
v8.inferAccessoryType = function(v22)
    local l_rig_0 = v22.props.rig;
    if l_rig_0 then
        local v24 = v21(l_rig_0);
        if v24 then
            if not string.find(string.lower(v24.Name), "eyebrow") then
                if string.find(string.lower(v24.Name), "eyelash") then
                    return Enum.AccessoryType.Eyelash;
                end;
            else
                return Enum.AccessoryType.Eyebrow;
            end;
        end;
    end;
    return Enum.AccessoryType.Unknown;
end;
v8.render = function(v25)
    return v1.createElement(v4, {
        Expansion = v25.state.Expansion, 
        Items = v25.state.Items, 
        onExpansionChange = v25.onExpansionChange, 
        onChange = v25.onChange, 
        onSubmit = function()
            local v26 = {};
            for _, v28 in v25.state.Items[1].Children, nil, nil do
                v26[v28.Id] = v28.Value;
            end;
            v25.props.setAccessoryType(Enum.AccessoryType[v26.AccessoryType]);
            v25.props.close();
            v25.props.processAccessory();
        end
    });
end;
return v2.connect(function(v29, _)
    return {
        rig = v29.PluginReducer.rig
    };
end, function(v31)
    return {
        close = function()
            v31(v5(false));
        end, 
        setAccessoryType = function(v32)
            v31(v6(v32));
        end, 
        processAccessory = function()
            v31(v7());
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v8)));
