local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_TabId_0 = v3.TabId;
local l_ToolId_0 = v3.ToolId;
local v6 = require(l_Parent_0.Src.Components.ToolButton);
local v7 = require(l_Parent_0.Src.Actions.ChangeTool);
local v8 = v1.PureComponent:extend(script.Name);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_FFlagTerrainEditorFixToolOverlap_0 = game:GetFastFlag("FFlagTerrainEditorFixToolOverlap");
local v11 = if not l_TerrainEditorOverhaul_0 then {
    [l_TabId_0.Create] = {
        l_ToolId_0.Generate, 
        l_ToolId_0.ImportLocal, 
        l_ToolId_0.Clear
    }, 
    [l_TabId_0.Region] = {
        l_ToolId_0.Select, 
        l_ToolId_0.Move, 
        l_ToolId_0.Resize, 
        l_ToolId_0.Rotate, 
        l_ToolId_0.Copy, 
        l_ToolId_0.Paste, 
        l_ToolId_0.Delete, 
        l_ToolId_0.Fill
    }, 
    [l_TabId_0.Edit] = {
        l_ToolId_0.Add, 
        l_ToolId_0.Subtract, 
        l_ToolId_0.Grow, 
        l_ToolId_0.Erode, 
        l_ToolId_0.Smooth, 
        l_ToolId_0.Flatten, 
        l_ToolId_0.Paint, 
        l_ToolId_0.SeaLevel, 
        l_ToolId_0.Replace
    }
} else {
    [l_TabId_0.Create] = {
        l_ToolId_0.Generate, 
        l_ToolId_0.ImportLocal, 
        l_ToolId_0.Clear
    }, 
    [l_TabId_0.Edit] = {
        l_ToolId_0.Select, 
        l_ToolId_0.Transform, 
        l_ToolId_0.Material, 
        l_ToolId_0.Draw, 
        l_ToolId_0.Sculpt, 
        l_ToolId_0.Smooth, 
        l_ToolId_0.Flatten, 
        l_ToolId_0.Paint, 
        l_ToolId_0.SeaLevel
    }
};
v8.init = function(v12)
    v12.layoutRef = v1.createRef();
    v12.mainFrameRef = v1.createRef();
    v12.onContentSizeChanged = function()
        local l_current_0 = v12.mainFrameRef.current;
        local l_current_1 = v12.layoutRef.current;
        if not (not l_current_0 or not l_current_1) then
            l_current_0.Size = UDim2.new(1, 0, 0, l_current_1.AbsoluteContentSize.Y);
        end;
    end;
end;
v8.render = function(v15)
    local v16 = v15.props.CurrentTab or l_TabId_0.Create;
    local l_currentTool_0 = v15.props.currentTool;
    local l_LayoutOrder_0 = v15.props.LayoutOrder;
    local v19 = {};
    for v20, v21 in ipairs(v11[v16]) do
        v19[v21] = v1.createElement(v6, {
            ToolId = v21, 
            LayoutOrder = v20, 
            OnClick = v15.props.dispatchChangeTool, 
            IsCurrentTool = l_currentTool_0 == v21
        });
    end;
    table.insert(v19, v1.createElement("UIGridLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        CellSize = if not l_TerrainEditorOverhaul_0 then UDim2.fromOffset(55, 55) else if l_FFlagTerrainEditorFixToolOverlap_0 then UDim2.fromOffset(72, 55) else UDim2.fromOffset(64, 55), 
        CellPadding = if not l_TerrainEditorOverhaul_0 then nil else UDim2.fromOffset(3, 5), 
        [v1.Ref] = v15.layoutRef, 
        [v1.Change.AbsoluteContentSize] = v15.onContentSizeChanged
    }));
    table.insert(v19, v1.createElement("UIPadding", {
        PaddingLeft = UDim.new(0, not l_TerrainEditorOverhaul_0 and 4 or 3)
    }));
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 55), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Ref] = v15.mainFrameRef
    }, v19);
end;
return v2.connect(function(v22, _)
    return {
        currentTool = v22.Tools.currentTool
    };
end, function(v24)
    return {
        dispatchChangeTool = function(v25)
            v24(v7(v25));
        end
    };
end)(v8);
