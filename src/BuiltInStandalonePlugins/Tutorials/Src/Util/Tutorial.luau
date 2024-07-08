local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_collect_0 = v1.collect;
local l_findIndex_0 = v1.findIndex;
local _ = require(l_Parent_0.Src.Util.TutorialTypes);
local v5 = require(l_Parent_0.Src.Util.TutorialSteps);
local v6 = require(l_Parent_0.Src.Util.TutorialSteps.TutorialStep);
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("TutorialService");
end);
local v9 = if not l_status_0 then nil else l_result_0;
local l_status_1, l_result_1 = pcall(function()
    return game:GetService("StudioWidgetsService");
end);
local v12 = if not l_status_1 then nil else l_result_1;
local v13 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseExtensibilityApi)();
local l_StudioSpotlight_0 = game:GetFastFlag("StudioSpotlight");
local v15 = {
    DataModel = "Edit", 
    PluginType = "Standalone", 
    PluginId = "Tutorials", 
    Category = "Panels", 
    ItemId = "TourWidget"
};
local v16 = {
    PluginId = "MainWindow", 
    Category = "Widgets", 
    ItemId = "Main"
};
local l_insert_0 = table.insert;
local l_find_0 = table.find;
local v19 = {};
local v20 = {
    __index = v19
};
local function v21()
end;
v19.new = function(v22, v23, v24, v25, v26)
    local v27 = {};
    local v28 = {
        completed = false, 
        dataModel = v22, 
        currentStep = 0, 
        data = v23, 
        steps = v27, 
        instances = {}, 
        localization = v24, 
        incrementing = false, 
        toolboxConnection = v25, 
        toolboxLimits = nil, 
        callouts = {}, 
        topics = {}, 
        onStepChanged = v21, 
        onKeyPressed = v21, 
        onCompleted = v21, 
        widget = nil
    };
    if v13 then
        v28.Panels = v26:GetPluginComponent("Panels");
    end;
    for _, v30 in ipairs(v23.steps) do
        local v31 = v5[v30.kind];
        local v32 = v24:getText(v23.id, ("%s_Title"):format(v30.id));
        local v33 = v24:getText(v23.id, ("%s_Description"):format(v30.id));
        v30.title = v32;
        v30.description = v33;
        if v30.topic ~= v28.topics[#v28.topics] then
            l_insert_0(v28.topics, v30.topic);
        end;
        if not v31 then
            if not v30.kind then
                l_insert_0(v27, v6.new(v28, v30));
            else
                warn("Missing step class: " .. v30.kind);
            end;
        else
            l_insert_0(v27, v31.new(v28, v30));
        end;
    end;
    return (setmetatable(v28, v20));
end;
v19.start = function(v34)
    if v34.data.onStart then
        v34.data.onStart(v34);
    end;
    v34:setStep(1);
end;
v19.setWidget = function(v35, v36)
    v35.widget = v36;
    v35:resetAttachment();
end;
v19.resetAttachment = function(v37)
    if not v13 then
        v37:attachTo({
            target = "ideDocDocumentPanel", 
            hideArrow = true, 
            sourceAnchorPoint = Vector2.new(0, 0), 
            targetAnchorPoint = Vector2.new(0, 0), 
            offset = Vector2.new(20, 20)
        });
        return ;
    elseif v37.widget then
        v37:attachTo({
            TargetWidgetUri = v16, 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            TargetAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(20, 20)
        });
        return ;
    else
        return ;
    end;
end;
v19.attachTo = function(v38, v39)
    if not v13 then
        local l_v12_WidgetFromLabel_0 = v12:GetWidgetFromLabel(v39.target);
        local l_StudioAttachment_0 = Instance.new("StudioAttachment");
        l_StudioAttachment_0.IsArrowVisible = not v39.hideArrow;
        l_StudioAttachment_0.SourceAnchorPoint = v39.sourceAnchorPoint or Vector2.new(0.5, 0);
        l_StudioAttachment_0.TargetAnchorPoint = v39.targetAnchorPoint or Vector2.new(0.5, 1);
        l_StudioAttachment_0.Offset = v39.offset or Vector2.new(0, 0);
        v12:AttachPluginGui(l_v12_WidgetFromLabel_0, v38.widget, l_StudioAttachment_0);
        return ;
    else
        v39.TargetWidgetUri = v39.TargetWidgetUri or v16;
        v39.SubjectAnchorPoint = v39.SubjectAnchorPoint or Vector2.new(0.5, 0);
        v39.TargetAnchorPoint = v39.TargetAnchorPoint or Vector2.new(0.5, 1);
        v39.Offset = v39.Offset or Vector2.new(0, 0);
        v38.Panels:SetAttachment(v15, v39);
        return ;
    end;
end;
v19.setStep = function(v42, v43)
    local v44 = v42.steps[v43];
    local l_data_0 = v44.data;
    if v42.currentCallout then
        v42.currentCallout:Destroy();
        v42.currentCallout = nil;
    end;
    v42.currentStep = v43;
    if l_data_0.hideWidgets then
        v9:HideWidgets(l_data_0.hideWidgets);
    end;
    if l_data_0.widgets then
        v9:ShowWidgets(l_data_0.widgets);
    end;
    v42:setToolboxLimits(l_data_0.toolboxLimits);
    if not l_data_0.callout then
        v42:resetAttachment();
    else
        v42:attachTo(l_data_0.callout);
    end;
    v44:bind();
    if l_data_0.onBind then
        l_data_0.onBind(v42);
    end;
    if l_StudioSpotlight_0 then
        v12:HideSpotlight();
        if v42.showSpotlightTask then
            task.cancel(v42.showSpotlightTask);
        end;
        v42.showSpotlightTask = task.delay(0.5, function()
            v42:showSpotlight();
        end);
    end;
    if not (not (v42.data.id == "StudioTour") or not l_data_0.callout) then
        v42.currentCallout = v42:showCallout({
            title = l_data_0.title, 
            description = l_data_0.description, 
            showNext = l_data_0.showNext, 
            hideArrow = l_data_0.callout.hideArrow, 
            anchorPoint = l_data_0.callout.anchorPoint, 
            target = l_data_0.callout.target, 
            rowName = l_data_0.callout.rowName
        });
    end;
    local v46 = v42:getCurrentStepData();
    v46.step = l_collect_0(l_data_0, function(v47, v48)
        if typeof(v48) == "function" then
            return nil;
        else
            return v47, v48;
        end;
    end);
    v42.onStepChanged(v46);
end;
v19.showCallout = function(v49, v50)
    local l_v9_StudioWidgetFromLabel_0 = v9:GetStudioWidgetFromLabel(v50.target);
    local l_StudioCallout_0 = Instance.new("StudioCallout");
    l_StudioCallout_0.Title = v50.title;
    l_StudioCallout_0.Text = v50.description;
    l_StudioCallout_0.IsNextVisible = v50.showNext or false;
    l_StudioCallout_0.IsArrowVisible = not v50.hideArrow and true or false;
    l_StudioCallout_0:SetOnNextClicked(function()
        l_StudioCallout_0:Destroy();
        v49:increment();
        v49.callouts[l_StudioCallout_0] = nil;
    end);
    if v50.rowName then
        l_StudioCallout_0.RowName = v50.rowName;
    end;
    l_StudioCallout_0.AnchorPoint = v50.anchorPoint or Vector2.new(1, 0.5);
    l_StudioCallout_0.Parent = l_v9_StudioWidgetFromLabel_0;
    v49.callouts[l_StudioCallout_0] = true;
    return l_StudioCallout_0;
end;
v19.getCurrentStep = function(v53)
    return v53.steps[v53.currentStep];
end;
v19.getCurrentStepData = function(v54)
    local v55 = v54:getCurrentStep();
    local v56 = {
        id = v54.data.id, 
        currentStep = v54.currentStep, 
        stepCount = #v54.steps, 
        showNext = v55.data.showNext, 
        topics = v54.topics, 
        topic = l_find_0(v54.topics, v55.data.topic), 
        topicStepCount = 0
    };
    for _, v58 in v54.steps, nil, nil do
        if v58.data.topic == v55.data.topic then
            v56.topicStepCount = v56.topicStepCount + 1;
        end;
        if v58 == v55 then
            v56.topicStep = v56.topicStepCount;
        end;
    end;
    return v56;
end;
v19.increment = function(v59, v60)
    if not v59.incrementing then
        v59.incrementing = true;
        local v61 = v59:getCurrentStep();
        if v61 then
            if v61.data.onUnbind then
                v61.data.onUnbind(v59);
            end;
            v61:unbind();
        end;
        local v62 = v59:getCurrentStepData();
        if not v60 then
            if not v61.showComplete then
                v59:finishIncrement();
                return ;
            else
                task.delay(0.4, function()
                    v62.step = {
                        id = v61.data.id, 
                        kind = "Completed", 
                        title = v59.localization:getText(v59.data.id, ("%s_Title"):format(v61.data.id))
                    };
                    v59.onStepChanged(v62);
                    task.delay(2, function()
                        v59:finishIncrement();
                    end);
                end);
                return ;
            end;
        elseif not v59.skipping then
            v59.skipping = true;
            v62.step = {
                id = v61.data.id, 
                kind = "Skipped", 
                description = v59.localization:getText("Tutorial", "StepSkipped")
            };
            if v61.data.onSkip then
                v61.data.onSkip(v59);
            end;
            v59.onStepChanged(v62);
            if v59.currentCallout then
                v59.currentCallout:Destroy();
                v59.currentCallout = nil;
            end;
            task.delay(1.5, function()
                v59.skipping = false;
                v59:finishIncrement();
            end);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v19.back = function(v63)
    if v63.currentStep == 1 then
        return ;
    else
        v63:setStep(v63.currentStep - 1);
        return ;
    end;
end;
v19.finishIncrement = function(v64)
    if v64.currentStep == #v64.steps then
        v64.completed = true;
        if v64.data.onComplete then
            v64.data.onComplete(v64);
        end;
        v64.onCompleted();
    else
        v64:setStep(v64.currentStep + 1);
    end;
    v64.incrementing = false;
end;
v19.selectTopic = function(v65, v66)
    local v67 = v65:getTopicStep(v66);
    if v67 then
        if v67 < v65.currentStep then
            v65:setStep(v67);
            return ;
        elseif v65.currentStep < v67 then
            for v68 = v65.currentStep, v67 - 1 do
                local v69 = v65.steps[v68];
                if v69.data.onSkip then
                    v69.data.onSkip(v65);
                end;
            end;
            v65:setStep(v67);
        end;
    end;
end;
v19.getTopicStep = function(v70, v71)
    local v72 = v70.topics[v71];
    return l_findIndex_0(v70.steps, function(v73)
        return v73.data.topic == v72;
    end);
end;
v19.showSpotlight = function(v74)
    local v75 = v74:getCurrentStep();
    local v76 = if not v75 then nil else v75.data;
    if v76.spotlight then
        local l_v12_WidgetFromLabel_1 = v12:GetWidgetFromLabel(v76.spotlight.target);
        if v76.spotlight.showShadows then
            v12:ApplyShadows();
            v12:ApplySpotlight(l_v12_WidgetFromLabel_1, v76.spotlight.rowName);
        end;
        if v76.spotlight.showBox then
            v12:ApplyFillInBox(l_v12_WidgetFromLabel_1, v76.spotlight.rowName);
        end;
        if v76.spotlight.showHighlight then
            v12:ApplyHighlight(l_v12_WidgetFromLabel_1, v76.spotlight.rowName);
        end;
        return ;
    else
        return ;
    end;
end;
v19.setToolboxLimits = function(v78, v79)
    if v78.toolboxLimits == v79 then
        return ;
    else
        v78.toolboxLimits = v79;
        local l_toolboxConnection_0 = v78.toolboxConnection;
        if l_toolboxConnection_0:getNamespaceFolder():WaitForChild("SetTutorialLimits", 2) then
            l_toolboxConnection_0:Invoke("SetTutorialLimits", if not v79 then {} else {
                assetIds = v79.assetIds, 
                positionOverride = v79.positionOverride, 
                scriptWarningOverride = v79.scriptWarningOverride
            });
        end;
        return ;
    end;
end;
v19.syncChildren = function(_, v82, v83, v84)
    for _, v86 in ipairs(v82:GetChildren()) do
        if v86:IsA(v83) then
            v84(v86);
        end;
    end;
    return v82.ChildAdded:Connect(function(v87)
        if v87:IsA(v83) then
            v84(v87);
        end;
    end);
end;
return v19;
