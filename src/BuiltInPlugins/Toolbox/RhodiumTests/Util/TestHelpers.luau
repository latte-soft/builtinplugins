local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.Rodux);
local v7 = require(l_Packages_0.ReactRoblox);
local l_ContextServices_0 = v4.ContextServices;
local l_MockPlugin_0 = v4.TestHelpers.Instances.MockPlugin;
local v10 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v11 = require(l_Parent_0.Core.Components.Asset.Asset);
local v12 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewWrapper);
local v13 = require(l_Parent_0.Core.Util.MockWrapper);
local v14 = require(l_Parent_0.TestUtils.MockItems);
local v15 = require(script.Parent.TabTestWrapper);
local v16 = require(script.Parent.ToolboxTestWrapper);
local l_Element_0 = require(l_Parent_0.Packages.Dev.Rhodium).Element;
local v18 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v46 = {
    getPathInTestToolbox = function(v20)
        return string.format("game.CoreGui.ScreenGui.%s.%s", "ToolboxComponent", v20);
    end, 
    cleanupCategoryVerification = function()
        for _, v22 in ipairs(game.CoreGui:GetChildren()) do
            if v22.Name == "CategoryVerification" then
                v22:Destroy();
            end;
        end;
    end, 
    createTestAsset = function(v23, v24, v25, v26)
        local v27 = v25 or v14.getSimpleAsset(12345);
        local l_Id_0 = v27.Asset.Id;
        return v5.mount(v5.createElement(v13, v3.Dictionary.join(v26 or {}, {
            store = v6.Store.new(v10, {
                assets = {
                    idToAssetMap = {
                        [l_Id_0] = v27
                    }
                }
            }, {
                v6.thunkMiddleware
            })
        }) or {}, {
            Asset = v5.createElement(v11, {
                assetId = l_Id_0, 
                assetData = v27, 
                LayoutOrder = 1, 
                Selected = false
            })
        }), v23 or nil, v24 or "");
    end, 
    createTestTab = function(v29, v30, _, v32)
        return v5.mount(v5.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Root = v5.createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                Position = UDim2.new(0, 0, 0, 0)
            }, {
                Components = v5.createElement(v13, v32 or {}, {
                    Tab = v5.createElement(v15, {})
                })
            })
        }), v29 or nil, v30 or "");
    end, 
    createTestToolbox = function(v33, _, _, v36)
        v33.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        return v5.mount(v5.createElement("Frame", {
            Size = UDim2.new(0.8, 0, 0.8, 0), 
            Position = UDim2.new(0, 0, 0, 0)
        }, {
            Components = v5.createElement(v13, v36 or {
                pluginGui = v33
            }, {
                Toolbox = v5.createElement(v16, {})
            })
        }), v33 or nil, "ToolboxComponent");
    end, 
    cleanupTestToolbox = function()
        for _, v38 in ipairs(game.CoreGui:GetChildren()) do
            for _, v40 in ipairs(v38:GetChildren()) do
                if v40.Name == "ToolboxComponent" then
                    v38:Destroy();
                    break;
                end;
            end;
        end;
    end, 
    createPreviewAsset = function(v41, v42, _, _)
        return v5.mount(v5.createElement(v13, {}, {
            AssetPreviewWrapper = v5.createElement(v12, {
                assetData = v14.getPreviewAsset(112312321312), 
                previewFuncs = {}
            })
        }), v41 or nil, v42 or "");
    end, 
    getDescendants = function(v45)
        return v45:GetDescendants();
    end
};
v46.getDescendant = function(v47, v48)
    local v49 = v46.getDescendants(v47);
    local v50 = nil;
    for _, v52 in pairs(v49) do
        if v52 == v48 then
            v50 = v52;
        end;
    end;
    return v50;
end;
v46.delay = function(v53)
    task.wait(v53 or 0.2);
end;
v46.clickInstanceWithXPath = function(v54)
    local v55 = l_Element_0.new(v54);
    v7.act(function()
        v55:clickWithoutValidation();
    end);
    v46.delay();
    return v55;
end;
v46.typeInstanceWithXPath = function(v56, v57)
    local v58 = l_Element_0.new(v56);
    v7.act(function()
        v58:sendText(v57);
    end);
    v46.delay();
    return v58;
end;
v46.clickInstance = function(v59)
    local v60 = l_Element_0.new(v59);
    v7.act(function()
        v60:clickWithoutValidation();
    end);
    v46.delay();
    return v60;
end;
v46.mockMouse = function(v61)
    if not v61 then
        v61 = l_MockPlugin_0.new();
    end;
    return l_ContextServices_0.Mouse.new(v61:GetMouse());
end;
if v18() then
    v46.getMockUGCBody = function()
        return l_Workspace_0.UGCTestBody:Clone();
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v46.getMockBodyWithUnknown = function()
        local v62 = l_Workspace_0.UGCTestBody:Clone();
        local l_MeshPart_0 = Instance.new("MeshPart");
        l_MeshPart_0.Name = "unknownPart";
        l_MeshPart_0.Parent = v62;
        return v62;
    end;
end;
return v46;
