local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Promise_0 = v2.Util.Promise;
local l_Pane_0 = v2.UI.Pane;
local l_Button_0 = v2.UI.Button;
local l_game_FastFlag_0 = game:GetFastFlag("TurnOffNPPThrottling", false);
local v12 = v1.PureComponent:extend("PublishFrame");
local _, l_result_0 = pcall(function()
    return game:GetService("PackageUIService");
end);
local l_Selection_0 = game:GetService("Selection");
local l_game_FastInt_0 = game:GetFastInt("PackageUploadThrottleTimeMin", 2);
local l_game_FastInt_1 = game:GetFastInt("PackageUploadThrottleAllowedPackages", 180);
local v18 = {
    PackagePublishSuccess = "Package published {%s, %s}", 
    PackagePublishFailure = "Failed to publish package. Retrying... {%s, %s}", 
    PackagePublishSkipped = "Package skipped due to no changes detected. {%s, %s}", 
    TempContainerName = "NPP_Cloned_Instances", 
    UpToDateString = "Up To Date", 
    NewVersionString = "New Version Available", 
    OperationEnded = "Hierarchical Publish Operation completed", 
    OperationCancelled = "Hierarchal Publish Operation cancelled.", 
    LatestVersionFailure = "There was an issue getting the latest version of a package. Ending process."
};
local v19 = {
    Ready = 0, 
    Pending = 1, 
    Updating = 2, 
    Failed = 3, 
    Success = 4, 
    Skipped = 5
};
local v20 = {
    [v19.Updating] = 0.3, 
    [v19.Pending] = 0.7, 
    [v19.Failed] = 0.7, 
    [v19.Success] = 1, 
    [v19.Skipped] = 1
};
local v21 = {
    [v19.Updating] = Color3.fromRGB(145, 50, 235), 
    [v19.Pending] = Color3.fromRGB(255, 185, 0), 
    [v19.Failed] = Color3.fromRGB(225, 50, 25), 
    [v19.Success] = Color3.fromRGB(25, 225, 40), 
    [v19.Skipped] = Color3.fromRGB(44, 101, 29)
};
local function _(v22)
    if v22 then
        return v22:FindFirstChildOfClass("PackageLink");
    else
        return ;
    end;
end;
local function v25(v24)
    return v24.Name;
end;
local function _(v26)
    return not pcall(v25, v26);
end;
local function v28(v29, v30, v31)
    if pcall(v25, v30) then
        local v32 = if v30 then v30:FindFirstChildOfClass("PackageLink") else nil;
        if v32 then
            local v33 = v31[v32.PackageId];
            if v33 and v33.oldVersionId == v32.VersionNumber then
                table.insert(v29, v30);
                return ;
            end;
        end;
        for _, v35 in v30:GetChildren() do
            v28(v29, v35, v31);
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v36, v37)
    local v38 = {};
    v28(v38, v36, v37);
    return v38;
end;
local function v40(v41, v42, v43)
    if pcall(v25, v42) then
        local v44 = if v42 then v42:FindFirstChildOfClass("PackageLink") else nil;
        if v44 then
            if not v41[v44.PackageId] then
                v41[v44.PackageId] = {
                    instance = v42, 
                    parents = {}
                };
            end;
            if v43 then
                v41[v44.PackageId].parents[v43] = v41[v43];
            end;
            v43 = v44.PackageId;
        end;
        for _, v46 in v42:GetChildren() do
            v40(v41, v46, v43);
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v47)
    local v48 = {};
    v40(v48, v47, nil);
    return v48;
end;
local function v54(v50, v51)
    if if v50 then v50:FindFirstChildOfClass("PackageLink") else nil then
        if typeof(v51) ~= "number" then
            return ;
        else
            local l_status_1, l_result_1 = pcall(function()
                return l_result_0:SetPackageVersion(v50, v51);
            end);
            if l_status_1 and l_result_1 then
                return l_result_1;
            else
                warn(l_result_1);
                return ;
            end;
        end;
    else
        return ;
    end;
end;
local function v55(v56)
    if v56 then
        local l_Parent_1 = v56.Parent;
        if l_Parent_1 then
            if not if l_Parent_1 then l_Parent_1:FindFirstChildOfClass("PackageLink") else nil then
                return v55(l_Parent_1);
            else
                return l_Parent_1;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v60(v58, v59)
    if v58.Depth == v59.Depth then
        return v58.PackageId < v59.PackageId;
    else
        return v58.Depth < v59.Depth;
    end;
end;
local function v78(v61, v62)
    assert(v61);
    assert(v62);
    local v63 = if v61 then v61:FindFirstChildOfClass("PackageLink") else nil;
    assert(v63);
    local v64 = {};
    v40(v64, v62, nil);
    local l_v64_0 = v64;
    v64 = {};
    local v66 = {};
    local function v67(v68, v69, v70)
        local v71 = l_v64_0[v68];
        if not v70[v71] then
            v70[v71] = true;
            for v72, _ in pairs(v71.parents) do
                v67(v72, v69 + 1, table.clone(v70));
            end;
            if not v64[v68] then
                local l_status_2, l_result_2 = pcall(function()
                    return l_result_0:GetPackageInfo((string.match(v68, "%d+")));
                end);
                if not l_status_2 then
                    error(l_result_2);
                end;
                local v76 = v69 == 0;
                local v77 = {
                    PackageId = v68, 
                    FoundInstance = if not v76 then v71.instance else v61, 
                    Depth = v69, 
                    Changed = v76, 
                    IsSelected = v76, 
                    LatestVersionNumber = l_result_2.LatestVersionNumber, 
                    PackageAssetName = l_result_2.PackageAssetName, 
                    HasEditPermission = Enum.PackagePermission.Edit.Value <= l_result_2.PermissionLevel.Value
                };
                v64[v68] = v77;
                table.insert(v66, v77);
                return ;
            else
                v64[v68].Depth = math.max(v64[v68].Depth, v69);
                return ;
            end;
        else
            return ;
        end;
    end;
    v67(v63.PackageId, 0, {});
    return v66;
end;
v12.runScopedMassUpdate = function(v79, v80, v81, v82)
    local v83 = {};
    v28(v83, v81, v82);
    local l_v83_0 = v83;
    if #l_v83_0 > 0 then
        v80.PublishStatus = v19.Updating;
        v79:setState({});
        for _, v86 in ipairs(l_v83_0) do
            local v87 = v82[(if v86 then v86:FindFirstChildOfClass("PackageLink") else nil).PackageId];
            local v88 = 0;
            while true do
                if not v79.state.isCancelling then
                    if not v54(v86, v87.newVersionId) then
                        v79:setState({
                            canCancel = v88 >= 3
                        });
                        v88 = v88 + 1;
                        task.wait(0.5);
                    else
                        v80.Changed = true;
                        break;
                    end;
                else
                    return ;
                end;
            end;
        end;
    end;
end;
v12.getLatestVersionClone = function(v89, v90)
    local l_FoundInstance_0 = v90.FoundInstance;
    if l_FoundInstance_0 then
        l_FoundInstance_0 = l_FoundInstance_0:Clone();
        l_FoundInstance_0.Parent = v89.state.tempContainer;
        if not v90.IsSelected then
            local v92 = 0;
            local v93 = nil;
            while true do
                if not v89.state.isCancelling then
                    v93 = v54(l_FoundInstance_0, v90.LatestVersionNumber);
                    if not v93 then
                        local v94 = v92 >= 3;
                        if v89.state.canCancel ~= v94 then
                            v89:setState({
                                canCancel = v94
                            });
                        end;
                        warn(string.format(v18.PackagePublishFailure, v90.PackageAssetName, v90.PackageId));
                        task.wait(2 ^ math.min(v92, 2));
                        v92 = v92 + 1;
                    end;
                    if v93 then
                        return v93;
                    end;
                else
                    return ;
                end;
            end;
        else
            return l_FoundInstance_0;
        end;
    else
        warn(v18.LatestVersionFailure);
        return ;
    end;
end;
v12.promiseToPublishPackage = function(v95, v96, v97)
    return l_Promise_0.new(function(v98, v99)
        task.spawn(function()
            if not v95.state.isCancelling then
                v95:setState({
                    canCancel = false
                });
                local v100 = v95:getLatestVersionClone(v96);
                if v100 then
                    if not v96.IsSelected then
                        v95:runScopedMassUpdate(v96, v100, v97);
                    end;
                    if v96.Changed then
                        local v101 = v100:Clone();
                        v101.Archivable = false;
                        v101.Parent = v100.Parent;
                        local v102 = if v101 then v101:FindFirstChildOfClass("PackageLink") else nil;
                        local v103 = if v100 then v100:FindFirstChildOfClass("PackageLink") else nil;
                        if v103.Status == v18.UpToDateString then
                            v103:GetPropertyChangedSignal("Status"):Wait();
                        end;
                        v96.PublishStatus = v19.Pending;
                        v95:setState({});
                        local v104 = 0;
                        local v105 = nil;
                        local v106 = nil;
                        while true do
                            if not v95.state.isCancelling then
                                local l_status_3, l_result_3 = pcall(function()
                                    l_result_0:PublishPackage(v100, false);
                                end);
                                v105 = l_status_3;
                                v106 = l_result_3;
                                if not v105 then
                                    warn(v106);
                                    v96.PublishStatus = v19.Failed;
                                    v95:setState({
                                        canCancel = v104 >= 3
                                    });
                                    warn(string.format(v18.PackagePublishFailure, v96.PackageAssetName, v96.PackageId));
                                    task.wait(2 ^ math.min(v104, 2));
                                    v104 = v104 + 1;
                                    v96.PublishStatus = v19.Pending;
                                    v95:setState({});
                                else
                                    warn(string.format(v18.PackagePublishSuccess, v96.PackageAssetName, v96.PackageId));
                                    if not string.find(v102.Status, v18.NewVersionString) then
                                        v102:GetPropertyChangedSignal("Status"):Wait();
                                    end;
                                    v97[v96.PackageId] = {
                                        oldVersionId = v96.LatestVersionNumber, 
                                        newVersionId = (if v100 then v100:FindFirstChildOfClass("PackageLink") else nil).VersionNumber
                                    };
                                    v96.PublishStatus = v19.Success;
                                    v95:setState({});
                                end;
                                if v105 then
                                    v100:Destroy();
                                    v101:Destroy();
                                    return v98();
                                end;
                            else
                                return v99();
                            end;
                        end;
                    else
                        v96.PublishStatus = v19.Skipped;
                        v95:setState({});
                        warn(string.format(v18.PackagePublishSkipped, v96.PackageAssetName, v96.PackageId));
                        return v98();
                    end;
                else
                    return v99();
                end;
            else
                return v99();
            end;
        end);
    end);
end;
v12.waitForPromises = function(v109, v110, v111)
    if not v110 or #v110 == 0 then
        return true, nil;
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v113 = 0;
        for _, v115 in v110, nil, nil do
            if not (not l_game_FastFlag_0 and v113 >= 5) or l_BindableEvent_0.Event:Wait() then
                if not l_game_FastFlag_0 then
                    local v116 = os.clock() - (v109.PublishStartTime + v109.NumPromised * 2);
                    if v116 < 2 then
                        task.wait(2 - v116);
                    end;
                    v109.NumPromised = v109.NumPromised + 1;
                else
                    local v117 = os.clock();
                    local v118 = l_game_FastInt_0 * 60;
                    if v109.NumPromised == l_game_FastInt_1 and v117 < v109.PublishStartTime + v118 then
                        task.wait(((v109.PublishStartTime + v118) - v117) + 5);
                        v109.NumPromised = 0;
                        v109.PublishStartTime = os.clock();
                    end;
                    v109.NumPromised = v109.NumPromised + 1;
                end;
                v113 = v113 + 1;
                v109:promiseToPublishPackage(v115, v111):andThen(function()
                    v113 = v113 - 1;
                    l_BindableEvent_0:Fire(true);
                end):catch(function()
                    l_BindableEvent_0:Fire(false);
                end);
            else
                return ;
            end;
        end;
        while true do
            if v113 > 0 then
                if not l_BindableEvent_0.Event:Wait() then
                    return ;
                end;
            else
                l_BindableEvent_0:Destroy();
                return true;
            end;
        end;
    end;
end;
v12.doPackagePublishing = function(v119, v120)
    local v121 = {};
    local v122 = nil;
    local v123 = nil;
    v119.PublishStartTime = os.clock();
    v119.NumPromised = 0;
    for v124 = 1, #v120 do
        local v125 = v120[v124];
        if v122 ~= v125.Depth then
            if v119:waitForPromises(v123, v121) then
                v122 = v125.Depth;
                v123 = {};
            else
                return ;
            end;
        end;
        table.insert(v123, v125);
    end;
    v119:waitForPromises(v123, v121);
end;
v12.publishSelectedPackageHierarchy = function(v126)
    if v126.state.canPublish then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Archivable = false;
        l_Folder_0.Name = v18.TempContainerName;
        l_Folder_0.Parent = game:GetService("ServerStorage");
        v126:setState({
            isPublishing = true, 
            canPublish = false, 
            isCancelling = false, 
            canCancel = false, 
            tempContainer = l_Folder_0
        });
        v126:doPackagePublishing(v126.state.packageLists);
        if v126.state.isCancelling then
            warn(v18.OperationCancelled);
        else
            local l_selectedInstance_0 = v126.state.selectedInstance;
            local v129 = table.find(l_Selection_0:Get(), l_selectedInstance_0);
            while true do
                local l_l_selectedInstance_0_0 = l_selectedInstance_0;
                local v131;
                if l_l_selectedInstance_0_0 then
                    local l_Parent_2 = l_l_selectedInstance_0_0.Parent;
                    v131 = if l_Parent_2 then if if l_Parent_2 then l_Parent_2:FindFirstChildOfClass("PackageLink") else nil then l_Parent_2 else v55(l_Parent_2) else nil;
                else
                    v131 = nil;
                end;
                if not (not v131 or not string.find((if v131 then v131:FindFirstChildOfClass("PackageLink") else nil).Status, v18.NewVersionString)) then
                    l_selectedInstance_0 = v131;
                else
                    break;
                end;
            end;
            local v133 = v54(l_selectedInstance_0, 0);
            if v129 then
                l_Selection_0:Add({
                    v133
                });
            end;
            warn(v18.OperationEnded);
        end;
        l_Folder_0:Destroy();
        v126:setState({
            isPublishing = false, 
            isCancelling = false, 
            canCancel = false, 
            tempContainer = v1.None
        });
        v126:onChangeSelection();
        return ;
    else
        return ;
    end;
end;
v12.onChangeSelection = function(v134)
    if v134.props.Enabled then
        if not v134.state.isPublishing then
            local v135 = l_Selection_0:Get();
            if #v135 ~= 1 then
                v134:setState({
                    selectedInstance = v1.None, 
                    packageLists = v1.None, 
                    canPublish = false
                });
                return ;
            else
                local v136 = v135[1];
                local v137 = if v136 then v136:FindFirstChildOfClass("PackageLink") else nil;
                if not v137 or v137.Status == v18.UpToDateString then
                    v134:setState({
                        selectedInstance = v1.None, 
                        packageLists = v1.None, 
                        canPublish = false
                    });
                    return ;
                else
                    local v138 = v78(v136, game);
                    table.sort(v138, v60);
                    for _, v140 in ipairs(v138) do
                        v140.PublishStatus = v19.Ready;
                    end;
                    v134:setState({
                        selectedInstance = v136, 
                        packageLists = v138, 
                        canPublish = true
                    });
                    return ;
                end;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v12.didMount = function(v141)
    l_Selection_0.SelectionChanged:Connect(function()
        v141:onChangeSelection();
    end);
end;
v12.didUpdate = function(v142, v143)
    if v143.Enabled == v142.props.Enabled then
        return ;
    else
        if v142.props.Enabled then
            v142:onChangeSelection();
        end;
        return ;
    end;
end;
local v144 = v1.PureComponent:extend("ProgressBar");
v144.render = function(v145)
    local l_publishStatus_0 = v145.props.publishStatus;
    local v147 = v20[l_publishStatus_0];
    return v147 and v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Size = UDim2.new(0.9, 0, 0.1, 0), 
        Position = UDim2.new(0.5, 0, 1, -3)
    }, {
        uiCorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0.5)
        }), 
        uiStroke = v1.createElement("UIStroke", {
            Thickness = 2
        }), 
        progressBar = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundColor3 = v21[l_publishStatus_0], 
            Size = UDim2.new(v147, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0.5, 0)
        }, {
            uiCorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0.5)
            })
        })
    });
end;
local v148 = v1.PureComponent:extend("PackageBoxItem");
v148.render = function(v149)
    local l_props_0 = v149.props;
    return v1.createElement("Frame", {
        BackgroundColor3 = if not l_props_0.hasEditPermission then Color3.fromRGB(100, 100, 100) else Color3.fromRGB(200, 200, 200), 
        Size = UDim2.new(0, 80, 0, 80), 
        Position = UDim2.new(0, 84 * l_props_0.row, 0, 84 * l_props_0.column)
    }, {
        packageName = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = l_props_0.packageAssetName, 
            TextWrapped = true, 
            TextSize = 16, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }), 
        progressBar = v1.createElement(v144, {
            publishStatus = l_props_0.publishStatus
        })
    });
end;
v12.render = function(v151)
    local l_Localization_1 = v151.props.Localization;
    local l_mainWindow_0 = v151.props.Stylizer.mainWindow;
    local l_canPublish_0 = v151.state.canPublish;
    local l_isPublishing_0 = v151.state.isPublishing;
    local l_canCancel_0 = v151.state.canCancel;
    local l_isCancelling_0 = v151.state.isCancelling;
    local v158 = {};
    local v159 = 0;
    local v160 = 0;
    if not (not ((l_canPublish_0 or l_isPublishing_0) or l_canCancel_0) and not l_isCancelling_0) then
        local v161 = nil;
        local v162 = -1;
        local v163 = 0;
        for _, v165 in ipairs(v151.state.packageLists) do
            if v161 ~= v165.Depth then
                v161 = v165.Depth;
                v162 = v162 + 1;
                v160 = math.max(v160, v163 + 1);
                v163 = 0;
            else
                v163 = v163 + 1;
            end;
            v158[v165.PackageId] = v1.createElement(v148, {
                row = v162, 
                column = v163, 
                packageAssetName = v165.PackageAssetName, 
                publishStatus = v165.PublishStatus, 
                hasEditPermission = v165.HasEditPermission
            });
        end;
        v159 = math.max(0, v162 + 1);
        v160 = math.max(v160, v163 + 1);
    end;
    return v1.createElement(l_Pane_0, {
        BackgroundColor = l_mainWindow_0.backgroundColor
    }, {
        mainDisplay = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(1, 0, 1, -100), 
            Position = UDim2.new(0.5, 0, 0, 0)
        }, {
            scrollFrame = v1.createElement("ScrollingFrame", {
                ScrollingDirection = Enum.ScrollingDirection.XY, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, -8, 1, -8), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                CanvasSize = UDim2.new(0, 80 * v159 + 4 * math.max(0, v159 - 1), 0, 80 * v160 + 4 * math.max(0, v160 - 1))
            }, v158)
        }), 
        bottomBar = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 0, 100), 
            Position = UDim2.new(0.5, 0, 1, 0)
        }, {
            cancelButton = l_canCancel_0 and v1.createElement(l_Button_0, {
                Text = l_Localization_1:getText("Action", "Cancel"), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0.3, 0, 1, -8), 
                Position = UDim2.new(0, 4, 0.5, 0), 
                OnClick = function()
                    v151:setState({
                        canCancel = false, 
                        isCancelling = true
                    });
                end
            }), 
            publishHierarchyButton = l_canPublish_0 and v1.createElement(l_Button_0, {
                Text = l_Localization_1:getText("Action", "Publish"), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0.3, 0, 1, -8), 
                Position = UDim2.new(1, -4, 0.5, 0), 
                OnClick = function()
                    v151:publishSelectedPackageHierarchy();
                end
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12));
