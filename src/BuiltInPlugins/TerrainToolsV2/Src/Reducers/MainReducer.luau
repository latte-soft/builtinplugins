local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Reducers_0 = l_Parent_0.Src.Reducers;
local v3 = require(l_Reducers_0.Tools);
local v4 = require(l_Reducers_0.AddTool);
local v5 = require(l_Reducers_0.BaseTool);
local v6 = require(l_Reducers_0.DrawTool);
local v7 = require(l_Reducers_0.ErodeTool);
local v8 = require(l_Reducers_0.FillTool);
local v9 = require(l_Reducers_0.FlattenTool);
local v10 = require(l_Reducers_0.GenerateTool);
local v11 = require(l_Reducers_0.GrowTool);
local v12 = require(l_Reducers_0.ImportLocalTool);
local v13 = require(l_Reducers_0.MaterialTool);
local v14 = require(l_Reducers_0.PaintTool);
local v15 = require(l_Reducers_0.RegionTool);
local v16 = require(l_Reducers_0.SeaLevelTool);
local v17 = require(l_Reducers_0.ReplaceTool);
local v18 = require(l_Reducers_0.SculptTool);
local v19 = require(l_Reducers_0.SmoothTool);
local v20 = require(l_Reducers_0.SubtractTool);
local v21 = {
    GenerateTool = v10, 
    ImportLocalTool = v12, 
    RegionTool = v15, 
    FillTool = v8, 
    AddTool = v4, 
    SubtractTool = v20, 
    GrowTool = v11, 
    MaterialTool = v13, 
    ErodeTool = v7, 
    SmoothTool = v19, 
    FlattenTool = v9, 
    SeaLevelTool = v16, 
    ReplaceTool = v17, 
    PaintTool = v14, 
    DrawTool = v6, 
    SculptTool = v18, 
    BaseTool = v5
};
local l_ApplyToolAction_0 = l_Parent_0.Src.Actions.ApplyToolAction;
return function(v23, v24)
    local v25 = v23 or {
        Tools = v3(v23, v24), 
        GenerateTool = v10(v23, v24), 
        ImportLocalTool = v12(v23, v24), 
        RegionTool = v15(v23, v24), 
        FillTool = v8(v23, v24), 
        MaterialTool = v13(v23, v24), 
        AddTool = v4(v23, v24), 
        SubtractTool = v20(v23, v24), 
        GrowTool = v11(v23, v24), 
        ErodeTool = v7(v23, v24), 
        SmoothTool = v19(v23, v24), 
        FlattenTool = v9(v23, v24), 
        SeaLevelTool = v16(v23, v24), 
        ReplaceTool = v17(v23, v24), 
        PaintTool = v14(v23, v24), 
        DrawTool = v6(v23, v24), 
        SculptTool = v18(v23, v24), 
        BaseTool = v5(v23, v24)
    };
    if v24.type == l_ApplyToolAction_0.Name then
        local l_toolName_0 = v24.toolName;
        return (v1.Dictionary.join(v25, {
            [l_toolName_0] = v21[l_toolName_0](v25[l_toolName_0], v24.toolAction)
        }));
    else
        return (v1.Dictionary.join(v25, {
            Tools = v3(v25.Tools, v24)
        }));
    end;
end;
