local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Components.CharacterConversion.Preview);
local v4 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Util_0 = v1.Util;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local v10 = v2.PureComponent:extend("CharacterSplitView");
v10.init = function(v11)
    v11.state = {
        selectedOriginalParts = {}, 
        selectedConvertedParts = {}
    };
    v11.mapToNames = function(v12)
        local v13 = {};
        for v14, v15 in v12, nil, nil do
            v13[v14.Name] = v15;
        end;
        return v13;
    end;
    v11.selectMatchingOriginalPart = function(v16)
        if v11.props.previewModel then
            local v17 = {};
            for v18 in v16, nil, nil do
                local v19 = v4.GetLimbForR15Part(v18.Name);
                if v19 then
                    v17[v19] = true;
                end;
            end;
            v11:setState({
                selectedOriginalParts = v17, 
                selectedConvertedParts = v11.mapToNames(v16)
            });
            return ;
        else
            return ;
        end;
    end;
    v11.selectMatchingConvertedParts = function(v20)
        if v11.props.convertedModel then
            local v21 = {};
            for v22 in v20, nil, nil do
                local v23 = v4.GetR15PartsFromBodyPart((v4.GetBodyPartR6(v22)));
                if v23 then
                    for _, v25 in v23, nil, nil do
                        v21[v25] = true;
                    end;
                end;
            end;
            v11:setState({
                selectedOriginalParts = v11.mapToNames(v20), 
                selectedConvertedParts = v21
            });
            return ;
        else
            return ;
        end;
    end;
end;
v10.render = function(v26)
    local l_state_0 = v26.state;
    local l_props_0 = v26.props;
    local l_selectedOriginalParts_0 = l_state_0.selectedOriginalParts;
    local l_selectedConvertedParts_0 = l_state_0.selectedConvertedParts;
    local l_previewModel_0 = l_props_0.previewModel;
    local l_convertedModel_0 = l_props_0.convertedModel;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v34 = l_Stylizer_0.Arrow.Size.X.Offset + l_Stylizer_0.ArrowPadding * 2;
    local v35 = l_Util_0.LayoutOrderIterator.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = l_Stylizer_0.HorizontalSpacing
    }, {
        Left = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v35:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_0.Width, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_0.VerticalSpacing
        }, {
            CharacterPreview = v2.createElement(v3, {
                Character = l_previewModel_0, 
                OnSelectionChange = v26.selectMatchingConvertedParts, 
                Selection = l_selectedOriginalParts_0
            })
        }), 
        ArrowFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v35:getNextOrder(), 
            Size = UDim2.new(0, v34, 0, 0)
        }, {
            Arrow = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Image = l_Stylizer_0.Arrow.Image, 
                ImageColor3 = l_Stylizer_0.Arrow.Color, 
                ImageRectOffset = l_Stylizer_0.Arrow.Offset, 
                ImageRectSize = l_Stylizer_0.Arrow.ImageRectSize, 
                Position = UDim2.fromScale(0.5, 0), 
                Size = l_Stylizer_0.Arrow.Size
            })
        }), 
        Right = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v35:getNextOrder(), 
            Size = UDim2.new(0, l_Stylizer_0.Width, 0, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_0.VerticalSpacing
        }, {
            CharacterPreview = v2.createElement(v3, {
                Character = l_convertedModel_0, 
                OnSelectionChange = v26.selectMatchingOriginalPart, 
                Selection = l_selectedConvertedParts_0
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
