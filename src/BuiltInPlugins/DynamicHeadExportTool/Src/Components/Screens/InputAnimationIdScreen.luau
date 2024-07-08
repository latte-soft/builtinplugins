local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Components.FormScreen);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationId);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.ProcessMood);
local v8 = v1.PureComponent:extend("InputAnimationIdScreen");
v8.init = function(v9)
    v9.onExpansionChange = function(v10)
        v9:setState({
            Expansion = v10
        });
    end;
    v9.onChange = function(v11)
        v9:setState({
            Items = v11
        });
    end;
    v9.state = {
        Expansion = {}, 
        Items = {}
    };
end;
v8.didMount = function(v12)
    local l_Localization_0 = v12.props.Localization;
    v12:setState({
        Items = {
            {
                Id = "AnimationId", 
                Label = l_Localization_0:getText("Plugin", "AnimationAssetId"), 
                Children = {
                    {
                        Id = "Animation", 
                        Label = l_Localization_0:getText("Plugin", "Animation"), 
                        Schema = {
                            Type = "Text"
                        }, 
                        Value = ""
                    }
                }
            }
        }
    });
end;
v8.render = function(v14)
    return v1.createElement(v4, {
        Expansion = v14.state.Expansion, 
        Items = v14.state.Items, 
        onExpansionChange = v14.onExpansionChange, 
        onChange = v14.onChange, 
        onSubmit = function()
            v14.props.close();
            local v15 = {};
            for _, v17 in v14.state.Items[1].Children, nil, nil do
                v15[v17.Id] = v17.Value;
            end;
            v14.props.setAnimationId(v15.Animation);
            v14.props.processMood();
        end
    });
end;
return v2.connect(function(v18, _)
    return {
        mode = v18.PluginReducer.mode
    };
end, function(v20)
    return {
        close = function()
            v20(v5(false));
        end, 
        setAnimationId = function(v21)
            v20(v6(v21));
        end, 
        processMood = function()
            v20(v7());
        end
    };
end)((l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v8)));
