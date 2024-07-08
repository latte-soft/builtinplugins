local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Packages.LuaMeshEditingModule.Tools.PointTool);
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local l_Signals_0 = v3.Contexts.Signals;
local l_PreviewContext_0 = v3.Contexts.PreviewContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_AssetServiceWrapper_0 = v3.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v3.Contexts.StudioServiceWrapper;
local l_MannequinContext_0 = v3.Contexts.MannequinContext;
local v12 = require(l_Parent_0.Src.Resources.PluginTheme);
local v13 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v13.ContextServices;
local l_TestHelpers_0 = v13.TestHelpers;
local l_Http_0 = v13.Http;
local l_provideMockContext_0 = l_TestHelpers_0.provideMockContext;
local v18 = require(l_Parent_0.Src.Util.Constants);
local v19 = require(l_Parent_0.Src.Util.TestHelper);
local v20 = require(l_Parent_0.Src.Util.makeMockNetworkLayer);
local v21 = require(l_Parent_0.Src.Reducers.MainReducer);
local v22 = require(l_Parent_0.Src.Components.LayeredClothingEditor);
local v23 = {};
local function v39(v24, v25, v26)
    local v27 = v2.Store.new(v21, nil, {
        v2.thunkMiddleware
    });
    local v28 = l_Signals_0.new(v18.SIGNAL_KEYS);
    local v29 = l_EditingItemContext_0.new();
    local v30 = l_AssetServiceWrapper_0.mock();
    local v31 = l_StudioServiceWrapper_0.mock();
    local v32 = l_MannequinContext_0.mock();
    local v33 = v12.mock();
    local v34 = l_ContextServices_0.Localization.mock({
        libraries = {
            [v3.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v3.Resources.SourceStrings, 
                translationResourceTable = v3.Resources.LocalizedStrings
            }
        }
    });
    local v35 = v4.new();
    v35:setFalloff(v18.DEFAULT_FALLOFF);
    local v36 = v1.mount(l_provideMockContext_0({
        v33, 
        l_ContextServices_0.Analytics.mock(), 
        v34, 
        l_ContextServices_0.Store.new(v27), 
        l_ContextServices_0.API.new({
            networking = l_Http_0.Networking.mock({
                onRequest = v20
            })
        }), 
        l_ContextServices_0.Focus.new(v25), 
        v28, 
        v29, 
        l_PreviewContext_0.new(), 
        l_LuaMeshEditingModuleContext_0.new({
            [v18.TOOL_MODE.Point] = v35
        }), 
        v30, 
        v31, 
        v32
    }, v24), v25);
    local l_status_0, l_result_0 = pcall(function()
        if v26 then
            v26(v25, v27, v29);
        end;
    end);
    v1.unmount(v36);
    v25:Destroy();
    v27:destruct();
    v19.cleanTempInstances();
    if not l_status_0 then
        error(l_result_0);
    end;
end;
v23.runTestMinimal = function(v40)
    local l_status_1, l_result_1 = pcall(function()
        if v40 then
            v40();
        end;
    end);
    v19.cleanTempInstances();
    if not l_status_1 then
        error(l_result_1);
    end;
end;
v23.runComponentTest = function(v43, v44)
    v39({
        test = v43
    }, Instance.new("ScreenGui"), v44);
end;
local function _()
    local v45 = Instance.new("ScreenGui", game.CoreGui);
    v45.Name = "PluginMockGui";
    v45.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    return v45;
end;
v23.runRhodiumTest = function(v47)
    local l_v39_0 = v39;
    local v49 = {
        LayeredClothingEditor = v1.createElement(v22)
    };
    local v50 = Instance.new("ScreenGui", game.CoreGui);
    v50.Name = "PluginMockGui";
    v50.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_v39_0(v49, v50, v47);
end;
return v23;
