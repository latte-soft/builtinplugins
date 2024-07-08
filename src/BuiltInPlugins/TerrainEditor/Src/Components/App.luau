local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local l_Pane_0 = v2.UI.Pane;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Toolbar);
local v10 = require(l_script_FirstAncestor_0.Src.Components.ToolGizmos);
local v11 = require(l_script_FirstAncestor_0.Src.Components.ToolSettings);
local v12 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorCompactMode);
return function()
    local v14 = v12:use();
    local v15, v16 = l_useState_0(Vector2.new(0, 0));
    local v17 = l_useRef_0();
    l_useEffect_0(function()
        if v17.current then
            v14:setRoot(v17.current.Parent);
            if v13() then
                v14:setPluginWidth(v17.current.AbsoluteSize.X);
            end;
        end;
    end, {});
    local v18 = l_useCallback_0(function()
        if v17.current then
            v14:setPluginWidth(v17.current.AbsoluteSize.X);
        end;
    end, {
        v14
    });
    local v19 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        ForwardRef = v17, 
        Size = UDim2.fromScale(1, 1), 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v1.Change.AbsoluteSize] = if not v13() then nil else v18
    }, {
        Toolbar = v1.createElement(v9, {
            LayoutOrder = v19:getNextOrder(), 
            OnAbsoluteSizeChanged = v16
        }), 
        ToolSettings = v1.createElement(v11, {
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v15.Y)
        }), 
        ToolGizmos = v1.createElement(v10, {
            LayoutOrder = v19:getNextOrder(), 
            Size = UDim2.new()
        })
    });
end;
