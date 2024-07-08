local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Util.Enums);
local _ = require(l_Parent_0.Src.Actions.Common.SetPluginState);
return v1.createReducer({
    pluginState = v4.PluginState.Default
}, {
    SetPluginState = function(v6, v7)
        return l_join_0(v6, {
            pluginState = v7.state
        });
    end
});
