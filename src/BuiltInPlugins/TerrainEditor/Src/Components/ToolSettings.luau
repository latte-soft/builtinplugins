local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useForm);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ProgressDialog);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Renderers);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_deepEqual_0 = v2.Util.deepEqual;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixTerrainEditorDETruncations);
local l_UI_0 = v2.UI;
local l_Form_0 = l_UI_0.Form;
local l_Pane_0 = l_UI_0.Pane;
return function(v17)
    local l_LayoutOrder_0 = v17.LayoutOrder;
    local l_Size_0 = v17.Size;
    local v20 = l_Stylizer_0:use("ToolSettings");
    local v21, v22 = l_useState_0({});
    local v23 = v8:use();
    local v24, v25 = v4(v23);
    local v26 = v5(v23);
    return v1.createElement(l_Pane_0, {
        BackgroundColor = v20.BackgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0
    }, {
        Form = v1.createElement(l_Form_0, {
            Expansion = v21, 
            ExpandByDefault = true, 
            Items = v24, 
            LabelHeight = 20, 
            LabelWidth = if not v13() then if v12() then UDim.new(0, 120) else UDim.new(0, 100) else UDim.new(0, 140), 
            OnChange = function(v27)
                if not v12() then
                    local v28 = {};
                    for v29, v30 in v27, nil, nil do
                        v28[v30.Id] = {};
                        for v31, v32 in v30.Children, nil, nil do
                            if v32.Value ~= v24[v29].Children[v31].Value then
                                v28[v30.Id][v32.DataId or v32.Id] = v32.Value;
                            end;
                        end;
                    end;
                    v25(v28);
                    return ;
                else
                    local v33 = {};
                    local function v34(v35, v36)
                        local v37 = {};
                        for v38, v39 in v35, nil, nil do
                            if if typeof(v39.Value) == "table" then l_deepEqual_0(v39.Value, v36[v38].Value) else v39.Value == v36[v38].Value then
                                if not (not v39.Children or l_deepEqual_0(v39.Children, v36[v38].Children)) then
                                    v37[v39.DataId or v39.Id] = {
                                        Children = v34(v39.Children, v36[v38].Children)
                                    };
                                end;
                            elseif not v39.Children or l_deepEqual_0(v39.Children, v36[v38].Children) then
                                if not v39.Children then
                                    v37[v39.DataId or v39.Id] = v39.Value;
                                else
                                    v37[v39.DataId or v39.Id] = {
                                        Value = v39.Value
                                    };
                                end;
                            else
                                v37[v39.DataId or v39.Id] = {
                                    Children = v34(v39.Children, v36[v38].Children), 
                                    Value = v39.Value
                                };
                            end;
                        end;
                        return v37;
                    end;
                    for v40, v41 in v27, nil, nil do
                        v33[v41.Id] = v34(v41.Children, v24[v40].Children);
                    end;
                    v25(v33);
                    return ;
                end;
            end, 
            OnExpansionChange = v22, 
            Renderers = v7, 
            Size = UDim2.fromScale(1, 1)
        }), 
        ProgressDialog = if not v26 then nil else v1.createElement(v6, v26)
    });
end;
