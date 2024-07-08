local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_LuaMeshEditingModule_0 = l_script_FirstAncestor_0.Packages.LuaMeshEditingModule;
local v2 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.createSymmetryMapAsync);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useUndoRedoActions);
local v8 = require(l_LuaMeshEditingModule_0.MeshEditingContexts.CageEditingContext);
local v9 = require(l_LuaMeshEditingModule_0.Components.FreeformMeshEditingComponent);
local l_ContextServices_0 = v4.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_LuaMeshEditingModuleContext_0 = v2.Contexts.LuaMeshEditingModuleContext;
return function(v14)
    local v15 = l_LuaMeshEditingModuleContext_0:use();
    local l_Mannequin_0 = v14.Mannequin;
    local v17 = l_Mouse_0:use():get();
    local v18 = l_Plugin_0:use():get();
    local v19, v20 = v3.useState(nil);
    local v21 = v3.useRef(nil);
    v3.useEffect(function()
        local v22 = v8.new();
        v21.current = v22;
        v22:initFromCageMesh(Enum.CageType.Outer, l_Mannequin_0);
        v15:setOuterCageContext(v22);
        v15:setCurrentTool("BrushTool");
        v15:changeEditingCage(Enum.CageType.Outer);
        v20(v15:getCurrentTool());
        local v26 = v22:getMeshDataChangedSignal():Connect(function()
            local v23 = v15:getOuterCageContext();
            if not (not v23 or not l_Mannequin_0) then
                for _, v25 in l_Mannequin_0:GetDescendants() do
                    if v25:IsA("WrapTarget") then
                        v25:ModifyVertices(Enum.CageType.Outer, v23:getVertexData()[v25.Name]);
                    end;
                end;
            end;
        end);
        return function()
            v26:Disconnect();
            v15:getCurrentTool():cleanup();
            v20(nil);
        end;
    end, {
        l_Mannequin_0
    });
    v3.useEffect(function()
        if v14.Symmetrical then
            local l_current_0 = v21.current;
            assert(l_current_0 ~= nil, "No outerCageContext");
            local v28 = task.spawn(function()
                l_current_0:setSymmetryMap(v6(l_Mannequin_0));
            end);
            return function()
                task.cancel(v28);
                l_current_0:setSymmetryMap({});
            end;
        else
            return nil;
        end;
    end, {
        v14.Symmetrical
    });
    v7(v3.useCallback(function()
        local v29 = v15:getCurrentTool();
        if v29 then
            v29:undo();
        end;
    end, {}), (v3.useCallback(function()
        local v30 = v15:getCurrentTool();
        if v30 then
            v30:redo();
        end;
    end, {})));
    return v19 and v3.createElement(v9, {
        Mouse = v17, 
        Plugin = v18, 
        VertexToolBase = v19, 
        Radius = v14.Radius, 
        Falloff = v14.Falloff, 
        Mannequin = l_Mannequin_0, 
        OnChangeSelectedPositions = v14.OnChangeSelectedPositions
    });
end;
