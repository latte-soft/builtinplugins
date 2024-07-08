local _ = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v6 = require(l_Parent_0.Src.Components.ProgressDialog);
local v7 = require(l_Parent_0.Src.Util.CreateSubRegions);
local v8 = require(l_Parent_0.Src.Util.LongOperation);
local v9 = require(l_Parent_0.Src.Util.ConvertTransformToRegion);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v11 = v2.Component:extend("TransformDialog");
v11.init = function(v12)
    v12.operation = v8.new({
        onStart = function(v13)
            local l_props_0 = v12.props;
            local l_Terrain_0 = l_props_0.Terrain;
            v13.time = tick();
            if not (not l_props_0.SourceTransform or not l_props_0.SourceSize) then
                v13.sourceRegions = v7(l_props_0.SourceTransform, l_props_0.SourceSize);
            end;
            v13.sourceCurrentIndex = 1;
            local v16, v17 = v7(l_props_0.Transform, l_props_0.Size);
            v13.regions = v16;
            v13.origins = v17;
            v13.currentIndex = 1;
            v16 = v9(l_props_0.Transform, l_props_0.Size);
            v13.backup = l_Terrain_0:CopyRegion(v16);
            v13.backupRegion = v16;
        end, 
        onStep = function(v18)
            local l_props_1 = v12.props;
            local l_MergeEmpty_0 = l_props_1.MergeEmpty;
            local l_TerrainRegion_0 = l_props_1.TerrainRegion;
            local l_Terrain_1 = l_props_1.Terrain;
            local v23 = v18.regions[v18.currentIndex];
            local v24 = v18.origins[v18.currentIndex];
            if v18.sourceRegions then
                l_Terrain_1:SetMaterialInTransformSubregion(l_props_1.SourceTransform, l_props_1.SourceSize, Enum.Material.Air, v18.sourceRegions[v18.sourceCurrentIndex]);
                if v18.sourceCurrentIndex ~= #v18.sourceRegions then
                    v18.sourceCurrentIndex = v18.sourceCurrentIndex + 1;
                    return true, v18.sourceCurrentIndex / (#v18.sourceRegions + #v18.regions);
                end;
            end;
            if l_MergeEmpty_0 then
                l_Terrain_1:SetMaterialInTransformSubregion(l_props_1.Transform, l_props_1.Size, Enum.Material.Air, v23);
            end;
            l_Terrain_1:PasteRegion(l_TerrainRegion_0:ApplyTransformSubregion(l_props_1.Transform.Rotation, l_props_1.Size, v23), v24, false);
            if v18.currentIndex == #v18.regions then
                return false, 0;
            else
                v18.currentIndex = v18.currentIndex + 1;
                return true, (v18.currentIndex + (v18.sourceCurrentIndex or 0)) / (#v18.regions + (not v18.sourceRegions and 0 or #v18.sourceRegions));
            end;
        end, 
        onCancel = function(v25)
            local l_props_2 = v12.props;
            l_props_2.Terrain:PasteRegion(v25.backup, v25.backupRegion.Min, true);
            l_props_2.OnFinish();
        end, 
        onError = function(_)
            warn(v12.operation._errorMessage);
        end, 
        onFinish = function(_)
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
v11.didMount = function(v30)
    v30.pauseChangedConnection = v30.operation.PausedChanged:Connect(function(v31)
        v30:setState({
            paused = v31
        });
    end);
    v30.runningChangedConnection = v30.operation.RunningChanged:Connect(function(v32)
        v30:setState({
            running = v32
        });
    end);
    v30.progressChangedConnection = v30.operation.ProgressChanged:Connect(function(v33)
        v30:setState({
            progress = v33
        });
    end);
    v30.operation:start();
end;
v11.willUnmount = function(v34)
    if v34.pauseChangedConnection then
        v34.pauseChangedConnection:Disconnect();
    end;
    if v34.runningChangedConnection then
        v34.runningChangedConnection:Disconnect();
    end;
    if v34.progressChangedConnection then
        v34.progressChangedConnection:Disconnect();
    end;
    v34.operation:destroy();
end;
v11.render = function(v35)
    local l_Localization_1 = v35.props.Localization;
    return v2.createElement(v6, {
        Title = l_Localization_1:getText("TransformAction", "Title"), 
        SubText = l_Localization_1:getText("TransformAction", "Description"), 
        Progress = v35.state.progress, 
        OnCancelButtonClicked = function()
            v35.operation:cancel();
        end
    });
end;
return l_withContext_0({
    Localization = l_Localization_0
})(v11);
