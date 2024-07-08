local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Src.Util.PluginActivationController);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.ContextItems);
local l_Tools_0 = script.Parent.Tools;
local v9 = require(l_Tools_0.Add);
local v10 = require(l_Tools_0.Clear);
local v11 = require(l_Tools_0.Draw);
local v12 = require(l_Tools_0.Erode);
local v13 = require(l_Tools_0.Fill);
local v14 = require(l_Tools_0.Flatten);
local v15 = require(l_Tools_0.Generate);
local v16 = require(l_Tools_0.Grow);
local v17 = require(l_Tools_0.ImportLocal);
local v18 = require(l_Tools_0.Material);
local v19 = require(l_Tools_0.Paint);
local v20 = require(l_Tools_0.Region);
local v21 = require(l_Tools_0.SeaLevel);
local v22 = require(l_Tools_0.Select);
local v23 = require(l_Tools_0.Replace);
local v24 = require(l_Tools_0.Sculpt);
local v25 = require(l_Tools_0.Smooth);
local v26 = require(l_Tools_0.Subtract);
local v27 = require(l_Tools_0.Transform);
local v28 = require(l_Parent_0.Src.Actions.ChangeTool);
local v29 = require(l_Parent_0.Src.Components.Functions.TerrainRegionEditor);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v32 = {
    [l_ToolId_0.Select] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Move] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Resize] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Rotate] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Copy] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Paste] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Delete] = if not l_TerrainEditorOverhaul_0 then v29 else nil, 
    [l_ToolId_0.Fill] = if not l_TerrainEditorOverhaul_0 then v29 else nil
};
local v33 = {
    [l_ToolId_0.Generate] = v15, 
    [l_ToolId_0.ImportLocal] = v17, 
    [l_ToolId_0.Clear] = v10, 
    [l_ToolId_0.Select] = if not l_TerrainEditorOverhaul_0 then v20 else v22, 
    [l_ToolId_0.Transform] = if not l_TerrainEditorOverhaul_0 then nil else v27, 
    [l_ToolId_0.Move] = if not l_TerrainEditorOverhaul_0 then v20 else nil, 
    [l_ToolId_0.Resize] = if not l_TerrainEditorOverhaul_0 then v20 else nil, 
    [l_ToolId_0.Rotate] = if not l_TerrainEditorOverhaul_0 then v20 else nil, 
    [l_ToolId_0.Copy] = if not l_TerrainEditorOverhaul_0 then v20 else nil, 
    [l_ToolId_0.Paste] = if not l_TerrainEditorOverhaul_0 then v20 else nil, 
    [l_ToolId_0.Material] = v18, 
    [l_ToolId_0.Delete] = v20, 
    [l_ToolId_0.Fill] = v13, 
    [l_ToolId_0.Add] = v9, 
    [l_ToolId_0.Subtract] = v26, 
    [l_ToolId_0.Draw] = v11, 
    [l_ToolId_0.Grow] = v16, 
    [l_ToolId_0.Erode] = v12, 
    [l_ToolId_0.Sculpt] = v24, 
    [l_ToolId_0.Smooth] = v25, 
    [l_ToolId_0.Flatten] = v14, 
    [l_ToolId_0.SeaLevel] = v21, 
    [l_ToolId_0.Replace] = v23, 
    [l_ToolId_0.Paint] = v19
};
local function v37(v34, v35)
    local v36 = v32[v34];
    if v36 ~= v29 then
        v29.Close();
    end;
    if not (not (v34 and v34 ~= l_ToolId_0.None) or not v36) then
        coroutine.wrap(function()
            v36.Init(v34, v35);
        end)();
    end;
end;
local v38 = v2.PureComponent:extend(script.Name);
v38.init = function(v39)
    v39.scrollingRef = v2.createRef();
    v39.layoutRef = v2.createRef();
    v39.onContentSizeChanged = function()
        local l_current_0 = v39.scrollingRef.current;
        local l_current_1 = v39.layoutRef.current;
        if not (not l_current_0 or not l_current_1) then
            l_current_0.CanvasSize = UDim2.new(0, 0, 0, l_current_1.AbsoluteContentSize.Y);
        end;
    end;
end;
v38.didMount = function(v42)
    local l_PluginActivationController_0 = v42.props.PluginActivationController;
    v42.onToolActivatedConnection = l_PluginActivationController_0:subscribeToToolActivated(function()
        if v32[v42.props.currentTool] == v29 then
            v29.Init(v42.props.currentTool, v42.props.Mouse:get());
        end;
    end);
    v42.onToolDeactivatedConnection = l_PluginActivationController_0:subscribeToToolDeactivated(function()
        if v32[v42.props.currentTool] == v29 then
            v29.Close();
        end;
    end);
end;
v38.willUnmount = function(v44)
    if v32[v44.props.currentTool] == v29 then
        v29.Close();
    end;
    if v44.onToolActivatedConnection then
        v44.onToolActivatedConnection:Disconnect();
        v44.onToolActivatedConnection = nil;
    end;
    if v44.onToolDeactivatedConnection then
        v44.onToolDeactivatedConnection:Disconnect();
        v44.onToolDeactivatedConnection = nil;
    end;
end;
v38.willUpdate = function(v45, v46, _)
    v37(v46.currentTool, v45.props.Mouse:get());
end;
v38.didUpdate = function(v48, v49, _)
    if not (v48.props.currentTool ~= l_ToolId_0.Delete and v48.props.currentTool ~= l_ToolId_0.Paste) or v48.props.currentTool == l_ToolId_0.Copy then
        v48.props.dispatchChangeTool(v49.currentTool);
    end;
end;
v38.render = function(v51)
    local v52 = v51.props.Theme:get();
    local l_currentTool_0 = v51.props.currentTool;
    local l_LayoutOrder_0 = v51.props.LayoutOrder;
    local v55 = v33[l_currentTool_0];
    local v56 = v51.props.UpperContentYSize or 0;
    local l_toolRenderTheme_0 = v52.toolRenderTheme;
    return v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, -v56), 
        CanvasSize = UDim2.new(), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        TopImage = l_toolRenderTheme_0.scrollTopImage, 
        MidImage = l_toolRenderTheme_0.scrollMidImage, 
        BottomImage = l_toolRenderTheme_0.scrollBotImage, 
        VerticalScrollBarInset = l_toolRenderTheme_0.verticalScrollBarInset, 
        BorderSizePixel = 0, 
        [v2.Ref] = v51.scrollingRef
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            [v2.Ref] = v51.layoutRef, 
            [v2.Change.AbsoluteContentSize] = v51.onContentSizeChanged, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Tool = v55 and v2.createElement(v55)
    });
end;
return v3.connect(function(v58, _)
    return {
        currentTool = v58.Tools.currentTool
    };
end, function(v60)
    return {
        dispatchChangeTool = function(v61)
            v60(v28(v61));
        end
    };
end)((l_withContext_0({
    Theme = v7.DEPRECATED_Theme, 
    Mouse = l_ContextServices_0.Mouse, 
    PluginActivationController = v4
})(v38)));
