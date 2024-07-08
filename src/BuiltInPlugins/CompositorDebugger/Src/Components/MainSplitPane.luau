local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_SplitPane_0 = v2.UI.SplitPane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = v1.PureComponent:extend("MainSplitPane");
v10.init = function(v11)
    v11.state = {
        sizes = v11.props.InitialSizes
    };
    v11.onSizesChange = function(v12)
        v11:setState({
            sizes = v12
        });
    end;
end;
v10.render = function(v13)
    local l_state_0 = v13.state;
    local l_props_0 = v13.props;
    return v1.createElement(l_SplitPane_0, {
        Size = UDim2.fromScale(1, 1), 
        Sizes = l_state_0.sizes, 
        OnSizesChange = v13.onSizesChange, 
        MinSizes = l_props_0.MinSizes, 
        PaneStyle = "BorderBox", 
        BarStyle = "BorderBox", 
        UseScale = true, 
        ClampSize = true, 
        Layout = l_props_0.Layout
    }, l_props_0.children);
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v10));
