local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_PermissionsService_0 = game:GetService("PermissionsService");
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local v8 = require(l_Parent_0.Src.Thunks.SetPluginPermission);
local v9 = require(l_Parent_0.Src.Components.FluidFitTextLabel);
local v10 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local l_FitFrameVertical_0 = v4.FitFrameVertical;
local v12 = require(l_Parent_0.Src.Util.Constants);
local v13 = v2.Component:extend("ScriptInjectionHolder");
local l_ToggleButton_0 = l_UI_0.ToggleButton;
v13.defaultProps = {
    scriptInjectionPermissions = {}
};
v13.init = function(v15)
    v15.frameRef = v2.createRef();
    v15.state = {
        frameWidth = 0
    };
    v15.onCheckboxActivated = function(v16)
        return v15.props.setPluginPermission(v15.props.API:get(), v15.props.assetId, v16);
    end;
    v15.resizeFrame = function()
        local l_current_0 = v15.frameRef.current;
        if l_current_0 then
            if v15.state.frameWidth ~= l_current_0.AbsoluteSize.X then
                v15:setState({
                    frameWidth = l_current_0.AbsoluteSize.X
                });
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v13.didMount = function(v18)
    v18.resizeFrame();
end;
v13.renderCheckbox = function(v19, _, v21, v22)
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 16), 
        LayoutOrder = v21
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8)
        }), 
        ToggleButton = v2.createElement(l_ToggleButton_0, {
            Disabled = false, 
            LayoutOrder = 1, 
            OnClick = function()
                v19.onCheckboxActivated(v22);
            end, 
            Selected = v22.allowed, 
            Size = UDim2.new(0, v12.TOGGLE_BUTTON_WIDTH, 0, v12.TOGGLE_BUTTON_HEIGHT)
        })
    });
end;
v13.render = function(v23)
    local l_Localization_0 = v23.props.Localization;
    local l_scriptInjectionPermissions_0 = v23.props.scriptInjectionPermissions;
    local l_LayoutOrder_0 = v23.props.LayoutOrder;
    local l_Stylizer_0 = v23.props.Stylizer;
    local v28 = {};
    for v29, v30 in pairs(l_scriptInjectionPermissions_0) do
        table.insert(v28, v23:renderCheckbox(l_Stylizer_0, v29, v30));
    end;
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        contentPadding = UDim.new(0, 20), 
        LayoutOrder = l_LayoutOrder_0, 
        width = UDim.new(1, 0), 
        [v2.Ref] = v23.frameRef, 
        [v2.Change.AbsoluteSize] = v23.resizeFrame
    }, {
        Checkboxes = v2.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            LayoutOrder = 0, 
            width = UDim.new(1, 0)
        }, v28), 
        InfoText = v2.createElement(v9, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            TextSize = 16, 
            Text = l_Localization_0:getText("Details", "ScriptInjectionInfo"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.InfoTextColor
        })
    });
end;
return v3.connect(nil, function(v31)
    return {
        setPluginPermission = function(v32, v33, v34)
            v31(v8(l_PermissionsService_0, v32, v33, v34));
        end
    };
end)((l_withContext_0({
    API = v10, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));
