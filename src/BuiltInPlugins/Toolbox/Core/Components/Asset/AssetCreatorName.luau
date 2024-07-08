local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_Pane_0 = require(l_Packages_0.Framework).UI.Pane;
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.ToolboxUtilities);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_Parent_0.Core.ContextServices.Settings);
local v11 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v14 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v15 = require(l_Parent_0.Core.Components.Asset.VerifiedCreatorBadge);
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v17 = v2.PureComponent:extend("AssetCreatorName");
v17.init = function(v18, v19)
    v18.state = {
        isHovered = false
    };
    v18.textButtonRef = v2.createRef();
    v18.underLineWidth = 0;
    v18.onMouseEnter = function()
        v18:setState({
            isHovered = true
        });
        v19.Modal.onTooltipTriggered(v19.assetId, v6.TOOLTIP_TYPE.CREATOR_NAME);
    end;
    v18.onMouseLeave = function()
        v18:setState({
            isHovered = false
        });
    end;
    v18.onActivated = function()
        local l_props_0 = v18.props;
        local l_networkInterface_0 = l_props_0.Network.networkInterface;
        if l_props_0.clickable then
            local v22 = nil;
            v22 = {
                Creator = if not v16() then l_props_0.creatorName else nil, 
                AudioSearch = l_props_0.audioSearchInfo, 
                AdditionalAudioSearchInfo = l_props_0.additionalAudioSearchInfo
            };
            local v23 = v18.props.Settings:get("Plugin");
            if not v16() then
                l_props_0.searchWithOptions(l_networkInterface_0, v23, v22);
            else
                l_props_0.onClick(l_props_0.creator, v22);
                return ;
            end;
        end;
    end;
end;
v17.didMount = function(v24)
    local l_current_0 = v24.textButtonRef.current;
    if l_current_0 then
        v24.underLineWidth = l_current_0.TextBounds.X;
    end;
end;
v17.render = function(v26)
    local l_props_1 = v26.props;
    local v28 = not l_props_1.isVerifiedCreator and not v7.getShouldHideVerifiedCreatorBadges();
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v30 = l_props_1.LayoutOrder or 0;
    local l_creatorName_0 = l_props_1.creatorName;
    local l_assetId_0 = l_props_1.assetId;
    local l_creatorName_1 = l_props_1.creatorName;
    local v34 = v26.props.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v6.TOOLTIP_TYPE.CREATOR_NAME);
    local l_creatorName_2 = l_Stylizer_0.asset.creatorName;
    local l_isHovered_0 = v26.state.isHovered;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v30, 
        Size = UDim2.new(1, 0, 0, v6.ASSET_CREATOR_NAME_HEIGHT)
    }, {
        Text = v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            LayoutOrder = 1, 
            Font = v6.FONT, 
            Size = UDim2.new(0, 60, 1, 0), 
            TextSize = v6.ASSET_CREATOR_NAME_FONT_SIZE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Text = l_creatorName_0, 
            TextColor3 = l_creatorName_2.textColor, 
            [v2.Event.MouseEnter] = v26.onMouseEnter, 
            [v2.Event.MouseLeave] = v26.onMouseLeave, 
            [v2.Event.Activated] = v26.onActivated, 
            [v2.Ref] = v26.textButtonRef
        }, {
            TooltipWrapper = l_isHovered_0 and v2.createElement(v14, {
                Text = l_creatorName_1, 
                canShowCurrentTooltip = v34, 
                isHovered = l_isHovered_0
            }), 
            UnderLine = (l_isHovered_0 and (not (l_props_1.clickable ~= nil) or l_props_1.clickable)) and v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 1, 1), 
                Size = UDim2.new(0, v26.underLineWidth, 0, 1), 
                BorderSizePixel = 0
            })
        }), 
        CreatorBadge = v28 and v2.createElement(v15, {
            LayoutOrder = 2
        })
    });
end;
return v3.connect(function(v37, _)
    local v39 = (v37 or {}).pageInfo or {};
    return {
        audioSearchInfo = v39.audioSearchInfo, 
        additionalAudioSearchInfo = v39.additionalAudioSearchInfo
    };
end, function(v40)
    return {
        searchWithOptions = not v16() and function(v41, v42, v43)
            v40(v13(v41, v42, v43));
        end or nil
    };
end)((l_withContext_0({
    Settings = v10, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v11, 
    Network = v12
})(v17)));
