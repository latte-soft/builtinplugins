local v0 = {
    USE_MOCK_RBF_DATA = false, 
    CLUSTER_THRESHOLD = 0.12, 
    DEFAULT_FALLOFF = 0.5, 
    MAX_FALLOFF = 20, 
    MAX_TRANSPARENCY = 100, 
    DEFAULT_LATTICE_SUBDIVISIONS = Vector3.new(1, 3, 1), 
    DEFAULT_CAGE_TRANSPARENCY = 100, 
    MANNEQUIN_PATH = "rbxasset://models/LayeredClothingEditor/mannequin.rbxm", 
    HEAD_TEMPLATE_PATH = "rbxasset://models/LayeredClothingEditor/PartHeadTemplate.rbxm", 
    PREVIEW_FOLDER_NAME = "LayeredClothingEditorPreview", 
    PREVIEW_REMOTE_EVENT_NAME = "PreviewChanged", 
    GENERATE_LEGACY_KEY = "GenerateLegacyAcc", 
    GENERATE_MESH_PART_KEY = "GenerateMeshPartAcc", 
    MOCK_HIP_OFFSET = Vector3.new(0, 4.1, 0), 
    MAX_WAYPOINTS = 20, 
    CAGE_SAVE_DATA_FOLDER = "CageSaveData", 
    LCE_POINT_TAG = "LCE_Point_Tag", 
    LCE_CONTROL_TAG = "LCE_Control_Tag", 
    DRAGGER_STATES = {
        Ready = "Ready", 
        DragSelecting = "DragSelecting"
    }, 
    TOOL_MODE = {
        None = "None", 
        Point = "PointTool", 
        Lattice = "LatticeTool", 
        Reset = "Reset", 
        Finish = "Finish"
    }, 
    EDIT_MODE = {
        Outer = Enum.CageType.Outer, 
        Inner = Enum.CageType.Inner, 
        Mesh = Enum.MeshType.FileMesh
    }, 
    SELECTOR_MODE = {
        None = "None", 
        EditingItem = "EditingItem", 
        Preview = "Preview"
    }, 
    KEY_SHORTCUTS = {
        LockControl = Enum.KeyCode.R
    }, 
    SIGNAL_KEYS = {
        SelectionChanged = "SelectionChanged", 
        ToolChanged = "ToolChanged", 
        PluginWindowFocused = "PluginWindowFocused"
    }, 
    SCREENS = {
        Select = "Select", 
        AssetType = "AssetType", 
        Edit = "Edit", 
        Generate = "Generate"
    }
};
local v1 = {
    "AdjustAccessory", 
    "EditCage", 
    "Preview", 
    "Generate"
};
local v2 = {
    "Rigid", 
    "Layered"
};
local v3 = {
    "Thumbnail", 
    "Workspace"
};
local v4 = {
    "Unedited", 
    "Edited"
};
local v5 = {
    "Unpublished", 
    "Published"
};
local function _(v6)
    local v7 = {};
    for v8, v9 in ipairs(v6) do
        v7[v9] = v8;
    end;
    return v7;
end;
local v11 = {};
for v12, v13 in ipairs(v1) do
    v11[v13] = v12;
end;
v0.ACTIONS = v11;
v0.ANALYTICS_CONSTANTS = {};
local l_ANALYTICS_CONSTANTS_0 = v0.ANALYTICS_CONSTANTS;
local v15 = {};
for v16, v17 in ipairs(v2) do
    v15[v17] = v16;
end;
l_ANALYTICS_CONSTANTS_0.FLOW = v15;
l_ANALYTICS_CONSTANTS_0 = v0.ANALYTICS_CONSTANTS;
v15 = {};
for v18, v19 in ipairs(v3) do
    v15[v19] = v18;
end;
l_ANALYTICS_CONSTANTS_0.PREVIEW_SELECT_METHOD = v15;
l_ANALYTICS_CONSTANTS_0 = v0.ANALYTICS_CONSTANTS;
v15 = {};
for v20, v21 in ipairs(v4) do
    v15[v21] = v20;
end;
l_ANALYTICS_CONSTANTS_0.CAGE_EDITING = v15;
l_ANALYTICS_CONSTANTS_0 = v0.ANALYTICS_CONSTANTS;
v15 = {};
for v22, v23 in ipairs(v5) do
    v15[v23] = v22;
end;
l_ANALYTICS_CONSTANTS_0.PUBLISHING = v15;
v0.EDIT_MODE_KEY_TO_STRING = {
    [v0.EDIT_MODE.Inner] = "Inner", 
    [v0.EDIT_MODE.Outer] = "Outer", 
    [v0.EDIT_MODE.Mesh] = "Mesh"
};
return v0;
