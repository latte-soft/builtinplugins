local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.RoactRodux);
local v4 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v8 = require(l_Parent_1.Src.Actions.AddChange);
local v9 = require(l_Parent_0.Util.formatNumberForDisplay);
local v10 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v11 = require(l_Parent_0.Components.PresetsBar);
local v12 = require(l_Parent_0.Components.JumpSelect);
local v13 = require(l_Parent_0.Components.NumberInputRow);
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Separator_0 = l_UI_0.Separator;
local l_Name_0 = script.Name;
local function v29(v19, v20)
    local l_game_0 = v19:getState().Metadata.game;
    local l_worldRootPhysicsController_0 = v20.worldRootPhysicsController;
    return {
        function(v23)
            v23.workspaceGravity = l_worldRootPhysicsController_0:getGravity(l_game_0);
        end, 
        function(v24)
            v24.workspaceUseJumpPower = l_worldRootPhysicsController_0:getUseJumpPower(l_game_0);
        end, 
        function(v25)
            v25.workspaceJumpPower = l_worldRootPhysicsController_0:getJumpPower(l_game_0);
        end, 
        function(v26)
            v26.workspaceJumpHeight = l_worldRootPhysicsController_0:getJumpHeight(l_game_0);
        end, 
        function(v27)
            v27.workspaceWalkSpeed = l_worldRootPhysicsController_0:getWalkspeed(l_game_0);
        end, 
        function(v28)
            v28.workspaceMaxSlopeAngle = l_worldRootPhysicsController_0:getMaxSlopeAngle(l_game_0);
        end
    };
end;
local function v41(v30, v31)
    local v32 = v30:getState();
    local l_game_1 = v32.Metadata.game;
    local l_worldRootPhysicsController_1 = v31.worldRootPhysicsController;
    return {
        function()
            local l_workspaceUseJumpPower_0 = v32.Settings.Changed.workspaceUseJumpPower;
            if l_workspaceUseJumpPower_0 ~= nil then
                l_worldRootPhysicsController_1:setUseJumpPower(l_game_1, l_workspaceUseJumpPower_0);
            end;
            if not l_worldRootPhysicsController_1:getUseJumpPower(l_game_1) then
                local l_workspaceJumpHeight_0 = v32.Settings.Changed.workspaceJumpHeight;
                if l_workspaceJumpHeight_0 ~= nil then
                    l_worldRootPhysicsController_1:setJumpHeight(l_game_1, l_workspaceJumpHeight_0);
                end;
            else
                local l_workspaceJumpPower_0 = v32.Settings.Changed.workspaceJumpPower;
                if l_workspaceJumpPower_0 ~= nil then
                    l_worldRootPhysicsController_1:setJumpPower(l_game_1, l_workspaceJumpPower_0);
                    return ;
                end;
            end;
        end, 
        function()
            local l_workspaceGravity_0 = v32.Settings.Changed.workspaceGravity;
            if l_workspaceGravity_0 ~= nil then
                l_worldRootPhysicsController_1:setGravity(l_game_1, l_workspaceGravity_0);
            end;
        end, 
        function()
            local l_workspaceWalkSpeed_0 = v32.Settings.Changed.workspaceWalkSpeed;
            if l_workspaceWalkSpeed_0 ~= nil then
                l_worldRootPhysicsController_1:setWalkspeed(l_game_1, l_workspaceWalkSpeed_0);
            end;
        end, 
        function()
            local l_workspaceMaxSlopeAngle_0 = v32.Settings.Changed.workspaceMaxSlopeAngle;
            if l_workspaceMaxSlopeAngle_0 ~= nil then
                l_worldRootPhysicsController_1:setMaxSlopeAngle(l_game_1, l_workspaceMaxSlopeAngle_0);
            end;
        end
    };
end;
local function v44(v42, _)
    return {
        WorkspaceUseJumpPower = v42("workspaceUseJumpPower"), 
        WorkspaceJumpPower = v42("workspaceJumpPower"), 
        WorkspaceJumpHeight = v42("workspaceJumpHeight"), 
        WorkspaceGravity = v42("workspaceGravity"), 
        WorkspaceWalkSpeed = v42("workspaceWalkSpeed"), 
        WorkspaceMaxSlopeAngle = v42("workspaceMaxSlopeAngle")
    };
end;
local function v46(v45)
    return {
        WorkspaceUseJumpPowerChanged = v45("workspaceUseJumpPower"), 
        WorkspaceJumpPowerChanged = v45("workspaceJumpPower"), 
        WorkspaceJumpHeightChanged = v45("workspaceJumpHeight"), 
        WorkspaceGravityChanged = v45("workspaceGravity"), 
        WorkspaceWalkSpeedChanged = v45("workspaceWalkSpeed"), 
        WorkspaceMaxSlopeAngleChanged = v45("workspaceMaxSlopeAngle")
    };
end;
local v47 = v2.PureComponent:extend("World");
v47.render = function(v48)
    return v2.createElement(v10, {
        SettingsLoadJobs = v29, 
        SettingsSaveJobs = v41, 
        Title = v48.props.Localization:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = function()
            local l_props_0 = v48.props;
            local l_Localization_0 = l_props_0.Localization;
            local v51 = l_props_0.WorldRootPhysics:get();
            local v52 = l_props_0.WorkspaceGravity or 0;
            local l_WorkspaceGravityChanged_0 = l_props_0.WorkspaceGravityChanged;
            local l_WorkspaceUseJumpPower_0 = l_props_0.WorkspaceUseJumpPower;
            local l_WorkspaceUseJumpPowerChanged_0 = l_props_0.WorkspaceUseJumpPowerChanged;
            local v56 = l_props_0.WorkspaceWalkSpeed or 0;
            local l_WorkspaceWalkSpeedChanged_0 = l_props_0.WorkspaceWalkSpeedChanged;
            local v58 = l_props_0.WorkspaceMaxSlopeAngle or 0;
            local l_WorkspaceMaxSlopeAngleChanged_0 = l_props_0.WorkspaceMaxSlopeAngleChanged;
            local v60 = nil;
            local v61 = nil;
            local l_WorkspaceJumpPowerChanged_0 = l_props_0.WorkspaceJumpPowerChanged;
            local l_WorkspaceJumpHeightChanged_0 = l_props_0.WorkspaceJumpHeightChanged;
            if not l_WorkspaceUseJumpPower_0 then
                v60 = l_props_0.WorkspaceJumpHeight or 0;
                v61 = v51.calculateJumpPower(v52, v60);
            else
                v61 = l_props_0.WorkspaceJumpPower or 0;
                v60 = v51.calculateJumpHeight(v52, v61);
            end;
            return {
                Presets = v2.createElement(v11, {
                    LayoutOrder = 1, 
                    ApplyPreset = function(v64)
                        local v65 = v64.Gravity or v52;
                        local v66 = v64.JumpPower or v61;
                        local v67 = v64.Walkspeed or v56;
                        local v68 = v64.MaxSlopeAngle or v58;
                        l_WorkspaceGravityChanged_0(v65);
                        l_WorkspaceUseJumpPowerChanged_0(true);
                        l_WorkspaceJumpPowerChanged_0(v66);
                        l_WorkspaceJumpHeightChanged_0(v51.calculateJumpHeight(v65, v66));
                        l_WorkspaceWalkSpeedChanged_0(v67);
                        l_WorkspaceMaxSlopeAngleChanged_0(v68);
                    end
                }), 
                Separator1 = v2.createElement(l_Separator_0, {
                    LayoutOrder = 2
                }), 
                Gravity = v2.createElement(v13, {
                    LayoutOrder = 3, 
                    Title = l_Localization_0:getText("General", "TitleGravity"), 
                    Label = l_Localization_0:getText("General", "GravityWorkspaceGravity"), 
                    Value = v52, 
                    MinValue = 0, 
                    MaxValue = 1000, 
                    OnUpdate = function(v69)
                        l_WorkspaceGravityChanged_0(v69);
                        if not l_WorkspaceUseJumpPower_0 then
                            l_WorkspaceJumpPowerChanged_0(v51.calculateJumpPower(v69, v60));
                            return ;
                        else
                            l_WorkspaceJumpHeightChanged_0(v51.calculateJumpHeight(v69, v61));
                            return ;
                        end;
                    end, 
                    UnitsFormatFunction = function(v70)
                        return l_Localization_0:getText("General", "UnitsMetersPerSecondSquared1", {
                            v9(v70)
                        });
                    end
                }), 
                Separator2 = v2.createElement(l_Separator_0, {
                    LayoutOrder = 4
                }), 
                JumpSelect = v2.createElement(v12, {
                    LayoutOrder = 5, 
                    UseJumpPower = l_WorkspaceUseJumpPower_0, 
                    JumpPower = v61, 
                    JumpHeight = v60, 
                    SetUseJumpPower = l_WorkspaceUseJumpPowerChanged_0, 
                    SetJumpPower = function(v71)
                        l_WorkspaceJumpPowerChanged_0(v71);
                        l_WorkspaceJumpHeightChanged_0(v51.calculateJumpHeight(v52, v71));
                    end, 
                    SetJumpHeight = function(v72)
                        l_WorkspaceJumpHeightChanged_0(v72);
                        l_WorkspaceJumpPowerChanged_0(v51.calculateJumpPower(v52, v72));
                    end
                }), 
                WalkSpeed = v2.createElement(v13, {
                    LayoutOrder = 6, 
                    Title = l_Localization_0:getText("General", "TitleWalk"), 
                    Label = l_Localization_0:getText("General", "WalkSpeed"), 
                    Value = v56, 
                    MinValue = 0, 
                    MaxValue = math.huge, 
                    OnUpdate = l_WorkspaceWalkSpeedChanged_0, 
                    UnitsFormatFunction = function(v73)
                        return l_Localization_0:getText("General", "UnitsMetersPerSecond1", {
                            v9(v73)
                        });
                    end
                }), 
                JumpDistance = v2.createElement(l_TitledFrame_0, {
                    LayoutOrder = 7, 
                    Title = ""
                }, {
                    JumpDistanceLabel = v2.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 1, 
                        Style = "Normal", 
                        Text = l_Localization_0:getText("General", "JumpDistance")
                    }), 
                    JumpDistanceValue = v2.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 2, 
                        Style = "SubText", 
                        Text = v9(v51.calculateJumpDistance(v52, v61, v56))
                    }), 
                    JumpDistanceMetricValue = v2.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        LayoutOrder = 3, 
                        Style = "SubText", 
                        Text = l_Localization_0:getText("General", "UnitsMeters1", {
                            v9(v51.convertStudsToMeters(v51.calculateJumpDistance(v52, v61, v56)))
                        })
                    })
                }), 
                MaxSlopeAngle = v2.createElement(v13, {
                    LayoutOrder = 8, 
                    Title = l_Localization_0:getText("General", "TitleSlope"), 
                    Label = l_Localization_0:getText("General", "SlopeAngle"), 
                    Value = v58, 
                    MinValue = 0, 
                    MaxValue = 89, 
                    OnUpdate = l_WorkspaceMaxSlopeAngleChanged_0, 
                    UnitsFormatFunction = nil
                })
            };
        end
    });
end;
v47 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    WorldRootPhysics = v7
})(v47);
local v74 = require(l_Parent_1.Src.Networking.settingFromState);
v47 = v3.connect(function(v75, _)
    if v75 then
        return (v44(function(v77)
            return v74(v75.Settings, v77);
        end, v75));
    else
        return ;
    end;
end, function(v78)
    return (v46(function(v79)
        return function(v80)
            v78(v8(v79, v80));
        end;
    end));
end)(v47);
v47.LocalizationId = l_Name_0;
return v47;
