local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Dash);
local v4 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v5 = require(l_Parent_0.Core.Util.FiatUtil);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
itemsDetailsToCreationsDistributionStatus = function(v7)
    if not v7.fiatProduct then
        if not v7.product then
            return v4.ASSET_STATUS.OffSale;
        elseif not v7.product.isForSaleOrIsPublicDomain then
            return v4.ASSET_STATUS.OffSale;
        elseif typeof(v7.product.price) == "number" and v7.product.price > 0 then
            return v4.ASSET_STATUS.OnSale;
        else
            return v4.ASSET_STATUS.Free;
        end;
    else
        local l_purchasable_0 = v7.fiatProduct.purchasable;
        local l_purchasePrice_0 = v7.fiatProduct.purchasePrice;
        if l_purchasable_0 and l_purchasePrice_0 then
            if not v5.isFree(l_purchasePrice_0) then
                return v4.ASSET_STATUS.OnSale;
            else
                return v4.ASSET_STATUS.Free;
            end;
        else
            return v4.ASSET_STATUS.OffSale;
        end;
    end;
end;
local v10 = {
    new = function()
        return {};
    end
};
v10.fromItemDetailsRequest = function(v11)
    local v12 = v10.new();
    if v11.asset then
        v12.Asset = {
            Id = v11.asset.id, 
            Name = v11.asset.name, 
            TypeId = v11.asset.typeId, 
            AssetGenres = v11.asset.assetGenres, 
            AssetSubTypes = v11.asset.assetSubTypes, 
            IsEndorsed = v11.asset.isEndorsed, 
            Description = v11.asset.description, 
            Duration = v11.asset.duration, 
            Created = v11.asset.createdUtc, 
            Updated = v11.asset.updatedUtc, 
            HasScripts = v11.asset.hasScripts, 
            CreatingUniverseId = v11.asset.creatingUniverseId, 
            Status = itemsDetailsToCreationsDistributionStatus(v11)
        };
        if v11.asset.audioDetails then
            v12.AudioDetails = {
                Type = v11.asset.audioDetails.audioType, 
                Artist = v11.asset.audioDetails.artist, 
                MusicAlbum = v11.asset.audioDetails.musicAlbum, 
                MusicGenre = v11.asset.audioDetails.musicGenre, 
                SoundEffectCategory = v11.asset.audioDetails.soundEffectCategory, 
                SoundEffectSubcategory = v11.asset.audioDetails.soundEffectSubcategory
            };
        end;
    end;
    if v11.creator then
        v12.Creator = {
            Id = v11.creator.id, 
            Name = v11.creator.name, 
            Type = v11.creator.type, 
            IsVerifiedCreator = v11.creator.isVerifiedCreator
        };
    end;
    if v11.product then
        v12.Product = {
            ProductId = v11.product.productId, 
            Price = v11.product.price
        };
    end;
    if v11.fiatProduct then
        v12.FiatProduct = {
            PurchasePrice = v11.fiatProduct.purchasePrice, 
            Purchasable = v11.fiatProduct.purchasable
        };
    end;
    if v11.thumbnail then
        v12.Thumbnail = {
            Final = v11.thumbnail.final, 
            Url = v11.thumbnail.url, 
            RetryUrl = v11.thumbnail.retryUrl, 
            UserId = v11.thumbnail.userId, 
            EndpointType = v11.thumbnail.endpointType
        };
    end;
    if v11.voting then
        v12.Voting = {
            ShowVotes = v11.voting.showVotes, 
            UpVotes = v11.voting.upVotes, 
            DownVotes = v11.voting.downVotes, 
            VoteCount = v11.voting.voteCount, 
            UpVotePercent = v11.voting.upVotePercent, 
            CanVote = v11.voting.canVote, 
            UserVote = v11.voting.userVote, 
            HasVoted = v11.voting.hasVoted, 
            ReasonForNotVoteable = v11.voting.reasonForNotVoteable
        };
    end;
    return v12;
end;
v10.AddContextToItemDetails = function(v13, v14)
    v13.Context = v3.join(v13.Context, v14);
    return v13;
end;
v10.fromCreationsDetails = function(v15, v16, v17, v18)
    local v19 = v10.new();
    v19.Asset = {
        Description = v15.description, 
        Id = v15.assetId, 
        Name = v15.name, 
        TypeId = v16 and v16.Value, 
        AssetGenres = {}, 
        Status = v15.status
    };
    v19.Creator = {
        Id = v15.creatorTargetId, 
        Name = v17, 
        Type = v18
    };
    return v19;
end;
return v10;
