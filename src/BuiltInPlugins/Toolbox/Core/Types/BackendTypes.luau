local v0 = {
    Ascending = "Ascending", 
    Descending = "Descending", 
    None = "None"
};
v0.Default = v0.None;
local v1 = {
    AllTime = "AllTime", 
    Creator = "Creator", 
    DateCreated = "DateCreated", 
    DateModified = "DateModified", 
    Duration = "Duration", 
    Favorites = "Favorites", 
    MostTaken = "MostTaken", 
    Name = "Name", 
    Ratings = "Ratings", 
    Relevance = "Relevance", 
    Top = "Top", 
    Trending = "Trending", 
    Updated = "Updated"
};
v1.Default = v1.Relevance;
return {
    SortDirection = v0, 
    UiSortIntent = v1
};
