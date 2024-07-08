local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = game:DefineFastFlag("StudioTourCarSpeed", false);
local l_LabelRibbonControlGroups_0 = game:GetFastFlag("LabelRibbonControlGroups");
local v3 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseExtensibilityApi)();
local v4 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseLuaRibbon)();
local l_Workspace_0 = game:GetService("Workspace");
local v6 = Vector3.new(362.373, 4.115, 247.495);
local v7 = {
    assetIds = {
        14215126016
    }, 
    positionOverride = v6, 
    scriptWarningOverride = true
};
local v8 = Vector3.new(360, 1.5, 216);
local v9 = Vector3.new(364, 3.6, 216);
local v10 = Vector3.new(343, 1.5, 250);
local function v17(_)
    local l_Car_0 = l_Workspace_0:FindFirstChild("Car");
    if not l_Car_0 then
        local l_InsertService_0 = game:GetService("InsertService");
        local l_status_0, l_result_0 = pcall(function()
            return l_InsertService_0:LoadAsset(14215126016);
        end);
        if not l_status_0 or not l_result_0 then
            return nil;
        else
            local l_Car_1 = l_result_0:FindFirstChild("Car");
            l_Car_1.PrimaryPart.Position = v6;
            l_Car_1.Parent = l_Workspace_0;
            return l_Car_1;
        end;
    else
        return l_Car_0;
    end;
end;
local function v21(v18)
    local l_Part_0 = l_Workspace_0:FindFirstChild("Part");
    if l_Part_0 and l_Part_0.Shape == Enum.PartType.Wedge then
        v18.instances.wedge = l_Part_0;
        return l_Part_0;
    else
        local l_Part_1 = Instance.new("Part");
        l_Part_1.Shape = Enum.PartType.Wedge;
        l_Part_1.Position = v8;
        l_Part_1.Parent = l_Workspace_0;
        v18.instances.wedge = l_Part_1;
        return l_Part_1;
    end;
end;
return {
    id = "StudioTour2", 
    onStart = function(v22)
        v22.instances.camera = l_Workspace_0.CurrentCamera;
        for _, v24 in l_Workspace_0:GetDescendants() do
            if v24:IsA("BasePart") then
                v24.Locked = true;
            end;
        end;
    end, 
    onComplete = function(_)
        for _, v27 in l_Workspace_0:GetDescendants() do
            if v27:IsA("BasePart") then
                v27.Locked = false;
            end;
        end;
    end, 
    steps = {
        {
            id = "moveCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.W, 
                Enum.KeyCode.A, 
                Enum.KeyCode.S, 
                Enum.KeyCode.D
            }, 
            topic = "navigation", 
            widgets = ""
        }, 
        {
            id = "panCamera", 
            kind = "Input", 
            keys = {
                Enum.KeyCode.E, 
                Enum.KeyCode.Q
            }, 
            topic = "navigation"
        }, 
        {
            id = "zoomCamera", 
            kind = "Input", 
            inputs = {
                Enum.UserInputType.MouseWheel
            }, 
            topic = "navigation"
        }, 
        {
            id = "rotateCamera", 
            kind = "Rotate", 
            topic = "navigation", 
            instanceId = "camera"
        }, 
        {
            id = "marketplace", 
            topic = "marketplace", 
            widgets = "Toolbox", 
            showNext = true, 
            spotlight = {
                target = "edit_builtin_Toolbox.rbxm_Toolbox", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            }, 
            toolboxLimits = v7
        }, 
        {
            id = "searchMarketplace", 
            kind = "ToolboxSearch", 
            search = "car", 
            toolboxLimits = v7, 
            topic = "marketplace", 
            widgets = "Toolbox"
        }, 
        {
            id = "insertMarketplace", 
            kind = "ToolboxInsert", 
            toolboxLimits = v7, 
            topic = "marketplace", 
            onSkip = function(v28)
                v17(v28);
            end, 
            widgets = "Toolbox"
        }, 
        {
            id = "wedge", 
            kind = "Insert", 
            topic = "parts", 
            callout = if not v4 then {
                target = not l_LabelRibbonControlGroups_0 and "Insert" or "placePartActionRibbonControl", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(5, -20) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Part"
                }, 
                Offset = Vector2.new(5, 20)
            }, 
            spotlight = if not v4 then {
                target = not l_LabelRibbonControlGroups_0 and "Insert" or "placePartActionRibbonControl", 
                showHighlight = true
            } else nil, 
            instanceId = "wedge", 
            className = "Part", 
            properties = {
                Shape = Enum.PartType.Wedge
            }, 
            onBind = function()
                game:GetService("TutorialService"):SetTutorialCompletionStatus(true);
            end, 
            onSkip = function(v29)
                local v30 = v21(v29);
                if v30 then
                    v30.Position = v10;
                end;
            end, 
            onUnbind = function(v31)
                local v32 = v21(v31);
                task.delay(0.1, function()
                    v32.Position = v10;
                end);
            end, 
            hideWidgets = "Toolbox", 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "move", 
            kind = "Move", 
            topic = "parts", 
            callout = if not v4 then {
                target = "advTranslateAction", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(0, -5) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Move"
                }, 
                Offset = Vector2.new(0, 20)
            }, 
            spotlight = if not v4 then {
                target = "advTranslateAction", 
                showHighlight = true
            } else nil, 
            position = Vector3.new(360, 1, 200), 
            distance = 20, 
            instanceId = "wedge", 
            onSkip = function(v33)
                local v34 = v21(v33);
                if v34 then
                    v34.Position = v8;
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "rotate", 
            kind = "Rotate", 
            topic = "parts", 
            callout = if not v4 then {
                target = "advRotateAction", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(0, -5) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Rotate"
                }, 
                Offset = Vector2.new(0, 20)
            }, 
            spotlight = if not v4 then {
                target = "advRotateAction", 
                showHighlight = true
            } else nil, 
            rotation = Vector3.new(180, 0, 180), 
            distance = 30, 
            instanceId = "wedge", 
            onSkip = function(v35)
                local v36 = v21(v35);
                if v36 then
                    v36.Rotation = Vector3.new(180, 0, 180);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "scale", 
            kind = "Scale", 
            topic = "parts", 
            callout = if not v4 then {
                target = "resizeAction", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(0, -5) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Scale"
                }, 
                Offset = Vector2.new(0, 20)
            }, 
            spotlight = if not v4 then {
                target = "resizeAction", 
                showHighlight = true
            } else nil, 
            minSize = Vector3.new(5, 3, 5), 
            instanceId = "wedge", 
            onSkip = function(v37)
                local v38 = v21(v37);
                if v38 then
                    v38.Position = v9;
                    v38.Size = Vector3.new(15, 5, 15);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "color", 
            kind = "Edit", 
            topic = "properties", 
            callout = if not v4 then {
                target = "actionColorSelector", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(0, -5) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Color"
                }, 
                Offset = Vector2.new(5, 20)
            }, 
            spotlight = if not v4 then {
                target = "actionColorSelector", 
                showHighlight = true
            } else nil, 
            className = "Part", 
            changes = {
                Color = true
            }, 
            onSkip = function(v39)
                local v40 = v21(v39);
                if v40 then
                    v40.Color = Color3.fromRGB(129, 246, 136);
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "anchor", 
            kind = "Edit", 
            topic = "properties", 
            callout = if not v4 then {
                target = "anchorAction", 
                offset = if not l_LabelRibbonControlGroups_0 then Vector2.new(0, -5) else Vector2.new(0, 5)
            } else {
                TargetWidgetUri = {
                    DataModel = "Standalone", 
                    PluginType = "Standalone", 
                    PluginId = "Ribbon", 
                    Category = "Widgets", 
                    ItemId = "Tabs/Home/Anchor"
                }, 
                Offset = Vector2.new(0, -5)
            }, 
            spotlight = if not v3 then {
                target = "anchorAction", 
                showHighlight = true
            } else nil, 
            className = "Part", 
            changes = {
                Anchored = true
            }, 
            onSkip = function(v41)
                local v42 = v21(v41);
                if v42 then
                    v42.Anchored = true;
                end;
            end, 
            widgets = "Ribbon-Home"
        }, 
        {
            id = "explorer", 
            callout = if not v3 then {
                target = "explorerWidgetPanel", 
                sourceAnchorPoint = Vector2.new(1, 0), 
                targetAnchorPoint = Vector2.new(0, 0), 
                offset = Vector2.new(-10, 20), 
                hideArrow = true
            } else {
                TargetWidgetUri = {
                    PluginId = "Explorer", 
                    Category = "Widgets", 
                    ItemId = "Main"
                }, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            spotlight = if not v3 then {
                target = "explorerWidgetPanel", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            } else nil, 
            topic = "explorer", 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "workspace", 
            path = "Workspace", 
            topic = "explorer", 
            callout = if not v3 then {
                target = "explorerWidgetPanel", 
                rowName = "Workspace", 
                sourceAnchorPoint = Vector2.new(1, 0), 
                targetAnchorPoint = Vector2.new(0, 0), 
                offset = Vector2.new(-10, 20), 
                hideArrow = true
            } else {
                TargetWidgetUri = {
                    PluginId = "Explorer", 
                    Category = "Widgets", 
                    ItemId = "Main"
                }, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 20)
            }, 
            spotlight = if not v3 then {
                target = "explorerWidgetPanel", 
                rowName = "Workspace", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            } else nil, 
            showNext = true, 
            onBind = function(v43)
                local l_dataModel_0 = v43.dataModel;
                l_dataModel_0:GetService("Selection"):Set({
                    l_dataModel_0:GetService("Workspace")
                });
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "select", 
            kind = "Select", 
            path = "Car", 
            topic = "selection", 
            callout = if not v3 then {
                target = "explorerWidgetPanel", 
                sourceAnchorPoint = Vector2.new(1, 0), 
                targetAnchorPoint = Vector2.new(0, 0), 
                offset = Vector2.new(-10, 0), 
                hideArrow = true
            } else {
                TargetWidgetUri = {
                    PluginId = "Explorer", 
                    Category = "Widgets", 
                    ItemId = "Main"
                }, 
                SubjectAnchorPoint = Vector2.new(1, 0), 
                TargetAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(-10, 0)
            }, 
            onSkip = function(v45)
                local v46 = v17(v45);
                if v46 then
                    game:GetService("Selection"):Set({
                        v46
                    });
                end;
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "focus", 
            topic = "selection", 
            kind = "Focus", 
            onSkip = function(v47)
                local v48 = v17(v47);
                if v48 then
                    game:GetService("Selection"):Set({
                        v48
                    });
                end;
            end, 
            widgets = "Ribbon-Home,Explorer"
        }, 
        {
            id = "properties", 
            topic = "attributes", 
            callout = if not v3 then {
                target = "propertiesWidgetPanel", 
                sourceAnchorPoint = Vector2.new(1, 1), 
                targetAnchorPoint = Vector2.new(0, 1), 
                offset = Vector2.new(-10, 0), 
                hideArrow = true
            } else {
                TargetWidgetUri = {
                    PluginId = "Properties", 
                    Category = "Widgets", 
                    ItemId = "Main"
                }, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            spotlight = if not v3 then {
                target = "propertiesWidgetPanel", 
                showBox = true, 
                showHighlight = true, 
                showShadows = true
            } else nil, 
            showNext = true, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "maxSpeed", 
            topic = "attributes", 
            kind = "Edit", 
            callout = if not v3 then {
                target = "propertiesWidgetPanel", 
                sourceAnchorPoint = Vector2.new(1, 1), 
                targetAnchorPoint = Vector2.new(0, 1), 
                offset = Vector2.new(-10, 0), 
                hideArrow = true
            } else {
                TargetWidgetUri = {
                    PluginId = "Properties", 
                    Category = "Widgets", 
                    ItemId = "Main"
                }, 
                SubjectAnchorPoint = Vector2.new(1, 1), 
                TargetAnchorPoint = Vector2.new(0, 1), 
                Offset = Vector2.new(-10, 0)
            }, 
            className = "Model", 
            changes = {
                Attributes = {
                    MaxSpeed = true
                }
            }, 
            onSkip = function(v49)
                local v50 = v17(v49);
                if v50 then
                    v50:SetAttribute("MaxSpeed", not v1 and 250 or 60);
                end;
            end, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "playtest", 
            topic = "playtest", 
            kind = "StartPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties", 
            spotlight = if not v3 then if l_LabelRibbonControlGroups_0 then {
                target = "playGameActionGroupRibbonControl", 
                showHighlight = true
            } else nil else nil
        }, 
        {
            id = "avatar", 
            topic = "playtest", 
            kind = "Avatar", 
            state = Enum.HumanoidStateType.Seated, 
            widgets = "Ribbon-Home,Explorer,Properties"
        }, 
        {
            id = "stopPlaytest", 
            topic = "playtest", 
            kind = "StopPlaytest", 
            widgets = "Ribbon-Home,Explorer,Properties"
        }
    }
};
