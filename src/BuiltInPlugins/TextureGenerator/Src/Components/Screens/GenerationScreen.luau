local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useEventConnection_0 = v3.useEventConnection;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v7 = require(l_Components_0.EntryArea);
local v8 = require(l_Components_0.Generations);
local l_ContextServices_0 = v4.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local l_UI_0 = v4.UI;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Pane_0 = l_UI_0.Pane;
local v16 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v17 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v18 = require(l_script_FirstAncestor_0.Src.Util.PreviewsContext);
local v19 = require(l_script_FirstAncestor_0.Src.Util.OptionsContext);
local v20 = require(l_script_FirstAncestor_0.Src.Util.createHashFromMeshParts);
local v21 = require(l_script_FirstAncestor_0.Src.Util.fetchAndSetQuotas);
local v22 = require(l_script_FirstAncestor_0.Src.Util.setTexture);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugTextureGeneratorLogging);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v26 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
return function()
    local v27 = l_Analytics_0:use();
    local v28 = l_LayoutOrderIterator_0.new();
    local v29 = l_Localization_0:use();
    local v30 = v12();
    local v31 = v2.useContext(v17);
    local v32 = v2.useContext(v19);
    local v33 = v2.useContext(v18);
    v2.useEffect(function()
        v21(v31, v33);
    end, {});
    v2.useEffect(function()
        local v34 = nil;
        for _, v36 in v30, nil, nil do
            local l_SurfaceAppearance_0 = v36:FindFirstChildOfClass("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                v34 = l_SurfaceAppearance_0.ColorMap;
            end;
        end;
        local v38 = nil;
        if v34 then
            for v39, v40 in v31.generations, nil, nil do
                if v40.textureIds == v34 then
                    v38 = v39;
                    break;
                end;
            end;
        end;
        v31.setSelected(v38);
    end, {
        v30, 
        v31.setSelected
    });
    l_useEventConnection_0(l_TextureGenerationService_0.GenerationNotificationSignal, function(v41)
        if v24() then
            print("generation notification table", v41);
        end;
        local v42 = v31.generations[v41.uuid];
        if v42 then
            if v41.seed then
                v32.setSeed(v41.seed);
            end;
            if v41.status == v16.STATUS.COMPLETED then
                v41.layoutOrder = v31.quota + v16.COMPLETED_GENERATIONS_INDEX;
                v31.setSelected(v41.uuid);
                if v25() then
                    local v43 = nil;
                    if v26() then
                        v43 = v42.uuid;
                    end;
                    v27:report("ReceivedTexture", v42.serverId, v42.meshParts, v42.prompt, v42.seed, v42.rotation, v42.smartUVUnwrap, v42.promptMasking, v41.textureIds, v43);
                end;
            end;
            v31.updateGeneration({
                action = v16.GENERATION_ACTIONS.UPDATE, 
                uuid = v41.uuid, 
                data = v41
            });
            if v41.status ~= v16.STATUS.COMPLETED then
                return ;
            else
                if v41.unwrappingRequest then
                    local v44 = v20(v42.meshParts);
                    v41.unwrappingRequest:ApplyToDataModel(v42.partGroup);
                    v31.updateModelToGenerations({
                        action = v16.GENERATION_ACTIONS.REMOVE, 
                        hash = v44, 
                        uuid = v41.uuid
                    });
                    v31.updateModelToGenerations({
                        action = v16.GENERATION_ACTIONS.ADD, 
                        hash = v20(v42.meshParts), 
                        uuid = v41.uuid
                    });
                end;
                assert(v41.textureIds, "Notification should have saved TextureIDs");
                for _, v46 in v42.meshParts, nil, nil do
                    v22(v46, v41.textureIds);
                end;
                v21(v31, v33);
                return ;
            end;
        else
            warn(v29:getText("Generation", "Warning"));
            return ;
        end;
    end, {
        v31.generations, 
        v31.updateGeneration, 
        v31.updateModelToGenerations, 
        v31.setSelected, 
        v32.setSeed, 
        v30
    });
    l_useEventConnection_0(l_TextureGenerationService_0.PreviewNotificationSignal, function(v47)
        if v24() then
            print("preview notification table", v47);
        end;
        if v47.seed then
            v32.setSeed(v47.seed);
        end;
        local v48 = v33.previews[v47.uuid];
        if not v48 or v48.imageFailed then
            if not (not v47.previewUrlFailed or not v48.imageFailed) then
                v47.imageFailed = v48.imageFailed + 1;
            end;
        else
            v47.imageFailed = 0;
        end;
        if v25() and v47.status == v16.STATUS.COMPLETED then
            local v49 = nil;
            if v26() then
                v49 = v47.uuid;
            end;
            v27:report("ReceivedPreview", v48.serverId, v48.meshParts, v48.prompt, v48.seed, v48.rotation, v48.smartUVUnwrap, v48.promptMasking, v49);
        end;
        if v47.status == v16.STATUS.FAILED then
            v33.addError(v20(v48.meshParts), v47.message, v29:getText("EntryArea", "ErrorAlertTitle"), v47.message, "error");
            v33.removePreview(v47.uuid);
        else
            v33.updatePreview(v47);
        end;
        v21(v31, v33);
    end, {
        v31, 
        v32.setSeed, 
        v33, 
        v30
    });
    return v2.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 1)
    }, {
        Main = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            EntryArea = v2.createElement(v7, {
                LayoutOrder = v28:getNextOrder()
            }), 
            Generations = v2.createElement(v8, {
                LayoutOrder = v28:getNextOrder(), 
                MeshParts = v30
            })
        })
    });
end;
