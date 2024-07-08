local l_CoreGui_0 = game:GetService("CoreGui");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v6.Util.AccessoryAndBodyToolShared;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local v11 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v12 = require(l_Parent_0.Src.Actions.SetItemSize);
local v13 = require(l_Parent_0.Src.Actions.SetMeshScale);
local v14 = require(l_Parent_0.Src.Thunks.VerifyBounds);
local v15 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v16 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
local v17 = require(l_Parent_0.Src.Actions.SetWorkspacePreviewSelectionEnabled);
local l_EditingItemContext_0 = v6.Contexts.EditingItemContext;
local l_Signals_0 = v6.Contexts.Signals;
local v20 = require(l_Parent_0.Src.Util.Constants);
local v21 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetFFlagAFTSelectHandleOnly_0 = v6.Flags.GetFFlagAFTSelectHandleOnly;
local v25 = v4.PureComponent:extend("MeshPartTool");
v25.getHandleAttachment = function(v26)
    local l_props_0 = v26.props;
    return l_props_0.EditingItemContext:getItem():FindFirstChild(l_props_0.AccessoryTypeInfo.Name);
end;
v25.init = function(v28)
    v28.state = {
        matchingAttachment = nil
    };
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v28.editingItemIsSelected = function()
            local v29 = v28.props.EditingItemContext:getItem();
            for _, v31 in (l_Selection_0:Get()), nil, nil do
                if v31 == v29 then
                    return true;
                end;
            end;
            return false;
        end;
        v28.onUndoRedo = function()
            v28.placeAndScaleItem();
            v28.selectMeshPart();
        end;
        v28.onSelectionChanged = function()
            local l_props_1 = v28.props;
            local v33 = v28.editingItemIsSelected();
            if v33 or not v28.active then
                if not (not v33 or v28.active) then
                    v28:activate();
                    l_ChangeHistoryService_0:ResetWaypoints();
                    l_props_1.SetControlsPanelBlockerActivity(false);
                    l_props_1.SetWorkspacePreviewSelectionEnabled(true);
                end;
                return ;
            else
                v28:deactivate();
                l_ChangeHistoryService_0:ResetWaypoints();
                l_props_1.SetControlsPanelBlockerMessage(l_props_1.Localization:getText("Editor", "ResumeEditingRigid"));
                l_props_1.SetControlsPanelBlockerActivity(true);
                l_props_1.SetWorkspacePreviewSelectionEnabled(false);
                return ;
            end;
        end;
    end;
    v28.selectMeshPart = function()
        local v34 = v28.props.EditingItemContext:getItem();
        if v34 then
            l_Selection_0:Set({
                v34
            });
            return ;
        else
            return ;
        end;
    end;
    v28.adjustItem = function()
        local l_Analytics_0 = v28.props.Analytics;
        if not v21.FirstAction then
            v21.FirstAction = v20.ACTIONS.AdjustAccessory;
            l_Analytics_0:getHandler("FirstAction")(v21.FirstAction);
        end;
        v28.placeAndScaleItem();
    end;
    v28.placeAndScaleItem = function()
        local l_props_2 = v28.props;
        local l_state_0 = v28.state;
        local v38 = l_props_2.EditingItemContext:getItem();
        local l_AccessoryTypeInfo_0 = l_props_2.AccessoryTypeInfo;
        if v38 and l_AccessoryTypeInfo_0 then
            local l_matchingAttachment_0 = l_state_0.matchingAttachment;
            local l_v38_FirstChild_0 = v38:FindFirstChild(l_AccessoryTypeInfo_0.Name);
            if l_v38_FirstChild_0 and l_matchingAttachment_0 then
                local l_WorldCFrame_0 = l_matchingAttachment_0.WorldCFrame;
                l_v38_FirstChild_0.CFrame = (l_WorldCFrame_0:inverse() * v38.CFrame):inverse();
                v28.props.SetAttachmentPoint({
                    ItemCFrame = l_WorldCFrame_0:inverse() * v38.CFrame, 
                    AttachmentCFrame = l_v38_FirstChild_0.CFrame
                });
                if l_ItemCharacteristics_0.isLegacyAccessory(v38) then
                    v28.props.SetMeshScale(l_AccessoryUtil_0:getSpecialMeshScale(v38));
                end;
                v28.props.SetItemSize(v38.Size);
                v28.props.VerifyBounds(v38, v28:getHandleAttachment());
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v28.onEditingItemChanged = function()
        local v43 = v28.props.EditingItemContext:getItem();
        local l_AccessoryTypeInfo_1 = v28.props.AccessoryTypeInfo;
        if not l_GetFFlagAFTSelectHandleOnly_0() then
            if v43 then
                local l_v43_FirstChild_0 = v43:FindFirstChild(l_AccessoryTypeInfo_1.Name);
                local l_Weld_0 = v43:FindFirstChildWhichIsA("Weld");
                if l_v43_FirstChild_0 and l_Weld_0 then
                    local l_Part1_0 = l_Weld_0.Part1;
                    if l_Part1_0 then
                        local l_l_Part1_0_FirstChild_0 = l_Part1_0:FindFirstChild(l_v43_FirstChild_0.Name);
                        if l_l_Part1_0_FirstChild_0 then
                            v28:setState({
                                matchingAttachment = l_l_Part1_0_FirstChild_0
                            });
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            else
                if v28.CFrameChanged then
                    v28.CFrameChanged:Disconnect();
                    v28.CFrameChanged = nil;
                end;
                if v28.SizeChanged then
                    v28.SizeChanged:Disconnect();
                    v28.SizeChanged = nil;
                end;
                return ;
            end;
        else
            if v28.CFrameChanged then
                v28.CFrameChanged:Disconnect();
                v28.CFrameChanged = nil;
            end;
            if v28.SizeChanged then
                v28.SizeChanged:Disconnect();
                v28.SizeChanged = nil;
            end;
            if v43 then
                if v43:FindFirstChild(l_AccessoryTypeInfo_1.Name) then
                    local v49 = l_AccessoryUtil_0:findAvatarAttachmentByName(v43.Parent, l_AccessoryTypeInfo_1.Name);
                    if v49 then
                        v28:setState({
                            matchingAttachment = v49
                        });
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
        v28.CFrameChanged = v43:GetPropertyChangedSignal("CFrame"):Connect(v28.adjustItem);
        v28.SizeChanged = v43:GetPropertyChangedSignal("Size"):Connect(v28.adjustItem);
        l_Selection_0:Set({
            v43
        });
    end;
end;
v25.activate = function(v50)
    v50.active = true;
    v50.onEditingItemChanged();
    v50.OnRedo = l_ChangeHistoryService_0.OnRedo:Connect(v50.onUndoRedo);
    v50.OnUndo = l_ChangeHistoryService_0.OnUndo:Connect(v50.onUndoRedo);
end;
v25.didMount = function(v51)
    local l_props_3 = v51.props;
    v51.EditingItemChanged = l_props_3.EditingItemContext:getEditingItemChangedSignal():Connect(function(_)
        v51.onEditingItemChanged();
    end);
    if not l_GetFFlagAFTSelectHandleOnly_0() then
        v51.onEditingItemChanged();
        v51.OnRedo = l_ChangeHistoryService_0.OnRedo:Connect(v51.placeAndScaleItem);
        v51.OnUndo = l_ChangeHistoryService_0.OnUndo:Connect(v51.placeAndScaleItem);
    else
        v51:activate();
    end;
    v51.OnPluginWindowFocusedHandle = l_props_3.Signals:get(v20.SIGNAL_KEYS.PluginWindowFocused):Connect(v51.selectMeshPart);
    if l_GetFFlagAFTSelectHandleOnly_0() then
        v51.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(v51.onSelectionChanged);
    end;
end;
v25.didUpdate = function(v54, v55, v56)
    if v54.state.matchingAttachment ~= v56.matchingAttachment then
        v54.placeAndScaleItem();
    end;
    if not (not (l_GetFFlagAFTSelectHandleOnly_0() and v54.props.IsControlsPanelBlockerActive ~= v55.IsControlsPanelBlockerActive) or v54.props.IsControlsPanelBlockerActive) then
        v54.selectMeshPart();
    end;
end;
v25.renderLinks = function(_, v58, v59, v60, v61, v62)
    local v63 = {};
    for _, v65 in ipairs(l_Constants_0.CUBE_EDGES) do
        local v66 = (v65[1] * v59 + v61) + v60;
        local v67 = (v65[2] * v59 + v61) + v60;
        table.insert(v63, v4.createElement("LineHandleAdornment", {
            Length = (v66 - v67).Magnitude, 
            CFrame = CFrame.new(Vector3.new(0, 0, 0), (v67 - v66).Unit) + v66, 
            Adornee = v62, 
            Transparency = 0, 
            Color3 = v58.LineColor, 
            Thickness = v58.LineThickness, 
            ZIndex = 1, 
            Archivable = false, 
            AlwaysOnTop = false
        }));
    end;
    return v63;
end;
v25.renderBorderedBox = function(v68, v69, v70, v71, v72)
    local l_props_4 = v68.props;
    local l_Stylizer_0 = l_props_4.Stylizer;
    return v4.createElement("BoxHandleAdornment", {
        Adornee = v72, 
        CFrame = CFrame.new(v71 + v70), 
        Size = v69, 
        Transparency = l_Stylizer_0.Transparency, 
        Color3 = not not l_props_4.InBounds and l_Stylizer_0.InBoundsColor or l_Stylizer_0.OutBoundsColor, 
        Archivable = false
    }, (v68:renderLinks(l_Stylizer_0, v69, v70, v71, v72)));
end;
v25.render = function(v75)
    local l_props_5 = v75.props;
    local l_state_1 = v75.state;
    local l_AccessoryTypeInfo_2 = l_props_5.AccessoryTypeInfo;
    local l_matchingAttachment_1 = l_state_1.matchingAttachment;
    if l_matchingAttachment_1 and l_AccessoryTypeInfo_2 then
        local l_Bounds_0 = l_AccessoryTypeInfo_2.Bounds;
        local l_Offset_0 = l_AccessoryTypeInfo_2.Offset;
        local v82 = v75:getHandleAttachment();
        if v82 then
            local l_Parent_1 = l_matchingAttachment_1.Parent;
            return v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                BoundingBox = v75:renderBorderedBox(l_Bounds_0, l_Offset_0, (v82.WorldCFrame * l_Parent_1.CFrame:inverse()).Position, l_Parent_1)
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v25.deactivate = function(v84)
    v84.active = false;
    if v84.CFrameChanged then
        v84.CFrameChanged:Disconnect();
        v84.CFrameChanged = nil;
    end;
    if v84.SizeChanged then
        v84.SizeChanged:Disconnect();
        v84.SizeChanged = nil;
    end;
    if v84.OnRedo then
        v84.OnRedo:Disconnect();
        v84.OnRedo = nil;
    end;
    if v84.OnUndo then
        v84.OnUndo:Disconnect();
        v84.OnUndo = nil;
    end;
end;
v25.willUnmount = function(v85)
    if v85.EditingItemChanged then
        v85.EditingItemChanged:Disconnect();
        v85.EditingItemChanged = nil;
    end;
    if not l_GetFFlagAFTSelectHandleOnly_0() then
        if v85.CFrameChanged then
            v85.CFrameChanged:Disconnect();
            v85.CFrameChanged = nil;
        end;
        if v85.SizeChanged then
            v85.SizeChanged:Disconnect();
            v85.SizeChanged = nil;
        end;
        if v85.OnRedo then
            v85.OnRedo:Disconnect();
            v85.OnRedo = nil;
        end;
        if v85.OnUndo then
            v85.OnUndo:Disconnect();
            v85.OnUndo = nil;
        end;
    else
        v85:deactivate();
    end;
    if v85.OnPluginWindowFocusedHandle then
        v85.OnPluginWindowFocusedHandle:Disconnect();
        v85.OnPluginWindowFocusedHandle = nil;
    end;
    if not (not l_GetFFlagAFTSelectHandleOnly_0() or not v85.SelectionChangedHandle) then
        v85.SelectionChangedHandle:Disconnect();
        v85.SelectionChangedHandle = nil;
    end;
end;
return v5.connect(function(v86, _)
    local l_selectItem_0 = v86.selectItem;
    return {
        AccessoryTypeInfo = l_selectItem_0.accessoryTypeInfo, 
        InBounds = l_selectItem_0.inBounds, 
        IsControlsPanelBlockerActive = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else v86.controlsPanelBlocker.isActive
    };
end, function(v89)
    return {
        SetControlsPanelBlockerActivity = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else function(v90)
            v89(v15(v90));
        end, 
        SetControlsPanelBlockerMessage = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else function(v91)
            v89(v16(v91));
        end, 
        SetWorkspacePreviewSelectionEnabled = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else function(v92)
            v89(v17(v92));
        end, 
        SetAttachmentPoint = function(v93)
            v89(v11(v93));
        end, 
        SetItemSize = function(v94)
            v89(v12(v94));
        end, 
        SetMeshScale = function(v95)
            v89(v13(v95));
        end, 
        VerifyBounds = function(v96, v97)
            v89(v14(v96, v97));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0, 
    Signals = l_Signals_0
})(v25)));
