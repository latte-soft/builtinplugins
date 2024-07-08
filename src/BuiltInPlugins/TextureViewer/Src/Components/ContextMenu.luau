local v0 = {};
local l_StudioService_0 = game:GetService("StudioService");
local l_Selection_0 = game:GetService("Selection");
local l_showContextMenu_0 = require(script.Parent.Parent.Parent.Packages.Framework).UI.showContextMenu;
v0.showRightClickMenu = function(v4, v5, v6, v7, v8)
    l_showContextMenu_0(v5, {
        Copy = {
            Text = v6:getText("ContextMenu", "Copy"), 
            Icon = "rbxasset://textures/TextureViewer/copy.png", 
            OnItemClicked = function()
                l_StudioService_0:CopyToClipboard(v4:filterRowsBySearchTerm()[v7].Texture);
            end
        }, 
        Select = {
            Text = v6:getText("ContextMenu", "Select"), 
            Icon = "rbxasset://textures/TextureViewer/select.png", 
            OnItemClicked = function()
                l_Selection_0:Set(v8);
            end
        }, 
        Replace = {
            Text = v6:getText("ContextMenu", "Replace"), 
            Icon = "rbxasset://textures/TextureViewer/replace.png", 
            OnItemClicked = function()
                v4:setState({
                    editingCell = v7
                });
            end
        }
    }, {
        "Copy", 
        "Select", 
        "Replace"
    });
end;
return v0;
