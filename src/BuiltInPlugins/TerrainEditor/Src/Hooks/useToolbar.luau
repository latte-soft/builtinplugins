local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Controllers.ToolController);
local _ = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
return function(v6)
    local v7, v8 = l_useState_0(v6:getToolIndex());
    local v9, v10 = l_useState_0(v6:getTabIndex());
    l_useEffect_0(function()
        local v11 = v6.OnToolIndexChanged:Connect(v8);
        return function()
            v11:Disconnect();
        end;
    end, {});
    l_useEffect_0(function()
        local v12 = v6.OnTabIndexChanged:Connect(v10);
        return function()
            v12:Disconnect();
        end;
    end, {});
    return {
        Tabs = v6:getTabs(), 
        TabIndex = v9, 
        Tools = v6:getToolbar(), 
        ToolIndex = v7
    };
end;
