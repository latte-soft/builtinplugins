local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Parent_1 = script.Parent;
local v7 = require(l_Parent_1.MapSettingsWithPreviewFragment);
local v8 = require(l_Parent_1.Panel);
local v9 = v3.PureComponent:extend(script.Name);
v9.render = function(v10)
    return v3.createElement(v8, {
        LayoutOrder = v10.props.LayoutOrder, 
        isSubsection = v10.props.isSubsection, 
        Title = v10.props.Localization:getText("MapSettings", "MapSettings"), 
        Padding = UDim.new(0, 12)
    }, {
        MapSettingsWithPreviewFragment = v3.createElement(v7, (v2.Dictionary.join(v10.props, {
            LayoutOrder = v2.None, 
            isSubsection = v2.None, 
            InitialLayoutOrder = 1
        })))
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
