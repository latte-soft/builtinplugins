local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ConversationalAIAcceptanceService");
local v4 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v7)
    local l_arguments_0 = v7.arguments;
    local l_altDataId_0 = l_arguments_0.altDataId;
    local v10 = not not l_altDataId_0 and v6.altDataMap[l_altDataId_0] or nil;
    if not v10 then
        v6.StartRecordingActions(v7.requestId);
    end;
    v10 = v10 or {
        request = v7, 
        assetId = l_arguments_0.assetId, 
        altAssets = l_arguments_0.altAssets
    };
    assert(v10, "Failed to set default altData in insertAsset");
    local l_assetId_0 = v10.assetId;
    local v12 = v4.loadAssetAsync(l_assetId_0);
    if v12 then
        assert(v12, "Luau");
        if l_arguments_0.newInstanceId then
            v6.set(l_arguments_0.newInstanceId, v12);
        end;
        l_arguments_0.direct_instance = v12;
        v2:ExecuteCommandAsync(v7.requestId, "SetProperty", v7);
        v12.Parent = v4.getRequestParent(v12, v7.requestId);
        v6.EndRecordingActions(v7.requestId);
        v3:AssetInserted(v7.requestId, l_assetId_0);
        v4.modifyChatWithInstanceLink(v7.requestId, v12, "added", l_arguments_0.chatGroup or l_arguments_0.newInstanceId, v10);
        return ;
    else
        return ;
    end;
end;
