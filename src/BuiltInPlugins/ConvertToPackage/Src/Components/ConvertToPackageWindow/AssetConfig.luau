local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local l_ConvertToPackageWindow_0 = l_Components_0.ConvertToPackageWindow;
local v8 = require(l_ConvertToPackageWindow_0.PreviewArea);
local v9 = require(l_ConvertToPackageWindow_0.PublishAsset);
local v10 = require(l_ConvertToPackageWindow_0.AssetConfigFooter);
local v11 = require(l_Components_0.MessageBox.MessageBox);
local v12 = require(l_Parent_0.Src.Actions.SetAssetName);
local v13 = require(l_Parent_0.Src.Util.Constants);
local v14 = require(l_Parent_0.Src.Util.getUserId);
local v15 = require(l_Parent_0.Src.Thunks.MakeChangeRequest);
local v16 = require(l_Parent_0.Src.Thunks.UploadConvertToPackageRequest);
local v17 = v2.PureComponent:extend("AssetConfig");
v17.init = function(v18, _)
    local _ = nil;
    v18.state = {
        assetId = nil, 
        name = nil, 
        description = nil, 
        owner = if game.CreatorId == 0 then {
            creatorId = v14()
        } else {
            creatorId = game.CreatorId
        }, 
        genres = {
            "All"
        }, 
        allowCopy = false, 
        copyOn = false, 
        allowComment = true, 
        commentOn = nil, 
        status = nil, 
        isShowChangeDiscardMessageBox = false, 
        groupId = game.CreatorType == Enum.CreatorType.Group and game.CreatorId or nil
    };
    v18.tryPublish = function()
        local l_props_0 = v18.props;
        local l_state_0 = v18.state;
        l_props_0.sendConvertToPackageItem(0, l_state_0.name or l_props_0.assetName, l_state_0.description, Enum.Genre[(l_state_0.genres or {})[1]].Value + 1, l_state_0.copyOn, l_state_0.commentOn, l_state_0.groupId, l_props_0.instances, l_props_0.clonedInstances);
    end;
    v18.tryCancel = function(v23)
        if not (next(v18.props.changeTable or {}) ~= nil) then
            v18.props.onClose();
            return ;
        else
            local function v24()
                v18:setState({
                    isShowChangeDiscardMessageBox = true
                });
            end;
            if not v23 then
                spawn(v24);
                return ;
            else
                v18:setState({
                    isShowChangeDiscardMessageBox = true
                });
                return ;
            end;
        end;
    end;
    v18.tryCancelNoYield = function()
        v18.tryCancel(false);
    end;
    v18.tryCancelWithYield = function()
        v18.tryCancel(true);
    end;
    v18.onMessageBoxClosed = function()
        v18:setState({
            isShowChangeDiscardMessageBox = false
        });
    end;
    v18.closeAssetConfig = function()
        v18.props.pluginGui.Enabled = false;
    end;
    local function _(v25, v26)
        return not not v18.props.assetConfigData and v18.props.assetConfigData[v25] or v26;
    end;
    v18.onNameChange = function(v28)
        v18.props.makeChangeRequest("AssetConfigName", not not v18.props.assetConfigData and v18.props.assetConfigData.Name or "", v28);
        v18:setState({
            name = v28
        });
    end;
    v18.onDescChange = function(v29)
        v18.props.makeChangeRequest("AssetConfigDesc", not not v18.props.assetConfigData and v18.props.assetConfigData.Description or "", v29);
        v18:setState({
            description = v29
        });
    end;
    v18.onAccessChange = function(v30)
        local v31 = nil;
        if v30.creatorType == "Group" then
            v31 = v30.creatorId;
        end;
        v18:setState({
            owner = {
                creatorId = v30.creatorId
            }, 
            groupId = v31 or ""
        });
    end;
    v18.toggleComment = function(v32)
        v18:setState({
            commentOn = v32
        });
        v18.props.makeChangeRequest("AssetConfigComment", v18.props.assetConfigData.EnableComments or false, v32);
    end;
end;
v17.attachXButtonCallback = function(v33)
    if v33.props.pluginGui then
        v33.props.pluginGui:BindToClose(v33.tryCancelNoYield);
    end;
end;
v17.detachXButtonCallback = function(v34)
    if v34.props.pluginGui then
        v34.props.pluginGui:BindToClose(nil);
    end;
end;
v17.didUpdate = function(v35, _, _)
    v35:attachXButtonCallback();
end;
v17.didMount = function(v38)
    v38:attachXButtonCallback();
end;
v17.willUnmount = function(v39)
    v39:detachXButtonCallback();
end;
local function _(v40, v41)
    local v42 = false;
    if #v40 <= v13.NAME_CHARACTER_LIMIT then
        v42 = tostring(v40) ~= "";
    end;
    return v42 and #v41 <= v13.DESCRIPTION_CHARACTER_LIMIT;
end;
local function v47(v44, v45, v46)
    return {
        Name = "AssetConfigMessageBox", 
        TextSize = v13.FONT_SIZE_MEDIUM, 
        Font = v13.FONT, 
        onClose = v45, 
        Title = v44:getText("Action", "Discard"), 
        Text = v44:getText("General", "DiscardMessage"), 
        buttons = {
            {
                Text = v44:getText("Action", "Cancel"), 
                Font = v13.FONT, 
                TextSize = v13.FONT_SIZE_MEDIUM, 
                action = "no", 
                OnClick = v45
            }, 
            {
                Text = v44:getText("Action", "Discard"), 
                Font = v13.FONT, 
                TextSize = v13.FONT_SIZE_MEDIUM, 
                OnClick = v46
            }
        }
    };
end;
v17.render = function(v48)
    local l_props_1 = v48.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_1 = v48.state;
    local l_Size_0 = l_props_1.Size;
    local l_assetId_0 = l_props_1.assetId;
    local v55 = (l_state_1.name or l_props_1.assetName) or "";
    local v56 = l_state_1.description or "";
    local l_owner_0 = l_state_1.owner;
    local l_allowComment_0 = l_state_1.allowComment;
    local l_commentOn_0 = l_state_1.commentOn;
    local l_isShowChangeDiscardMessageBox_0 = l_state_1.isShowChangeDiscardMessageBox;
    local l_createElement_0 = v2.createElement;
    local v62 = "Frame";
    local v63 = {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.backgroundColor, 
        BorderSizePixel = 0
    };
    local v64 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        AssetConfigMessageBox = l_isShowChangeDiscardMessageBox_0 and v2.createElement(v11, (v47(l_Localization_0, v48.onMessageBoxClosed, v48.closeAssetConfig))), 
        MainPage = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -65), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            Preview = v2.createElement(v8, {
                TotalWidth = 240, 
                LayoutOrder = 1
            }), 
            VerticalLine = v2.createElement("Frame", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Stylizer_0.divider.verticalLineColor, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            PublishAsset = v2.createElement(v9, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetId = l_assetId_0, 
                name = v55, 
                description = v56, 
                owner = l_owner_0, 
                allowComment = l_allowComment_0, 
                commentOn = l_commentOn_0, 
                onNameChange = v48.onNameChange, 
                onDescChange = v48.onDescChange, 
                onOwnerSelected = v48.onAccessChange, 
                toggleComment = v48.toggleComment, 
                LayoutOrder = 3
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_v10_0 = v10;
    local v67 = {
        Size = UDim2.new(1, 0, 0, 65)
    };
    local v68 = false;
    if #v55 <= v13.NAME_CHARACTER_LIMIT then
        v68 = tostring(v55) ~= "";
    end;
    v67.CanSave = v68 and #v56 <= v13.DESCRIPTION_CHARACTER_LIMIT;
    v67.tryCancel = v48.tryCancelWithYield;
    v67.tryPublish = v48.tryPublish;
    v67.LayoutOrder = 2;
    v64.Footer = l_createElement_1(l_v10_0, v67);
    return l_createElement_0(v62, v63, v64);
end;
return v3.connect(function(v69, _)
    v69 = v69 or {};
    return {
        assetConfigData = v69.AssetConfigReducer.assetConfigData or {}, 
        currentScreen = v69.AssetConfigReducer.currentScreen, 
        changeTable = v69.AssetConfigReducer.changed, 
        networkError = v69.NetworkReducer.networkError, 
        networkErrorAction = v69.NetworkReducer.networkErrorAction, 
        instances = v69.AssetConfigReducer.instances, 
        clonedInstances = v69.AssetConfigReducer.clonedInstances
    };
end, function(v71)
    return {
        makeChangeRequest = function(v72, v73, v74)
            v71(v15(v72, v73, v74));
        end, 
        sendConvertToPackageItem = function(v75, v76, v77, v78, v79, v80, v81, v82, v83)
            v71(v12(v76));
            v71(v16(v75, v76, v77, v78, v79, v80, v81, v82, v83));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v17)));
