local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v7 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(script.BodyPointAdornment);
local _ = require(script.Types);
local v11 = require(script.getBoundingBox);
local v12 = require(script.useBodyMoveHandles);
local v13 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v14 = require(script.DraggerSchema);
local v15 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v16 = require(script.DraggerSelection);
local v17 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v18 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v21 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.useBindFocusOnPositions);
local v22 = require(script.useDisambiguationContextMenu);
local v23 = require(l_script_FirstAncestor_0.Src.Hooks.useRefWithInitial);
local v24 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v25 = require(l_script_FirstAncestor_0.Src.Hooks.useUndoRedoActions);
local l_Mouse_0 = v4.ContextServices.Mouse;
local l_Plugin_0 = v4.ContextServices.Plugin;
local l_Stylizer_0 = v4.ContextServices.Stylizer;
local function v29(v30)
    local v31 = {};
    for _, v33 in v30, nil, nil do
        v31[v33] = v33.getCFrame();
    end;
    return function()
        local v34 = v29(v30);
        for v35, v36 in v31, nil, nil do
            v35.onChange(v36);
        end;
        return v34;
    end;
end;
local function _(v37, v38)
    local v39 = table.remove(v37);
    if v39 == nil then
        return ;
    else
        assert(v39 ~= nil, v19.LUAU_ANALYZE_ERROR);
        table.insert(v38, (v39()));
        return ;
    end;
end;
return function(v41)
    local v42 = l_Stylizer_0:use("BodyPointsTool");
    local v43 = {};
    local v44, v45 = v5.useState({});
    local v46 = v5.useRef(nil);
    local v47 = l_Plugin_0:use():get();
    local v48 = v24(false);
    local v49 = v23(function()
        return v16.new(v45);
    end);
    local v51 = v23(function()
        local v50 = v13.new(v47, game, settings(), v49.current);
        v50.hoveredPointNames = {};
        v50.getGuiParent = function()
            assert(v46.current ~= nil, "Container isn't mounted yet");
            return v46.current;
        end;
        v50.shouldGridSnap = function()
            return false;
        end;
        return v50;
    end);
    local l_current_0 = v51.current;
    v49.current.draggerContext = l_current_0;
    l_current_0.generallyEquivalentPointNames = v41.generallyEquivalentPointNames;
    l_current_0.selection = v49.current;
    l_current_0.points = v41.points;
    local v54 = v5.useMemo(function()
        return v2.filter(v41.points, function(v53)
            return table.find(v44, v53.name) ~= nil;
        end);
    end, {
        v41.points, 
        v44
    });
    l_current_0.selectedPoints = v54;
    l_current_0.worldModel = v41.worldModel;
    v22(l_current_0);
    local v55 = v24(true);
    l_current_0.projectionEnabled = v55.enabled;
    local v56 = v24(true);
    v5.useEffect(v48.enable, {});
    local v57 = l_Mouse_0:use():get();
    local v61 = v5.useCallback(function()
        local v58 = {};
        for _, v60 in v41.points, nil, nil do
            table.insert(v58, {
                name = v60.name, 
                cframe = v60.getCFrame()
            });
        end;
        return v58;
    end, {
        v41.points
    });
    local v62 = v5.useRef({});
    assert(v62.current ~= nil, v19.LUAU_ANALYZE_ERROR);
    local v63 = v5.useRef({});
    assert(v63.current ~= nil, v19.LUAU_ANALYZE_ERROR);
    local v64, v65 = v5.useState(v61);
    local v76 = v5.useCallback(function(v66)
        local v67 = v66.getCFrame();
        local v69 = v66.symmetricalPartner and v2.find(v41.points, function(v68)
            return v68.name == v66.symmetricalPartner;
        end);
        local v70 = v69 and v69.getCFrame();
        return function(v71)
            v66.onChange(v71);
            if (v56.enabled and v69 ~= nil) and v70 ~= nil then
                local v72 = v71.Position - v67.Position;
                local v73, v74, v75 = (v71 * v67:Inverse()).Rotation:ToOrientation();
                v69.onChange((v70 + v72 * Vector3.new(-1, 1, 1)) * CFrame.fromOrientation(v73, -v74, -v75));
            end;
        end;
    end, {
        v41.points, 
        v56.enabled
    });
    l_current_0.createUpdatePointPosition = v76;
    v25(function()
        local l_current_1 = v62.current;
        local l_current_2 = v63.current;
        local v79 = table.remove(l_current_1);
        if v79 == nil then
            return ;
        else
            assert(v79 ~= nil, v19.LUAU_ANALYZE_ERROR);
            table.insert(l_current_2, (v79()));
            return ;
        end;
    end, function()
        local l_current_3 = v63.current;
        local l_current_4 = v62.current;
        local v82 = table.remove(l_current_3);
        if v82 == nil then
            return ;
        else
            assert(v82 ~= nil, v19.LUAU_ANALYZE_ERROR);
            table.insert(l_current_4, (v82()));
            return ;
        end;
    end);
    v21((v5.useMemo(function()
        local v83 = {};
        for _, v85 in v64, nil, nil do
            if table.find(v44, v85.name) ~= nil then
                table.insert(v83, (v41.worldModel.PrimaryPart.CFrame * v85.cframe).Position);
                if not (#v83 ~= #v44) then
                    break;
                end;
            end;
        end;
        return v83;
    end, {
        v64, 
        v44, 
        v41.worldModel
    })));
    v5.useEffect(function()
        local v86 = {};
        local function v87()
            v65(v61);
        end;
        for _, v89 in v54, nil, nil do
            if v89.connectChanged ~= nil then
                table.insert(v86, v89.connectChanged(v87));
            end;
        end;
        return function()
            for _, v91 in v86, nil, nil do
                v91();
            end;
        end;
    end, {
        v54
    });
    for v92, v93 in v64, nil, nil do
        local v94 = table.find(v44, v93.name) ~= nil;
        local v97 = (not v94 and v56.enabled) and v2.find(v44, function(v95)
            return v2.find(v41.points, function(v96)
                return v96.name == v95;
            end).symmetricalPartner == v93.name;
        end);
        v43[("Point%*"):format(v92)] = v5.createElement(v9, {
            adornee = v41.worldModel.PrimaryPart, 
            cframe = v93.cframe, 
            selected = v94 or v97, 
            color = if not v94 then if v97 then Color3.new(0, 0, 1) else Color3.new(1, 0, 0) else Color3.new(0, 1, 0), 
            transparency = (v94 or v97) and 0 or 0.5, 
            showOrientation = (v94 or v97) and true or nil, 
            onMouseEnter = function()
                if table.find(l_current_0.hoveredPointNames, v93.name) ~= nil then
                    return ;
                else
                    table.insert(l_current_0.hoveredPointNames, v93.name);
                    return ;
                end;
            end, 
            onMouseLeave = function()
                local v98 = table.find(l_current_0.hoveredPointNames, v93.name);
                if v98 ~= nil then
                    table.remove(l_current_0.hoveredPointNames, v98);
                end;
            end
        });
    end;
    local v99 = v12(l_current_0, v41.worldModel);
    local v111 = v5.useMemo(function()
        local v100 = {};
        return {
            beginDrag = function()
                local v101 = v11(l_current_0);
                table.clear(v63.current);
                table.insert(v62.current, (v29(v54)));
                for _, v103 in v54, nil, nil do
                    local v104 = v76(v103);
                    local v105 = v103.getCFrame();
                    table.insert(v100, function(v106)
                        v104(((v101:Inverse() * v106) * v101) * v105.Rotation + v105.Position);
                    end);
                end;
            end, 
            updateDrag = function(_, v108)
                for _, v110 in v100, nil, nil do
                    v110(v108);
                end;
                return v108;
            end, 
            endDrag = function()
                table.clear(v100);
            end, 
            render = function()
                return nil;
            end
        };
    end, {
        v54, 
        v61, 
        v76
    });
    local v112 = v5.useMemo(function()
        return v17.new(l_current_0, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 0.3
        }, v111);
    end, {
        v111
    });
    local v113 = v5.useMemo(function()
        return v18.new(l_current_0, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 0.3
        }, v111);
    end, {
        v111
    });
    return v5.createElement(v5.Fragment, {}, {
        [v19.EDITING_TOOLS_GUI_NAMES.BodyPoints] = v6.createPortal(v5.createElement("Folder", {
            ref = v46
        }, v43, {
            Dragger = v48.enabled and v5.createElement(v15, (v5.useMemo(function()
                return {
                    Mouse = v57, 
                    DraggerContext = v51.current, 
                    DraggerSchema = v14, 
                    DraggerSettings = {
                        AnalyticsName = v41.name, 
                        HandlesList = if #v54 == 0 then {
                            v99
                        } else {
                            v112, 
                            v113
                        }
                    }
                };
            end, {
                v99, 
                v112, 
                v113, 
                #v54 == 0
            })))
        }), l_CoreGui_0, v19.EDITING_TOOLS_GUI_NAMES.BodyPoints), 
        [v19.EDITING_TOOLS_GUI_NAMES.BodyPointsToolToolbar] = v5.createElement(v7.Toolbar, {
            HorizontalItems = {
                {
                    Type = "Button", 
                    Tooltip = "Projection", 
                    Icon = v42.ProjectionImage, 
                    OnClick = v55.toggle, 
                    Selected = v55.enabled
                }, 
                {
                    Type = "Button", 
                    Tooltip = "Symmetrical", 
                    Icon = v42.SymmetricalImage, 
                    OnClick = v56.toggle, 
                    Selected = v56.enabled
                }, 
                {
                    Type = "Separator"
                }, 
                unpack(v41.additionalToolbarItems)
            }
        })
    });
end;
