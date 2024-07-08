local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useNavigateToCategory);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_TextWithLinks_0 = v2.UI.TextWithLinks;
local l_useCallback_0 = v1.useCallback;
return function(v10)
    local v11 = l_Stylizer_0:use();
    local v12 = l_Localization_0:use();
    local v13 = v5();
    return v1.createElement(l_TextWithLinks_0, {
        Text = v12:getText("SceneSuggestions", "NoResults"), 
        LinkMap = {
            ["[link1]"] = {
                LinkText = v12:getText("General", "CategoryModels"), 
                LinkCallback = l_useCallback_0(function()
                    v13(v4.FREE_MODELS.name);
                end, {
                    v13
                })
            }
        }, 
        LayoutOrder = v10.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        TextProps = {
            Font = v3.FONT, 
            TextColor = v11.itemRow.textColor, 
            TextSize = v11.itemRow.textSize
        }
    });
end;
