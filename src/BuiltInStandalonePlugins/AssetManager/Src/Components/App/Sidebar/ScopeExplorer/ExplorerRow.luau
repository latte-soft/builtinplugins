local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useExplorerState);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Images);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v13)
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = v8.use();
    local v16 = v7.use();
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v13.Index, 
        Position = v13.Position, 
        OnPress = function()
            v16:setSelection(v13.Item);
        end, 
        [v1.Tag] = ("Element X-Corner X-PadS X-Row X-Left X-Middle %*"):format(v9(v15, v16).Selection.Id == v13.Item.Id and "Paper" or "")
    }, {
        Thumbnail = v1.createElement(l_Image_0, {
            LayoutOrder = v14:getNextOrder(), 
            Image = if v13.Item.Scope == v11.Scope.Group then v10.ICON_GROUP_DEFAULT else v10.ICON_USER_DEFAULT, 
            [v1.Tag] = "ScopeIcon Icon16 X-PadM"
        }), 
        Name = v1.createElement(l_TextLabel_0, {
            LayoutOrder = v14:getNextOrder(), 
            Text = v13.Item.Name, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            [v1.Tag] = "Left X-PadS"
        })
    });
end;
