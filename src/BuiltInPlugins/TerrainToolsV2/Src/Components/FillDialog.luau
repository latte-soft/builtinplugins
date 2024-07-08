local _ = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v6 = require(l_Parent_0.Src.Util.ConvertTransformToRegion);
local v7 = require(l_Parent_0.Src.Components.ProgressDialog);
local v8 = require(l_Parent_0.Src.Util.CreateSubRegions);
local v9 = require(l_Parent_0.Src.Util.LongOperation);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v11 = v2.Component:extend("FillDialog");
v11.init = function(v12)
    v12.operation = v9.new({
        onStart = function(v13)
            local l_props_0 = v12.props;
            local l_Terrain_0 = l_props_0.Terrain;
            v13.regions = v8(l_props_0.Transform, l_props_0.Size);
            v13.currentIndex = 1;
            local v16 = v6(l_props_0.Transform, l_props_0.Size);
            v13.backup = l_Terrain_0:CopyRegion(v16);
            v13.backupRegion = v16;
        end, 
        onStep = function(v17)
            local l_props_1 = v12.props;
            local l_Replace_0 = l_props_1.Replace;
            local l_Terrain_1 = l_props_1.Terrain;
            local v21 = v17.regions[v17.currentIndex];
            if not l_Replace_0 then
                l_Terrain_1:SetMaterialInTransformSubregion(l_props_1.Transform, l_props_1.Size, l_props_1.Material, v21);
            else
                l_Terrain_1:ReplaceMaterialInTransformSubregion(l_props_1.Transform, l_props_1.Size, l_props_1.SourceMaterial, l_props_1.TargetMaterial, v21);
            end;
            if v17.currentIndex == #v17.regions then
                return false, 0;
            else
                v17.currentIndex = v17.currentIndex + 1;
                return true, v17.currentIndex / #v17.regions;
            end;
        end, 
        onCancel = function(v22)
            local l_props_2 = v12.props;
            l_props_2.Terrain:PasteRegion(v22.backup, v22.backupRegion.Min, true);
            l_props_2.OnFinish();
        end, 
        onError = function(_)
            print(v12.operation._errorMessage);
        end, 
        onFinish = function()
            local l_props_3 = v12.props;
            l_ChangeHistoryService_0:SetWaypoint("TransformAction");
            l_props_3.OnFinish();
        end
    });
    v12.state = {
        paused = false, 
        progress = 0, 
        running = false
    };
end;
v11.didMount = function(v26)
    v26.pauseChangedConnection = v26.operation.PausedChanged:Connect(function(v27)
        v26:setState({
            paused = v27
        });
    end);
    v26.runningChangedConnection = v26.operation.RunningChanged:Connect(function(v28)
        v26:setState({
            running = v28
        });
    end);
    v26.progressChangedConnection = v26.operation.ProgressChanged:Connect(function(v29)
        v26:setState({
            progress = v29
        });
    end);
    v26.operation:start();
end;
v11.willUnmount = function(v30)
    if v30.pauseChangedConnection then
        v30.pauseChangedConnection:Disconnect();
    end;
    if v30.runningChangedConnection then
        v30.runningChangedConnection:Disconnect();
    end;
    if v30.progressChangedConnection then
        v30.progressChangedConnection:Disconnect();
    end;
    v30.operation:destroy();
end;
v11.render = function(v31)
    local l_props_4 = v31.props;
    local l_Localization_1 = l_props_4.Localization;
    return v2.createElement(v7, {
        Title = if not l_props_4.Replace then l_Localization_1:getText("Fill", "Title") else l_Localization_1:getText("Replace", "Title"), 
        SubText = if not l_props_4.Replace then l_Localization_1:getText("Fill", "Description"):format(l_Localization_1:getText("Materials", l_props_4.Material.Name)) else l_Localization_1:getText("Replace", "Description"):format(l_Localization_1:getText("Materials", l_props_4.SourceMaterial.Name), l_Localization_1:getText("Materials", l_props_4.TargetMaterial.Name)), 
        Progress = v31.state.progress, 
        OnCancelButtonClicked = function()
            v31.operation:cancel();
        end
    });
end;
return l_withContext_0({
    Localization = l_Localization_0
})(v11);
