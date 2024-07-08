local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useGizmos);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useNote);
local v9 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Brush);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Placement);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Plane);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Region);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Note);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local l_Pane_0 = v3.UI.Pane;
local l_Gizmo_0 = require(l_script_FirstAncestor_0.Src.Types).Gizmo;
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v20 = {
    [l_Gizmo_0.Brush] = v9, 
    [l_Gizmo_0.Placement] = if not v18() then nil else v10, 
    [l_Gizmo_0.Plane] = v11, 
    [l_Gizmo_0.Region] = v12
};
return function(v21)
    local v22 = v15:use();
    local v23 = v14:use();
    local v24, v25 = l_useState_0(true);
    local v26, v27, v28, v29 = v7(v22, v24);
    local v30 = v8(v22, v24);
    v6(v23.Activation, v25, {});
    l_useEffect_0(function()
        if not (v19() or #v26 ~= 0) or not v24 then
            v23:disable();
            return ;
        else
            v23:enable();
            v25(true);
            return ;
        end;
    end, {
        v28, 
        v24, 
        v26
    });
    if v24 then
        local v31 = {};
        for _, v33 in v26, nil, nil do
            local v34 = v20[v33.Schema.Type];
            if not v34 then
                error((("No renderer found for gizmo schema %*"):format(v33.Schema.Type)));
            end;
            v31[v33.Id] = v2.createElement(v34, v1.join(v33, {
                Tool = v28._name, 
                FromSelf = v29, 
                Save = function(v35)
                    local v36 = {};
                    local v37 = {};
                    for v38, v39 in v26, nil, nil do
                        v36[v38] = table.clone(v39);
                        for v40, v41 in v35, nil, nil do
                            v37[v40] = {};
                            for v42, v43 in v41, nil, nil do
                                if v39.Value[v40][v42] ~= v43 then
                                    v37[v40][v42] = v43;
                                end;
                                v36[v38].Value[v40][v42] = v43;
                            end;
                        end;
                    end;
                    v27(v36, v35);
                end
            }));
        end;
        if v30 then
            v31[l_Gizmo_0.Note] = v2.createElement(v13, {
                Key = v30
            });
        end;
        return v2.createElement(l_Pane_0, v21, v31);
    else
        return v2.createElement(l_Pane_0, v21, {});
    end;
end;
