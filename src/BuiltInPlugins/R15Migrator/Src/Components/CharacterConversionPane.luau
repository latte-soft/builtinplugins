local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v8 = require(l_Components_0.CharacterConversion.Footer);
local v9 = require(l_Components_0.CharacterConversion.MainView);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.LoadCharacterMetadata);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v12 = v2.PureComponent:extend("CharacterConversionPane");
v12.hasCharacters = function(v13)
    local v14 = false;
    if v13.props.characterMetadataLoadedVersion > 0 then
        v14 = true;
        if next(v13.props.characters) == nil then
            v14 = next(v13.props.convertedCharacters) ~= nil;
        end;
    end;
    return v14;
end;
v12.didMount = function(v15)
    if v15.props.characterMetadataLoadedVersion == 0 then
        v15.props.loadCharacterMetadata(v15.props.Analytics);
    end;
end;
v12.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v20 = l_LayoutOrderIterator_0.new();
    if v16:hasCharacters() then
        return v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            MainView = v2.createElement(v9, {
                OnResetPlugin = l_props_0.OnResetPlugin, 
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.new(1, 0, 1, -l_Stylizer_0.FooterHeight)
            }), 
            Footer = v2.createElement(v8, {
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.FooterHeight)
            })
        });
    else
        return v2.createElement(l_Pane_0, {}, {
            Label = v2.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("CharacterConversion", "NoCharacters")
            })
        });
    end;
end;
return v3.connect(function(v21, _)
    return {
        characterMetadataLoadedVersion = v21.CharacterConversion.characterMetadataLoadedVersion, 
        characters = v21.CharacterConversion.characters, 
        convertedCharacters = v21.CharacterConversion.convertedCharacters
    };
end, function(v23)
    return {
        loadCharacterMetadata = function(v24)
            v23(v10(v24));
        end
    };
end)((v1.ContextServices.withContext({
    Analytics = v1.ContextServices.Analytics, 
    Stylizer = v1.ContextServices.Stylizer, 
    Localization = v1.ContextServices.Localization
})(v12)));
