local v0 = require(script.Parent.TutorialStep).extend("ToolboxInsert");
v0.showComplete = true;
v0.bind = function(v1)
    local l_toolboxConnection_0 = v1.tutorial.toolboxConnection;
    l_toolboxConnection_0:ensureEventExists("AssetInserted");
    v1.connection = l_toolboxConnection_0:Connect("AssetInserted", function(_)
        v1:complete();
    end);
end;
v0.unbind = function(v4)
    v4.connection:Disconnect();
end;
return v0;
