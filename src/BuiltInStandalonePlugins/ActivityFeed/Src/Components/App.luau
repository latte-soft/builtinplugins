local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local _ = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local v4 = require(l_Parent_0.Src.Contexts.ActivityHistoryProvider);
local v5 = require(l_Parent_0.Src.Components.ActivityHistoryMain);
local v6 = require(l_Parent_0.Src.Components.EnableTeamCreate);
local _ = require(l_Parent_0.Src.Components.StylingExamples);
local v8 = require(l_Parent_0.Src.Hooks.useCollaborators);
local v9 = require(l_Parent_0.Src.Hooks.usePlaceAndUniverseId);
return function(v10)
    local _, v12 = v9(v10.plugin);
    local v13 = v12 ~= 0;
    local function v19(v14, v15)
        local l_MultipleDocumentInterfaceInstance_0 = v10.plugin.MultipleDocumentInterfaceInstance;
        v1.useEffect(function()
            local v17 = l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(v14);
            local v18 = l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(v15);
            return function()
                v17:Disconnect();
                v18:Disconnect();
            end;
        end, {
            v14, 
            v15
        });
    end;
    local l_GuiService_0 = game:GetService("GuiService");
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    return v1.createElement(v4, {
        activityHistoryClient = v2, 
        showSaveOrPublishPlaceToRobloxFn = function()
            l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
        end, 
        useCollaborators = v8, 
        usePlaceAndUniverseId = v9, 
        useConnectToDataModelSessionEffect = v19, 
        openBrowserLink = function(v22)
            l_GuiService_0:OpenBrowserWindow(v22);
        end, 
        contextType = "real context"
    }, {
        EnableTeamCreate = not v13 and v1.createElement(v6, {}), 
        ActivityHistoryMain = v13 and v1.createElement(v5, {
            plugin = v10.plugin
        })
    });
end;
