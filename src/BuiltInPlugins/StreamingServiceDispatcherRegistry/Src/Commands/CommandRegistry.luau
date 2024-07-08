local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Commands_0 = l_script_FirstAncestor_0.Src.Commands;
local l_DisplayRichText_0 = l_Commands_0.DisplayRichText;
local l_DisplaySuggestions_0 = l_Commands_0.DisplaySuggestions;
local l_DisplayError_0 = l_Commands_0.DisplayError;
local l_QueueRichText_0 = l_Commands_0.QueueRichText;
local l_BuilderCommands_0 = l_Commands_0.BuilderCommands;
local l_Instantiate_0 = l_BuilderCommands_0.Instantiate;
local l_InsertAsset_0 = l_BuilderCommands_0.InsertAsset;
local l_SetProperty_0 = l_BuilderCommands_0.SetProperty;
local l_CreateMaterial_0 = l_BuilderCommands_0.CreateMaterial;
local l_SetMaterial_0 = l_BuilderCommands_0.SetMaterial;
local l_RemoveInstance_0 = l_BuilderCommands_0.RemoveInstance;
local l_CloneInstance_0 = l_BuilderCommands_0.CloneInstance;
local l_DisplayRegionAdornments_0 = l_BuilderCommands_0.DisplayRegionAdornments;
local l_DebugBulkPublishToInventory_0 = l_BuilderCommands_0.DebugBulkPublishToInventory;
local l_SetDraftMode_0 = l_BuilderCommands_0.SetDraftMode;
local l_RunDraftCommand_0 = l_BuilderCommands_0.RunDraftCommand;
local l_DebugSleep_0 = l_BuilderCommands_0.DebugSleep;
local l_RunCode_0 = l_BuilderCommands_0.RunCode;
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAICodeRunner);
local v22 = {
    parallel = {
        [l_DisplayRichText_0.Name] = require(l_DisplayRichText_0), 
        [l_DisplayError_0.Name] = require(l_DisplayError_0), 
        [l_DisplayRegionAdornments_0.Name] = require(l_DisplayRegionAdornments_0), 
        InsertAssetInstant = require(l_InsertAsset_0), 
        SetPropertyInstant = require(l_SetProperty_0), 
        InstantiateInstant = require(l_Instantiate_0)
    }, 
    sequential = {
        [l_Instantiate_0.Name] = require(l_Instantiate_0), 
        [l_InsertAsset_0.Name] = require(l_InsertAsset_0), 
        [l_SetProperty_0.Name] = require(l_SetProperty_0), 
        [l_QueueRichText_0.Name] = require(l_QueueRichText_0), 
        [l_CreateMaterial_0.Name] = require(l_CreateMaterial_0), 
        [l_SetMaterial_0.Name] = require(l_SetMaterial_0), 
        [l_DebugBulkPublishToInventory_0.Name] = require(l_DebugBulkPublishToInventory_0), 
        [l_DisplaySuggestions_0.Name] = require(l_DisplaySuggestions_0), 
        [l_RemoveInstance_0.Name] = require(l_RemoveInstance_0), 
        [l_CloneInstance_0.Name] = require(l_CloneInstance_0), 
        [l_SetDraftMode_0.Name] = require(l_SetDraftMode_0), 
        [l_RunDraftCommand_0.Name] = require(l_RunDraftCommand_0), 
        [l_DebugSleep_0.Name] = require(l_DebugSleep_0)
    }
};
if v21() then
    v22.sequential[l_RunCode_0.Name] = require(l_RunCode_0);
end;
return v22;
