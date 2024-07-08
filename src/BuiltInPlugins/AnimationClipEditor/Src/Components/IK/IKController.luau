local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v3.UI.Button;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = l_ContextServices_0.Localization;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v9 = require(l_Actions_0.SetIKEnabled);
local v10 = require(l_Actions_0.SetIKMode);
local v11 = require(l_Actions_0.SetSelectedTracks);
local v12 = require(l_Actions_0.SetShowTree);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.IK.IKWindow);
local v15 = require(l_Components_0.IK.R15IKRig);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v17 = require(l_Thunks_0.SetSelectedTracks);
local v18 = require(l_Thunks_0.ToggleIKEnabled);
local v19 = require(l_Thunks_0.TogglePinnedPart);
local v20 = require(l_Thunks_0.ToggleShowTree);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v22 = require(l_Util_0.Constants);
local v23 = require(l_Util_0.RigIK);
local v24 = require(l_Util_0.RigInfo);
local v25 = require(l_Util_0.RigUtils);
local v26 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v27 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRigIK);
local v28 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v29 = v1.PureComponent:extend("IKController");
v29.init = function(v30)
    v30.state = {
        showMenu = false, 
        showTree = false
    };
    v30.showMenu = function()
        v30:setState({
            showMenu = true
        });
    end;
    v30.hideMenu = function()
        v30:setState({
            showMenu = false
        });
    end;
    v30.setShowTree = function(v31)
        v30:setState({
            showTree = v31
        });
    end;
    v30.makeChainHelper = function(v32, v33, v34)
        if not v26() or v33 then
            local v35 = v33[v34.Name];
            if v35 then
                v32[v34.Name] = true;
                v30.makeChainHelper(v32, v33, v35.Part0);
            end;
            return ;
        else
            return ;
        end;
    end;
    v30.makeChainHelperAnimationConstraint = function(v36, v37, v38)
        if v37 then
            local v39 = v37[v38.Name];
            if v39 then
                v36[v38.Name] = true;
                v30.makeChainHelperAnimationConstraint(v36, v37, v39.Attachment0.Parent);
            end;
            return ;
        else
            return ;
        end;
    end;
    v30.getLastSelectedTrack = function()
        if not v30.props.SelectedTracks then
            return ;
        else
            return v30.props.SelectedTracks[#v30.props.SelectedTracks];
        end;
    end;
    v30.toggleIKEnabledHandler = function()
        return v30.props.ToggleIKEnabled(v30.props.Analytics);
    end;
    v30.makeChains = function()
        local v40 = v30.getLastSelectedTrack();
        local v41 = not not v40 and v40[1] or nil;
        local v42 = v24.getRigInfo(v30.props.RootInstance);
        local l_Parts_0 = v42.Parts;
        local l_PartNameToMotor_0 = v42.PartNameToMotor;
        local l_PartNameToAnimConstraint_0 = v42.PartNameToAnimConstraint;
        local v46 = {};
        local l_PinnedParts_0 = v30.props.PinnedParts;
        if v30.props.IKMode == v22.IK_MODE.BodyPart then
            l_PinnedParts_0 = {};
        end;
        for _, v49 in ipairs(l_Parts_0) do
            if not l_PinnedParts_0[v49] then
                v46[v49.Name] = false;
            end;
        end;
        if v41 then
            local v50 = v24.getPartByName(v30.props.RootInstance, v41);
            if v50 then
                if v30.props.IKMode == v22.IK_MODE.BodyPart then
                    l_PinnedParts_0 = if not v27() then v25.pinForLimbMode(v50, l_PartNameToMotor_0, l_PartNameToAnimConstraint_0) else v23.pinForLimbMode(v50, l_PartNameToMotor_0, l_PartNameToAnimConstraint_0);
                end;
                if not (v26() and not l_PartNameToMotor_0[v41]) then
                    v30.makeChainHelper(v46, l_PartNameToMotor_0, l_PartNameToMotor_0[v41].Part1);
                end;
                if not (not v26() or not l_PartNameToAnimConstraint_0[v41]) then
                    v30.makeChainHelperAnimationConstraint(v46, l_PartNameToAnimConstraint_0, l_PartNameToAnimConstraint_0[v41].Attachment1.Parent);
                end;
                for v51, v52 in pairs(l_PinnedParts_0) do
                    if not (not (v51.Name ~= v41) or not v52) then
                        v30.makeChainHelper(v46, l_PartNameToMotor_0, v51);
                        if v26() then
                            v30.makeChainHelperAnimationConstraint(v46, l_PartNameToAnimConstraint_0, v51);
                        end;
                    end;
                end;
            end;
        end;
        return v46;
    end;
end;
v29.didUpdate = function(v53)
    local l_props_0 = v53.props;
    if l_props_0.ShowTree ~= v53.state.showTree then
        if l_props_0.ShowTree ~= nil then
            spawn(function()
                v53.setShowTree(l_props_0.ShowTree);
            end);
            return ;
        else
            v53.setShowTree(l_props_0.ShowTree);
        end;
    end;
end;
v29.render = function(v55)
    local l_Localization_1 = v55.props.Localization;
    local l_props_1 = v55.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v59 = v55.getLastSelectedTrack();
    local l_state_0 = v55.state;
    local l_ToggleShowTree_0 = l_props_1.ToggleShowTree;
    local v62 = nil;
    local v63 = nil;
    if not v27() then
        local v64, v65 = v25.canUseIK(l_props_1.RootInstance);
        v62 = v64;
        v63 = v65;
    else
        local v66, v67 = v23.canUseIK(l_props_1.RootInstance);
        v62 = v66;
        v63 = v67;
    end;
    return v55.props.RootInstance and v1.createElement("Frame", {
        Position = l_props_1.Position, 
        Size = UDim2.new(0, 40, 0, 18), 
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5)
    }, {
        IKButton = (l_props_1.RootInstance and v62) and v1.createElement(l_Button_0, {
            Style = not l_state_0.showTree and "ACEHeaderButtonDefault" or "ACEHeaderButtonActive", 
            Size = UDim2.new(1, 0, 1, 0), 
            OnClick = l_ToggleShowTree_0
        }, {
            Label = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = l_Stylizer_0.ikTheme.textSize, 
                Text = l_Localization_1:getText("Title", "IK"), 
                Font = l_Stylizer_0.font, 
                TextColor3 = l_Stylizer_0.ikTheme.textColor
            })
        }), 
        IKWindow = (l_props_1.ShowTree and l_state_0.showTree) and v1.createElement(v14, {
            RootInstance = l_props_1.RootInstance, 
            PinnedParts = l_props_1.PinnedParts, 
            IKEnabled = l_props_1.IKEnabled, 
            ShowTree = l_props_1.ShowTree, 
            SelectedTrack = v59, 
            SetSelectedTracks = l_props_1.SetSelectedTracks, 
            ToggleIKEnabled = v55.toggleIKEnabledHandler, 
            TogglePinnedPart = l_props_1.TogglePinnedPart, 
            SetShowTree = l_props_1.SetShowTree, 
            SetIKEnabled = l_props_1.SetIKEnabled, 
            SetIKMode = l_props_1.SetIKMode, 
            Chain = v55.makeChains(), 
            IKMode = l_props_1.IKMode, 
            IsR15 = v63
        }), 
        R15IKRig = (l_props_1.IKEnabled and v63) and v1.createElement(v15, {
            RootInstance = l_props_1.RootInstance
        })
    });
end;
return v2.connect(function(v68, _)
    return {
        ShowTree = v68.Status.ShowTree, 
        IKMode = v68.Status.IKMode, 
        IKEnabled = v68.Status.IKEnabled, 
        RootInstance = v68.Status.RootInstance, 
        PinnedParts = v68.Status.PinnedParts, 
        SelectedTracks = v68.Status.SelectedTracks
    };
end, function(v70)
    return {
        ToggleShowTree = function()
            v70(v20());
        end, 
        SetIKMode = function(v71)
            v70(v10(v71));
        end, 
        SetIKEnabled = function(v72)
            v70(v9(v72));
        end, 
        ToggleIKEnabled = function(v73)
            v70(v18(v73));
        end, 
        TogglePinnedPart = function(v74)
            v70(v19(v74));
        end, 
        SetShowTree = function(v75)
            v70(v12(v75));
        end, 
        SetSelectedTracks = function(v76)
            if not v28() then
                v70(v11(v76));
                return ;
            else
                v70(v17(v76));
                return ;
            end;
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v29)));
