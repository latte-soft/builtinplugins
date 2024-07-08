local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_Components_0 = v3.Components;
local l_ConfirmDialog_0 = l_Components_0.ConfirmDialog;
local l_ConfirmCancelDialog_0 = l_Components_0.ConfirmCancelDialog;
local l_InstanceSelector_0 = l_Components_0.InstanceSelector;
local v11 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v11.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local v15 = require(l_Parent_0.Src.Actions.SetToolMode);
local v16 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local v17 = require(l_Parent_0.Src.Components.SelectFrame);
local v18 = require(l_Parent_0.Src.Util.ShowDialog);
local v19 = require(l_Parent_0.Src.Util.Constants);
local v20 = v1.PureComponent:extend("SelectItemScreen");
v11.Util.Typecheck.wrap(v20, script);
v20.init = function(v21)
    v21.state = {
        selectedPart = nil, 
        invalidSelected = false
    };
    v21.checkForPreviewAvatar = function(v22)
        local l_props_0 = v21.props;
        if l_ItemCharacteristics_0.isClothes(v22) then
            local l_Parent_1 = v22.Parent;
            if l_Parent_1 then
                if l_ItemCharacteristics_0.isAvatar(l_Parent_1) then
                    local v25 = l_Parent_1:Clone();
                    for _, v27 in ipairs(v25:GetChildren()) do
                        if v27.Name == v22.Name then
                            v27:Destroy();
                        end;
                    end;
                    l_props_0.AddUserAddedAssetForPreview(l_PreviewConstants_0.TABS_KEYS.Avatars, v25);
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v21.setSourceItem = function(v28)
        v21.props.EditingItemContext:setSourceItem(v28);
        v21.checkForPreviewAvatar(v28);
        v21.props.SetToolMode(v19.TOOL_MODE.None);
        v21.props.GoToNext();
    end;
    v21.onSelectNewItem = function(v29)
        local l_props_1 = v21.props;
        v18(l_props_1.Plugin, l_props_1.Localization, l_ConfirmCancelDialog_0, {
            Text = v21.props.Localization:getText("Select", "LoseChanges"), 
            OnConfirm = function()
                v21.setSourceItem(v29);
            end
        });
    end;
    v21.onConfirmSelection = function()
        local l_state_0 = v21.state;
        local l_props_2 = v21.props;
        local l_selectedPart_0 = l_state_0.selectedPart;
        if v21.isSelectedInstanceValid(l_selectedPart_0) then
            if l_selectedPart_0 then
                local v34 = l_props_2.EditingItemContext:getSourceItem();
                if not v34 or v34 == l_selectedPart_0 then
                    v21.setSourceItem(l_selectedPart_0);
                    return ;
                else
                    v21.onSelectNewItem(l_selectedPart_0);
                end;
            end;
            return ;
        else
            v21:setState({
                invalidSelected = true, 
                selectedPart = v1.None
            });
            v18(l_props_2.Plugin, l_props_2.Localization, l_ConfirmDialog_0, {
                Text = v21.props.Localization:getText("Select", "Invalid"), 
                OnClose = function()
                end
            });
            return ;
        end;
    end;
    v21.isSelectedInstanceValid = function(v35)
        local v36 = v21.props.EditingItemContext:getItem();
        if l_ItemCharacteristics_0.isPotentialLayeredClothingItem(v35) then
            if not l_ItemCharacteristics_0.hasInvalidCage(v35) then
                local v37 = l_ItemCharacteristics_0.isAvatar(v35);
                local v38 = v35:IsA("MeshPart") and v35:FindFirstChildWhichIsA("WrapTarget");
                if not v37 and not v38 then
                    return not ((((v35:FindFirstAncestor("LayeredClothingEditorPreview") ~= nil or v35 == v36) or v36 and v35 == v36.Parent) or (v35 and v36) and v35.Parent == v36.Parent) or v36 and v35:FindFirstAncestor(v36.Name));
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end;
    v21.onSelectValidInstance = function(v39)
        v21:setState({
            selectedPart = l_ItemCharacteristics_0.getHandle(v39), 
            invalidSelected = false
        });
        if v21.ancestryChangedHandle then
            v21.ancestryChangedHandle:Disconnect();
        end;
        v21.ancestryChangedHandle = v39.AncestryChanged:Connect(function()
            v21:setState({
                selectedPart = v1.None, 
                invalidSelected = false
            });
            v21.ancestryChangedHandle:Disconnect();
            v21.ancestryChangedHandle = nil;
        end);
    end;
    v21.onInvalidSelectionInstance = function()
        v21:setState({
            invalidSelected = true, 
            selectedPart = v1.None
        });
    end;
end;
v20.didMount = function(v40)
    local v41 = v40.props.EditingItemContext:getSourceItem();
    if v41 then
        v40:setState({
            selectedPart = v41
        });
    end;
end;
v20.render = function(v42)
    local l_props_3 = v42.props;
    local l_state_1 = v42.state;
    local v45 = not not l_state_1.selectedPart and l_state_1.selectedPart.Name or "";
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_props_3.Stylizer.BackgroundColor, 
        BorderSizePixel = 0
    }, {
        SelectFrame = v1.createElement(v17, {
            PartName = not not l_state_1.invalidSelected and l_props_3.Localization:getText("Select", "Invalid") or v45, 
            ButtonEnabled = v45 ~= "", 
            OnConfirmSelection = v42.onConfirmSelection
        }), 
        InstanceSelector = v1.createElement(l_InstanceSelector_0, {
            IsSelectedInstanceValid = v42.isSelectedInstanceValid, 
            OnValidSelection = v42.onSelectValidInstance, 
            OnInvalidSelection = v42.onInvalidSelectionInstance
        })
    });
end;
v20.willUnmount = function(v46)
    if v46.ancestryChangedHandle then
        v46.ancestryChangedHandle:Disconnect();
        v46.ancestryChangedHandle = nil;
    end;
end;
return v2.connect(nil, function(v47)
    return {
        SetToolMode = function(v48)
            v47(v15(v48));
        end, 
        AddUserAddedAssetForPreview = function(v49, v50)
            v47(v16(v49, v50));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v20)));
