local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_TextService_0 = game:GetService("TextService");
local l_PermissionsService_0 = game:GetService("PermissionsService");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local v9 = require(l_Parent_0.Src.Thunks.SetPluginPermission);
local v10 = require(l_Parent_0.Src.Components.FluidFitTextLabel);
local v11 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local l_FitFrameVertical_0 = v5.FitFrameVertical;
local v13 = require(l_Parent_0.Src.Util.Constants);
local l_Checkbox_0 = l_UI_0.Checkbox;
local v15 = require(l_Parent_0.Src.Util.truncateMiddleText);
local v16 = v3.Component:extend("HttpRequestHolder");
v16.defaultProps = {
    httpPermissions = {}
};
v16.init = function(v17)
    v17.frameRef = v3.createRef();
    v17.state = {
        frameWidth = 0
    };
    v17.onCheckboxActivated = function(v18)
        return v17.props.setPluginPermission(v17.props.API:get(), v17.props.assetId, v18);
    end;
    v17.resizeFrame = function()
        local l_current_0 = v17.frameRef.current;
        if l_current_0 then
            if v17.state.frameWidth ~= l_current_0.AbsoluteSize.X then
                v17:setState({
                    frameWidth = l_current_0.AbsoluteSize.X
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v17.getTruncatedText = function(v20, v21)
        local _ = "";
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v20, 16, v21.Font, Vector2.new());
        local v24 = (v17.state.frameWidth - 16) - v13.SCROLLBAR_WIDTH_ADJUSTMENT;
        if v24 > 0 and v24 < l_l_TextService_0_TextSize_0.X then
            return (v15(v20, 16, v21.Font, v24));
        else
            return v20;
        end;
    end;
end;
v16.didMount = function(v25)
    v25.resizeFrame();
end;
v16.renderCheckbox = function(v26, v27, v28, v29)
    return v3.createElement(l_Checkbox_0, {
        Checked = v29.allowed, 
        LayoutOrder = v28, 
        OnClick = function()
            v26.onCheckboxActivated(v29);
        end, 
        Text = v26.getTruncatedText(not not v29.data and v29.data.domain or "", v27)
    });
end;
v16.render = function(v30)
    local l_Localization_0 = v30.props.Localization;
    local l_httpPermissions_0 = v30.props.httpPermissions;
    local l_LayoutOrder_0 = v30.props.LayoutOrder;
    local l_Stylizer_0 = v30.props.Stylizer;
    local v35 = {};
    for v36, v37 in pairs(l_httpPermissions_0) do
        table.insert(v35, v30:renderCheckbox(l_Stylizer_0, v36, v37));
    end;
    return v3.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        contentPadding = UDim.new(0, 20), 
        LayoutOrder = l_LayoutOrder_0, 
        width = UDim.new(1, 0), 
        [v3.Ref] = v30.frameRef, 
        [v3.Change.AbsoluteSize] = v30.resizeFrame
    }, {
        Checkboxes = v3.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            LayoutOrder = 0, 
            width = UDim.new(1, 0)
        }, v35), 
        InfoText = v3.createElement(v10, {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            TextSize = 16, 
            Text = l_Localization_0:getText("Details", "HttpRequestInfo"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.InfoTextColor
        })
    });
end;
return v4.connect(nil, function(v38)
    return {
        setPluginPermission = function(v39, v40, v41)
            v38(v9(l_PermissionsService_0, v39, v40, v41));
        end
    };
end)((l_withContext_0({
    API = v11, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
