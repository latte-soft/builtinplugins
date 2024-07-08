local l_COLLAB2850_FixMcTooltips_0 = game:GetFastFlag("COLLAB2850_FixMcTooltips");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v6.Style.Stylizer;
local v8 = require(l_Parent_0.Src.Util.CreateFitToContent);
local v9 = require(l_Parent_0.Src.Components.UserCollaboratorItem);
local v10 = require(l_Parent_0.Src.Components.GroupCollaboratorItem);
local v11 = require(l_Parent_0.Src.Selectors.GetUserCollaborators);
local v12 = require(l_Parent_0.Src.Selectors.GetGroupCollaborators);
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local v14 = v8("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    FillDirection = Enum.FillDirection.Vertical, 
    Padding = UDim.new(0, 0), 
    HorizontalAlignment = Enum.HorizontalAlignment.Center
});
local v15 = v2.PureComponent:extend("CollaboratorsWidget");
local v16 = require(l_Parent_0.Src.Util.PermissionsConstants);
v15.render = function(v17)
    local l_props_0 = v17.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Writable_0 = l_props_0.Writable;
    local l_NewUserCollaborators_0 = l_props_0.NewUserCollaborators;
    local l_CurrentUserCollaborators_0 = l_props_0.CurrentUserCollaborators;
    local l_NewGroupCollaborators_0 = l_props_0.NewGroupCollaborators;
    local l_CurrentGroupCollaborators_0 = l_props_0.CurrentGroupCollaborators;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v27 = if not l_COLLAB2850_FixMcTooltips_0 then nil else l_props_0.IsGroupGame;
    local v28 = {};
    local v29 = if not (l_OwnerType_0 == Enum.CreatorType.User) then v10 else v9;
    local v30 = l_LayoutOrderIterator_0.new();
    table.insert(v28, (v2.createElement(v29, {
        Id = l_OwnerId_0, 
        Writable = l_Writable_0, 
        LayoutOrder = v30:getNextOrder(), 
        HideSeparator = false, 
        IsGroupGame = v27
    })));
    for _, v32 in pairs(l_NewUserCollaborators_0) do
        table.insert(v28, (v2.createElement(v9, {
            LayoutOrder = v30:getNextOrder(), 
            Writable = l_Writable_0, 
            Id = v32, 
            HideSeparator = false, 
            IsGroupGame = v27
        })));
    end;
    for _, v34 in pairs(l_NewGroupCollaborators_0) do
        table.insert(v28, (v2.createElement(v10, {
            LayoutOrder = v30:getNextOrder(), 
            Writable = l_Writable_0, 
            Id = v34, 
            CurrentPermission = v16.MultipleKey, 
            HideSeparator = false, 
            IsGroupGame = v27
        })));
    end;
    for _, v36 in pairs(l_CurrentUserCollaborators_0) do
        table.insert(v28, (v2.createElement(v9, {
            LayoutOrder = v30:getNextOrder(), 
            Writable = l_Writable_0, 
            Id = v36, 
            HideSeparator = false, 
            IsGroupGame = v27
        })));
    end;
    for _, v38 in pairs(l_CurrentGroupCollaborators_0) do
        table.insert(v28, (v2.createElement(v10, {
            LayoutOrder = v30:getNextOrder(), 
            Writable = l_Writable_0, 
            Id = v38, 
            CurrentPermission = v16.MultipleKey, 
            HideSeparator = false, 
            IsGroupGame = v27
        })));
    end;
    v28[#v28].props.HideSeparator = true;
    return v2.createElement(v14, {
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1
    }, {
        v28
    });
end;
return (v3.connect(function(v39, _)
    local v41, v42 = v11(v39);
    local v43, v44 = v12(v39);
    return {
        NewUserCollaborators = v41, 
        CurrentUserCollaborators = v42, 
        NewGroupCollaborators = v43, 
        CurrentGroupCollaborators = v44, 
        OwnerId = v39.GameOwnerMetadata.creatorId, 
        OwnerType = v39.GameOwnerMetadata.creatorType
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_ContextServices_0.Localization
})(v15))));
