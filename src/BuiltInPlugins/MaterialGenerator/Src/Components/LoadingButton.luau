local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v9)
    local v10 = l_Stylizer_0:use("LoadingButton");
    local l_isLoading_0 = v9.isLoading;
    local v12 = v9.isDisabled or l_isLoading_0;
    local _ = if not l_isLoading_0 then v9.Text else "";
    return v2.createElement(l_Button_0, {
        AnchorPoint = v9.AnchorPoint, 
        AutomaticSize = v9.AutomaticSize, 
        LayoutOrder = v9.LayoutOrder, 
        OnClick = v9.onClick, 
        Position = v9.Position, 
        Size = v9.Size, 
        Style = "RoundPrimary", 
        StyleModifier = if not v12 then nil else l_StyleModifier_0.Disabled, 
        Text = if not l_isLoading_0 then v9.Text else ""
    }, {
        LoadingIndicator = if not l_isLoading_0 then nil else v2.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v10.LoadingIndicatorSize
        })
    });
end;
