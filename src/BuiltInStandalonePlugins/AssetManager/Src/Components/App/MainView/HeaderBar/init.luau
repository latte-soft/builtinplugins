local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(script.HeaderOptions);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v10 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v11 = require(l_script_FirstAncestor_0.Src.Networking);
local l_useState_0 = v1.useState;
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerState);
local _ = require(l_script_FirstAncestor_0.Src.Util.Images);
return function(v15)
    local v16 = l_LayoutOrderIterator_0.new();
    local v17 = v11.use();
    local v18 = v10.use();
    local v19 = v9.use();
    local v20, v21 = l_useState_0("");
    local l_Selection_0 = v13(v18, v19).Selection;
    local function v24(v23)
        if v20 ~= v23 then
            v21(v23);
        end;
    end;
    if not (v20 ~= "") or v20 ~= v17:getThumbnailUriForScope(l_Selection_0) then
        v17:getThumbnailForScopeAsync(l_Selection_0, v24);
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v15.LayoutOrder, 
        [v1.Tag] = "TopBar HeaderBar X-Left X-Row X-Stroke"
    }, {
        ScopeTitleContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = v16:getNextOrder(), 
            [v1.Tag] = "HeaderTitle X-Row X-Pad X-Left X-Middle"
        }, {
            ScopeThumbnail = v1.createElement(l_Image_0, {
                LayoutOrder = v16:getNextOrder(), 
                Image = v20, 
                [v1.Tag] = "ScopeThumbnail X-PadM"
            }), 
            ScopeTitle = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v16:getNextOrder(), 
                Text = l_Selection_0.Name, 
                [v1.Tag] = "Title X-Fit X-PadS"
            })
        }), 
        Options = v1.createElement(v8, {
            LayoutOrder = v16:getNextOrder()
        })
    });
end;
