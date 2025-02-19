--[[
ItemManager = {
	['AddOnEquipBuff'] = function (...) end;
	['GetItem'] = function (...) end;
	['GetItemName'] = function (...) end;
	['GetItemOwner'] = function (...) end;
	['GetItemUIName'] = function (...) end;
	['IsItemOversized'] = function (...) end;
	['RemoveItem'] = function (...) end;
};
ItemSystem = {
	['GetPackItemByIndex'] = function (...) end;
	['GetPackNumItems'] = function (...) end;
	['GetPackPrimaryItem'] = function (...) end;
	['GiveItem'] = function (...) end;
	['GiveItemPack'] = function (...) end;
	['Reset'] = function (...) end;
	['SerializePlayerLTLInfo'] = function (...) end;
	['SetActorItem'] = function (...) end;
	['SetActorItemByName'] = function (...) end;
};
ItemUtils = {
	['AddMoneyToInventory'] = function (...) end;
	['CheckMoneyAmount'] = function (...) end;
	['CreateInvItem'] = function (...) end;
	['DeliverItemByPlayer'] = function (...) end;
	['GiveItem'] = function (...) end;
	['GiveItemToPlayer'] = function (...) end;
	['HasItem'] = function (...) end;
	['IsItemInInventory'] = function (...) end;
	['IsNullWeaponGuid'] = function (...) end;
	['MoneyTransaction'] = function (...) end;
	['RemoveInvItem'] = function (...) end;
	['RemoveMoneyFromInventory'] = function (...) end;
};
]]

-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_lockpick_id = "8d76f58e-a521-4205-a7e8-9ac077eee5f0"
Cheat.g_bread_id = "86e4ff24-88db-4024-abe6-46545fa0fbd1"
Cheat.g_cheesecake = "2a2ac072-a7eb-42f5-8757-776c02647559"
Cheat.g_bow1_id = "5c23394a-3300-4570-a8b7-ef1c11519047"
Cheat.g_bow2_id = "94de53e1-8874-4a64-9837-ae758cb62e8b"
Cheat.g_dagger1_id = "3a640e5d-d8bd-4e8b-b61d-8cd5180e79e7"
Cheat.g_shield1_id = "fd65fbb0-115b-4b63-a410-c235a69860a1"
Cheat.g_long_ranged_arrow_id = "d5e6764d-18ba-44cb-8dd0-6640a17785a8"
Cheat.g_enhanced_long_range_arrow_id = "7db6b854-e307-4a47-ba39-943190b2469e"
--Cheat.g_quest_item_1_id = "b862b26e-0ec4-4932-89ca-e99c05c970e1" -- haven't found addable quest item yet on my playthrough
Cheat.g_blocked_item_1_id = "2cf06381-7692-4f3c-b917-e98dd3b5f8e3"
Cheat.g_quality1_item_1_id = "d284732b-32d1-40e6-be9b-0c89e18f969f"
Cheat.g_quality2_item_1_id = "0a218fa9-58c7-4696-b5a3-7954e639dd9e"
Cheat.g_quality3_item_1_id = "eda316a4-59d9-49ae-b67b-f6837789bd0c"
Cheat.g_quality4_item_1_id = "9e31a288-7de0-4c0d-81cd-5cf00548d2d5"

Cheat.g_item_database = {}
Cheat.g_item_database_search_fields = { "id", "lname", "name" }
Cheat.g_item_database_skip_tags = { Image = true, DocumentContent = true, Phase = true, ItemClasses = true, NPCTool = true, database = true }
Cheat.g_item_database_errors = 0
Cheat.g_item_database_aliases = {}
Cheat.g_item_lookup = {}

Cheat.g_item_category_map = {
    MiscItem = 0,      --keys,flowers,skull,etc
    MeleeWeapon = 1,
    MissileWeapon = 2, --bow/crossbow
    Ammo = 3,
    Armor = 4,
    Food = 5,
    Money = 6,
    DiceBadge = 7,
    Document = 8,
    CraftingMaterial = 9,
    Herb = 10,
    AlchemyBase = 11,
    NPCTool = 12,
    Ointment = 13,
    Poison = 14,
    Die = 15,
    Helmet = 16,
    Key = 17,
    KeyRing = 18,
    QuickSlotContainer = 19, --maxquality=1 but condition can be controlled with addItem
    PickableItem = 22,       -- 8 items in db, broken ball/pellet, addItem doesn't work on them
    Hood = 29,
    ItemAlias = 99
}

Cheat.g_player_data_m = "userdata: 050000000000024E" --male?
Cheat.g_player_data_f = "userdata: 050000000000024E" --female? don't know if you can play as a woman in KCD2 yet

Cheat.g_removestolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27, 29)
Cheat.g_ownstolen_cat_ids = Cheat:createLookupTable(0, 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15, 16, 27, 29)
Cheat.g_repairall_cat_ids = Cheat:createLookupTable(
    Cheat.g_item_category_map.Armor,
    Cheat.g_item_category_map.Helmet,
    Cheat.g_item_category_map.Hood,
    Cheat.g_item_category_map.MeleeWeapon,
    Cheat.g_item_category_map.MissileWeapon
)
Cheat.g_damageall_cat_ids = Cheat.g_repairall_cat_ids -- probably just keep these the same?

Cheat.g_user_items = nil

--[[
    -- Max Quality 1
    maxquality=1 name=common longsword id=d284732b-32d1-40e6-be9b-0c89e18f969f
    0.0 (0%) - 1.0 (100%)  (

    -- Max Quality 2
    maxquality=2 UIName="ui_nm_handwrap" id=0a218fa9-58c7-4696-b5a3-7954e639dd9e
    0.00000000       - 1/3 + 0.00000001 (100%) == Q1  (1/3)
    1/3 + 0.00000002 -           1.0000 (100%) == Q2  (3/3)


    #Cheat:removeAllItems(); player.inventory:CreateItem("0a218fa9-58c7-4696-b5a3-7954e639dd9e", 1/3, 1)

    -- Max Quality 3
    maxquality=3 name="TorsoPainter_m01" id=eda316a4-59d9-49ae-b67b-f6837789bd0c
    0.00000000 - 0.16666667 (100%) == Q1  (1/6)
    0.16666668 - 0.50000002 (100%) == Q2  (3/6)
    0.50000003 - 1.00000000 (100%) == Q3  (6/6)

    -- Max Quality 4
    maxquality=4 name=common longsword id=9e31a288-7de0-4c0d-81cd-5cf00548d2d5
    0.00000000 - 0.10000000 == Q1  (1/10)
    0.10000001 - 0.30000002 == Q2  (3/10)
    0.30000003 - 0.59812502 == Q3  (6/10)
    0.59812503 - 1.00000000 == Q4  (10/10)

    #Cheat:removeAllItems(); player.inventory:CreateItem("b867dd0e-1bfe-40e9-b114-4b126a3ff1b0", .9, 1)
]]
Cheat.g_item_health_quality_ranges = {}
Cheat.g_item_health_quality_ranges[1] = {
    { min = 0.0, max = 1.0 }
}
Cheat.g_item_health_quality_ranges[2] = {
    { min = 0.0,                  max = (1 / 3) + 0.00000001 },
    { min = (1 / 3) + 0.00000002, max = 1.0 }
}
Cheat.g_item_health_quality_ranges[3] = {
    { min = 0.0,                  max = 1 / 6 },
    { min = (1 / 6) + 0.00000001, max = 3 / 6 },
    { min = (3 / 6) + 0.00000001, max = 6 / 6 },
}
Cheat.g_item_health_quality_ranges[4] = {
    { min = 0.0,                   max = 1 / 10 },
    { min = (1 / 10) + 0.00000001, max = 3 / 10 },
    { min = (3 / 10) + 0.00000001, max = 6 / 10 },
    { min = (6 / 10) + 0.00000001, max = 10 / 10 },
}

function Cheat:initItemDatabase()
    local p_func = function (tag, attributes)
        if not Cheat.g_item_database_skip_tags[tag] then
            if tag and attributes and attributes["Id"] and attributes["Name"] then
                -- Xml DB uses init caps, lowercase all the keys
                local item = Cheat:lowercaseTableKeys(attributes)

                -- ensure we haven't loaded this iteam already
                if not Cheat.g_item_lookup[item.id] then
                    local category_id = Cheat.g_item_category_map[tag]
                    if category_id then
                        item["category_name"] = tag
                        item["category_id"] = category_id
                        table.insert(Cheat.g_item_database, item)
                        --Cheat:logDebug("Adding item: %s:: %s", tag, Cheat:serializeTable(item))
                        Cheat.g_item_lookup[item.id] = item
                        return true
                    else
                        Cheat:logError("Item id [%s] has no category_id for [%s]", item.id, tag)
                        Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
                    end
                else
                    Cheat:logError("Item id [%s] is duplicated.", item.id)
                    Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
                end
            else
                Cheat:logError("Skipping item: %s:: %s", tag, Cheat:serializeTable(attributes))
                Cheat.g_item_database_errors = Cheat.g_item_database_errors + 1
            end
        end
        return false
    end

    -- seems like there are bunch of items in different xml files now ...
    Cheat:xmlLoadDatabase("libs/tables/item/item.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__system.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__rewards.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__horse.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__aux.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__alchemy.xml", p_func)
    --Cheat:xmlLoadDatabase("libs/tables/item/item__autotests.xml", p_func)
    --Cheat:xmlLoadDatabase("libs/tables/item/item__test.xml", p_func)
    Cheat:xmlLoadDatabase("libs/tables/item/item__unique.xml", p_func)

    for _, item in pairs(Cheat.g_item_database) do
        -- Resolve ItemAlias to real items
        --[[
            <ItemAlias SourceItemId="c164f346-0463-4116-b790-094b11274e5e" IconId="huntingSwordBasic"
                UIInfo="ui_in_huntingswordBasic" Weight="0" IsQuestItem="false" Id="b867dd0e-1bfe-40e9-b114-4b126a3ff1b0"
                UIName="ui_nm_huntingSwordBasic"
                Name="alias_zachrana_huntingSword" />

            <MeleeWeapon Attack="83" AttackModStab="0.7" AttackModSlash="0.8" AttackModSmash="0.3" SharpeningAnimSuffix="huntingsw_basic" Class="16"
                Defense="80" MaxStatus="53" StrReq="4" AgiReq="6" IsBreakable="true" BrokenItemClassId="7d830ff0-3632-42d6-83ee-f2dee122c998"
                Visibility="1" Conspicuousness="1" Charisma="5" SocialClassId="0" WealthLevel="0" MaxQuality="4" Clothing="Scabbard_HuntingSword_m01"
                IconId="huntingSwordBasic" UIInfo="ui_in_huntingswordBasic" Model="manmade/weapons/hunting_swords/hunting_sword_basic.cgf" Weight="2.9"
                Price="822" FadeCoef="1" VisibilityCoef="2.91547585" Id="c164f346-0463-4116-b790-094b11274e5e" Name="huntingSwordBasic"
                UIName="ui_nm_huntingSwordBasic" />
        ]]
        if item.category_id == Cheat.g_item_category_map.ItemAlias then
            local realItem = Cheat.g_item_lookup[item.sourceitemid] -- find real item
            if realItem then
                -- copy all keys from realItem to item alias table if the key doesn't exist on the alias
                for k, v in pairs(realItem) do
                    if not item[k] then
                        item[k] = v
                    end
                end

                -- change the alias item to the item category of the realItem
                -- this allows function that operate on item category to work with an alias item
                item.category_name = realItem.category_name
                item.category_id = realItem.category_id
                item["wasAlias"] = true
            end
        end

        -- fix max quality
        item.maxquality = tonumber(item.maxquality) or 1

        -- fix isquestitem
        if not item.isquestitem then
            item.isquestitem = false
        else
            item.isquestitem = item.isquestitem == "true"
        end

        -- localize item database
        item["lname"] = Cheat:getLocalizedItemName(item)
    end

    if Cheat.g_item_database_errors == 0 then
        Cheat:logDebug("Done loading XML item databases.")
    else
        Cheat:logError("Found [%d] errors while loading item XML databases.", Cheat.g_item_database_errors)
    end
end

---Converts condition to health.
---@param condition number
---@param quality integer
---@param maxquality integer
---@return number|nil
function Cheat:conditionToHealth(condition, quality, maxquality)
    if not condition or not quality or not maxquality then
        Cheat:logError("conditionToHealth: invalid args condition [%s] quality [%s] maxquality [%s]", tostring(condition), tostring(quality), tostring(maxquality))
        return nil
    end

    if not Cheat.g_item_health_quality_ranges[maxquality] then
        Cheat:logError("conditionToHealth: invalid maxquality [%s]", tostring(maxquality))
        return nil
    end

    if not Cheat.g_item_health_quality_ranges[maxquality][quality] then
        Cheat:logError("conditionToHealth: invalid quality [%s] for maxquality [%s]", tostring(quality), tostring(maxquality))
        return nil
    end

    local qualityMinHealth = Cheat.g_item_health_quality_ranges[maxquality][quality].min
    local qualityMaxHealth = Cheat.g_item_health_quality_ranges[maxquality][quality].max

    condition = Cheat:clamp(condition, 0, 100)
    quality = Cheat:clamp(quality, 1, maxquality)

    -- lerp condition range 0-100 into the quality range min-max
    return qualityMinHealth + (qualityMaxHealth - qualityMinHealth) * (condition / 100)
end

---Converts health to condition.
---@param health number 0.0 - 1.0
---@param maxquality integer 1 - 4
---@return integer|nil condition 0-100
---@return integer|nil quality 1-4
function Cheat:healthToCondition(health, maxquality)
    if not health or not maxquality then
        Cheat:logError("healthToCondition: invalid args health [%s] maxquality [%s]", tostring(health), tostring(maxquality))
        return nil, nil
    end

    if not Cheat.g_item_health_quality_ranges[maxquality] then
        Cheat:logError("healthToCondition: invalid maxquality [%s]", tostring(maxquality))
        return nil, nil
    end

    for quality_index, quality_range in ipairs(Cheat.g_item_health_quality_ranges[maxquality]) do
        local qualityMinHealth = quality_range.min
        local qualityMaxHealth = quality_range.max

        if qualityMinHealth <= health and health <= qualityMaxHealth then
            --print(qualityMinHealth .. " <= " .. health .. " <= " .. qualityMaxHealth)
            if qualityMaxHealth - qualityMinHealth == 0 then
                Cheat:logError("healthToCondition: division by zero")
                return 0, quality_index -- Avoid division by zero if range is degenerate, should not happen in this setup, but for robustness
            end
            local condition = (100 * (health - qualityMinHealth)) / (qualityMaxHealth - qualityMinHealth)
            --- TBD: might need to round condition instead of truncate
            condition = Cheat:truncate(condition)
            return Cheat:clamp(condition, 0, 100), quality_index
        end
    end

    Cheat:logError("healthToCondition: failed to perform conversion.")
    return nil, nil
end

---hasItem
---@param itemId string
---@return boolean
function Cheat:hasItem(itemId)
    return player.inventory:GetCountOfClass(itemId) > 0
end

---getItemCount
---@param itemId string
---@return number
function Cheat:getItemCount(itemId)
    return player.inventory:GetCountOfClass(itemId)
end

---getInventoryItemCount
---@return number
function Cheat:getInventoryItemCount()
    -- this isn't accurate, GetInventoryTable() probably isn't an array
    -- #player.inventory:GetInventoryTable()
    local count = 0
    for _, v in pairs(player.inventory:GetInventoryTable()) do
        count = count + 1
    end
    return count
end

---Gets item from lookup table by ID
---@param itemId string Item ID
---@return table|nil item
function Cheat:getItem(itemId)
    return Cheat.g_item_lookup[itemId]
end

---addItemByName
---@param itemName string exact item name (full name or id)
---@param amount integer
---@param condition integer
---@param quality integer|nil
---@param quest boolean
---@param notify boolean
---@param logSuccess boolean
---@return boolean
function Cheat:addItemByName(itemName, amount, condition, quality, quest, notify, logSuccess)
    return Cheat:addItem({ exact = true, searchKey = itemName }, amount, condition, quality, quest, notify, logSuccess)
end

---addItem
---@param searchOperation table
---@param amount integer
---@param condition integer
---@param quality integer|nil use nil to default item maxquality
---@param quest boolean
---@param notify boolean
---@param logSuccess boolean
---@return boolean
function Cheat:addItem(searchOperation, amount, condition, quality, quest, notify, logSuccess)
    -- note that some items don't have condition (like lockpicks)
    -- some quest item cannot be added while others can
    -- currently can't add quality 4 items, it you call player.inventory:CreateItem with 1.0 health it gets capped at qual3 max

    local item = Cheat:findItem(searchOperation)
    if not item then
        Cheat:logError("Item [%s] not found.", Cheat:serializeTable(searchOperation))
        return false
    end

    if not quest and item.isquestitem then
        Cheat:logWarn("Won't add quest item: %s", Cheat:getItemDisplayText(item))
        return false
    end

    if item.isquestitem and not Cheat:canCreateItem(item.id) then
        Cheat:logWarn("Won't add blocked item: %s", Cheat:getItemDisplayText(item))
        return false
    end

    if quality and quality > 3 then
        Cheat:logWarn("Not possible to create items with quality greater than 3.")
    end

    if not quality then
        quality = item.maxquality
    end

    if quality == 4 then
        quality = 3
    end

    amount = Cheat:max(amount or 1, 1)
    local health = Cheat:conditionToHealth(condition, quality, item.maxquality)
    local startingAmount = Cheat:getItemCount(item.id)
    local endingAmount = startingAmount + amount

    while true do
        -- some items seem like they can only be added 1 at a time?
        -- Cheat:logDebug("player.inventory:CreateItem(%s, %f, %d)", item.id, health, amount)
        if not player.inventory:CreateItem(item.id, health, amount) then
            -- quest items that fail to be added will exit here
            Cheat:logError("Failed: name=%s amout=%s/%s cond=%s qual=%s/%s quest=%s id=%s",
                Cheat:getLocalizedItemName(item) or "nil",
                tostring(Cheat:getItemCount(item.id) - startingAmount),
                tostring(endingAmount - startingAmount),
                tostring(condition),
                tostring(quality),
                tostring(item.maxquality),
                tostring(item.isquestitem),
                tostring(item.id))
            return false
        end

        local currentAmount = Cheat:getItemCount(item.id)
        if currentAmount == endingAmount then
            break
        else
            amount = endingAmount - currentAmount
        end
    end

    local amountAdded = endingAmount - startingAmount

    if notify then
        Game.ShowItemsTransfer(item.id, amountAdded)
    end

    if logSuccess then
        Cheat:logInfo("Added: name=%s amout=%s cond=%s qual=%s/%s quest=%s id=%s",
            Cheat:getLocalizedItemName(item) or "nil",
            tostring(amountAdded),
            tostring(condition),
            tostring(quality),
            tostring(item.maxquality),
            tostring(item.isquestitem),
            tostring(item.id)
        )
    end

    return true
end

---removeItemById
---@param itemId string
---@param amount number
---@param quest boolean
---@param notify boolean
---@param logSuccess boolean
---@return boolean
function Cheat:removeItemById(itemId, amount, quest, notify, logSuccess)
    return Cheat:removeItem({ exact = true, searchKey = itemId }, amount, quest, notify, logSuccess)
end

---removeItem
---@param searchOperation table
---@param amount number
---@param quest boolean
---@param notify boolean
---@param logSuccess boolean
---@return boolean
function Cheat:removeItem(searchOperation, amount, quest, notify, logSuccess)
    local item = Cheat:findItem(searchOperation)
    if not item then
        Cheat:logError("No item matching [%s] found in item database.", Cheat:serializeTable(searchOperation))
        return false
    end

    local itemCount = Cheat:getItemCount(item.id)
    if itemCount == 0 then
        Cheat:logError("Item [%s] not found in player's inventory.", tostring(item.name))
        return false
    end

    if not quest and item.isquestitem then
        Cheat:logWarn("Won't remove quest item: %s", Cheat:getItemDisplayText(item))
        return false
    end

    local amountToRemove = Cheat:clamp(amount, 1, itemCount)
    local amountRemoved = player.inventory:DeleteItemOfClass(item.id, amountToRemove)

    if amountRemoved == 0 then
        Cheat:logError("Failed to removed item [%s].", tostring(item.name))
        return false
    end

    if notify then
        Game.ShowItemsTransfer(item.id, -amountRemoved)
    end

    if logSuccess then
        Cheat:logInfo("Removed [%s] of item [%s] from player's inventory.", tostring(amountRemoved), tostring(item.name))
    end

    return true
end

---removeAllItems
function Cheat:removeAllItems()
    player.inventory:RemoveAllItems()
end

---removeAllItem
---@param id string Item ID
---@param notify boolean
---@return number amount_removed total item instances removed
function Cheat:removeAllItem(id, notify)
    local amount = Cheat:getItemCount(id)
    local amount_removed = player.inventory:DeleteItemOfClass(id, amount)
    if notify then
        Game.ShowItemsTransfer(id, -amount_removed)
    end
    return amount_removed
end

---findItems
---@param searchOperation table|nil
---@return table items
function Cheat:findItems(searchOperation)
    if searchOperation then
        return Cheat:findRows(Cheat.g_item_database, searchOperation, Cheat.g_item_database_search_fields)
    else
        return Cheat.g_item_database
    end
end

---findItem
---@param searchOperation table
---@return table|nil item
function Cheat:findItem(searchOperation)
    -- if the searchKey is an item ID (UUID) we can skip the DB scan
    local item = Cheat:getItem(searchOperation.searchKey)
    if not item then
        item = Cheat:findRow(Cheat.g_item_database, searchOperation, Cheat.g_item_database_search_fields)
    end
    return item
end

---getUserItem
---@param itemId string Item ID
---@param amount integer|nil amount to match on
---@param condition integer|nil condition to match on
---@return table|nil
function Cheat:getUserItem(itemId, amount, condition)
    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        local item = Cheat:buildUserItem(userdata)
        if item and item.id == itemId then
            local matches = true

            if amount and item.amount ~= amount then
                matches = false
            end

            if condition and item.condition ~= condition then
                matches = false
            end

            if matches then
                return item
            end
        end
    end
    return nil
end

---getUserItems
---@return table userItems array of user items
---@return integer totalItems total items in player inventory
---@return integer backedupItems total items copied to the userItems array
function Cheat:getUserItems()
    local items = {}
    local totalItems = 0;
    local backedupItems = 0
    for _, userdata in pairs(player.inventory:GetInventoryTable()) do
        totalItems = totalItems + 1
        local item = Cheat:buildUserItem(userdata)
        if item then
            table.insert(items, item)
            backedupItems = backedupItems + 1
        else
            Cheat:logError("Failed to convert user item: %s", Cheat:serializeTable(userdata))
        end
    end
    return items, totalItems, backedupItems
end

---buildUserItem
---@param userdata any
---@return table|nil
function Cheat:buildUserItem(userdata)
    local itemInstance = ItemManager.GetItem(userdata)
    if not itemInstance then
        return nil
    end

    local itemInstanceId = itemInstance.id -- same as userdata param
    local itemId = itemInstance.class
    --Cheat:logDebug("==================")
    --Cheat:logDebug("itemInstance: %s", Cheat:serializeTable(itemInstance))

    local itemDefinition = Cheat:getItem(itemId)
    if not itemDefinition then
        Cheat:logError("Item [%s] not found in item database.", itemId)
        return nil
    end
    --Cheat:logDebug("itemDefinition: %s", Cheat:serializeTable(itemDefinition))

    local itemInstanceOwer = tostring(ItemManager.GetItemOwner(itemInstanceId))
    local itemCondition, itemQuality = Cheat:healthToCondition(itemInstance.health, itemDefinition.maxquality)

    local userItem = {
        uid = itemInstanceId,
        id = itemId,
        amount = itemInstance.amount,
        health = itemInstance.health,
        condition = itemCondition,
        quality = itemQuality,
        maxquality = itemDefinition.maxquality,
        category_id = itemDefinition.category_id,
        uiname = itemDefinition.uiname,
        lname = itemDefinition.lname,
        name = itemDefinition.name,
        owner = itemInstanceOwer,
        isquestitem = itemDefinition.isquestitem
    }
    --Cheat:logDebug("userItem: %s", Cheat:serializeTable(userItem))
    return userItem
end

---getItemDisplayText
---@param item table The item to display.
---@return string displayText The text representation of this item.
function Cheat:getItemDisplayText(item)
    if not item then
        return "nil"
    end

    local data = {}
    for k, v in pairs(item) do
        if k ~= "id" and k ~= "lname" and k ~= "name" then
            data[k] = v
        end
    end

    return string.format("name=%s id=%s %s",
        Cheat:getFormattedNames(item.name, item.lname),
        tostring(item.id),
        Cheat:serializeTable(data))
end

---recreateItems
---@param mode string
---@param condition integer
---@param quality integer|nil Use nil for default item maxquality.
---@param quest boolean
---@return boolean
function Cheat:recreateItems(mode, condition, quality, quest)
    condition = Cheat:clamp(condition, 0, 100)

    for _, item in ipairs(Cheat:getUserItems()) do
        local shouldSkip = false
        local shouldDelete = false
        local shouldRecreate = false

        if mode == "removestolen" then
            if Cheat.g_removestolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = false
            end
        end

        if mode == "ownstolen" then
            if Cheat.g_ownstolen_cat_ids[item.category_id] and item.owner ~= Cheat.g_player_data_m and item.owner ~= Cheat.g_player_data_f then
                shouldDelete = true
                shouldRecreate = true
                -- we'll change ownership but keep the condition and quality
                condition = item.condition
                quality = item.quality
            end
        end

        if mode == "damageall" then
            if item.condition > condition and Cheat.g_damageall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        if mode == "repairall" then
            if item.condition < condition and Cheat.g_repairall_cat_ids[item.category_id] then
                shouldDelete = true
                shouldRecreate = true
            end
        end

        -- some items, like certain quest items, cannot be created
        -- we don't want to delete an item we can't recreate
        if shouldRecreate and not Cheat:canCreateItem(item.id) then
            Cheat:logWarn("Ignoring blocked item: %s", Cheat:getItemDisplayText(item))
            shouldSkip = true
        end

        -- can't recreate quality 4 items, should never delete or damage them
        -- this means backup/restore system can't work with some quest items or quality 4 items
        if shouldRecreate and item.quality == 4 then
            Cheat:logWarn("Ignoring quality 4 item: %s", Cheat:getItemDisplayText(item))
            shouldSkip = true
        end

        if not quest and item.isquestitem then
            Cheat:logWarn("Ignoring quest item: %s", Cheat:getItemDisplayText(item))
            shouldSkip = true
        end

        if not shouldSkip then
            if shouldDelete then
                --Cheat:logDebug("shouldDelete [%s]", Cheat:serializeTable(item))
                Cheat:removeItem({ exact = true, searchKey = item.id }, item.amount, quest, false, true)
            end

            if shouldRecreate then
                --Cheat:logDebug("shouldRecreate [%s]", Cheat:serializeTable(item))
                Cheat:addItem({ exact = true, searchKey = item.id }, item.amount, condition, quality, quest, false, true)
            end
        end
    end

    return true
end

---canCreateItem
---@param itemId string Item ID
---@return boolean
function Cheat:canCreateItem(itemId)
    -- some items are block by inventory:CreateItem
    -- use this really stupid way to testing to see if an item is blocked
    local added = false
    local who = System.GetEntityByName("thisIsStupid")
    if not who then
        who = System.SpawnEntity({ name = "thisIsStupid", class = "NPC", position = { 0, 0, 0 } });
    end
    if who then
        added = who.inventory:CreateItem(itemId, 1, 1)
    end
    if who then
        System.RemoveEntity(who.id)
    end
    if added then
        Cheat:logDebug("Can add " .. itemId)
    else
        Cheat:logDebug("Can't add " .. itemId)
    end
    return added
end

-- ============================================================================
-- cheat_find_items
-- ============================================================================
Cheat.cheat_find_items_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
}
Cheat:createCommandLegacy("cheat_find_items", "Cheat:cheat_find_items(%line)", Cheat.cheat_find_items_args,
    "Perform case-insensitive search for items by ID and localized name.",
    "Show all items", "cheat_find_items",
    "Matches items with 'long-range arrow' in their names", "cheat_find_items any:long-range arrow",
    "Matches item named 'long-range arrow'", "cheat_find_items exact:long-range arrow"
)
function Cheat:cheat_find_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_items_args)
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    if anyErr or exactErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    local items = Cheat:findItems(searchOperation)
    if #items == 0 then
        return false, nil
    end

    for _, item in ipairs(items) do
        Cheat:logInfo("Item: %s", Cheat:getItemDisplayText(item))
    end

    Cheat:logInfo("Found [%s] items for search [%s].", tostring(#items), Cheat:serializeTable(searchOperation))
    return true, items
end

-- ============================================================================
-- cheat_add_item
-- ============================================================================
Cheat.cheat_add_item_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to add. Default 1.") end,
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 100, showHelp, "The condition of the item added. Default 100.") end,
    quality = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The quality of the item added (1-3). Defaults to item's max quality.") end,
    bulk = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, all matches items are added.") end,
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt adding quest items.") end
}
Cheat:createCommandLegacy("cheat_add_item", "Cheat:cheat_add_item(%line)", Cheat.cheat_add_item_args,
    "Adds an item to the player's inventory.",
    "Adds 1 item with 'bow' in anywhere in name", "cheat_add_item any:bow",
    "Adds 1 item with 'hunting arrow' anywhere in name", "cheat_add_item any:hunting arrow",
    "Adds 2 items exactly named 'military sword' with 50% condition", "cheat_add_item exact:military sword amount:10 condition:50")
function Cheat:cheat_add_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_item_args, "cheat_add_item")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    local quality, qualityErr = Cheat:argsGet(args, "quality")
    local bulk, bulkErr = Cheat:argsGet(args, "bulk")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if anyErr or exactErr or amountErr or conditionErr or qualityErr or bulkErr or questErr then
        return false
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_add_item ?")
        return false
    end

    if bulk then
        local items = Cheat:findItems(searchOperation)
        if not items then
            Cheat:logError("Item [%s] not found.", Cheat:serializeTable(searchOperation))
            return false
        end

        for _, item in ipairs(items) do
            Cheat:addItem({ exact = true, searchKey = item.id }, amount, condition, quality, quest, true, true)
        end
        return true
    else
        return Cheat:addItem(searchOperation, amount, condition, quality, quest, true, true)
    end
end

-- cheat_add_all_items
-- ============================================================================
Cheat.cheat_add_all_items_args = {
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt adding quest items.") end
}
Cheat:createCommandLegacy("cheat_add_all_items", "Cheat:cheat_add_all_items(%line)", Cheat.cheat_add_all_items_args,
    "Adds all items the player's inventory. Enjoy!",
    "Add all items", "cheat_add_all_items")
function Cheat:cheat_add_all_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_all_items_args, "cheat_add_all_items")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if questErr then
        return false
    end

    local itemsAdded = 0
    local questItemsAdded = 0
    local blockedItems = 0
    for _, item in ipairs(Cheat:findItems()) do
        if Cheat:addItem({ exact = true, searchKey = item.id }, item.amount, 100, nil, quest, false, true) then
            itemsAdded = itemsAdded + 1
            if item.isquestitem then
                questItemsAdded = questItemsAdded + 1
            end
        else
            blockedItems = blockedItems + 1
        end
    end
    Cheat:logInfo("Added [%d] items. (quest-items=%d, block-items=%d)", itemsAdded, questItemsAdded, blockedItems)
    return true
end

-- ============================================================================
-- cheat_remove_item
-- ============================================================================
Cheat.cheat_remove_item_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The number of items to remove. Default 1.") end,
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt removing quest items.") end,
    bulk = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, all matches items are removed.") end,
}
Cheat:createCommandLegacy("cheat_remove_item", "Cheat:cheat_remove_item(%line)", Cheat.cheat_remove_item_args,
    "Removes an item to the player's inventory.",
    "Removes the last item with 'bow' in its name", "cheat_remove_item id:bow",
    "Removes the item ui_nm_arrow_hunter by ID", "cheat_remove_item id:802507e9-d620-47b5-ae66-08fcc314e26a",
    "Removes 10 items ui_nm_arrow_hunter by fullname", "cheat_remove_item id:ui_nm_arrow_hunter amount:10")
function Cheat:cheat_remove_item(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_item_args, "cheat_remove_item")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    local bulk, bulkErr = Cheat:argsGet(args, "bulk")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if anyErr or exactErr or amountErr or bulkErr or questErr then
        return false
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_remove_item ?")
        return false
    end

    if bulk then
        for _, item in pairs(Cheat:getUserItems()) do
            if Cheat:getItemCount(item.id) >= amount then
                Cheat:removeItem({ exact = true, searchKey = item.id }, amount, quest, true, true)
            end
        end
        return true
    else
        return Cheat:removeItem(searchOperation, amount, quest, true, true)
    end
end

-- ============================================================================
-- cheat_remove_items
-- ============================================================================
Cheat.cheat_remove_items_args = {
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt removing quest items.") end
}
Cheat:createCommandLegacy("cheat_remove_items", "Cheat:cheat_remove_items(%line)", Cheat.cheat_remove_items_args,
    "Removes all items in the player's inventory.\n$4THIS DELETES YOUR INVENTORY! Move items you want to a stash first.",
    "Delete your inventory.", "cheat_remove_items")
function Cheat:cheat_remove_items(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_item_args, "cheat_remove_items")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if questErr then
        return false
    end

    local itemsRemoved = 0
    local questItemsRemoved = 0
    for _, item in ipairs(Cheat:getUserItems()) do
        if Cheat:removeItem({ exact = true, searchKey = item.id }, item.amount, quest, false, true) then
            itemsRemoved = itemsRemoved + 1
            if item.isquestitem then
                questItemsRemoved = questItemsRemoved + 1
            end
        end
    end
    Cheat:logInfo("Removed [%s] items, including [%s] quest items.", itemsRemoved, questItemsRemoved)
    return true
end

-- ============================================================================
-- cheat_remove_stolen_items
-- ============================================================================
Cheat:createCommandLegacy("cheat_remove_stolen_items", "Cheat:cheat_remove_stolen_items()", nil,
    "Removes all stolen items from your inventory.",
    "Remove stolen items.", "cheat_remove_stolen_items")
function Cheat:cheat_remove_stolen_items()
    Cheat:recreateItems("removestolen", 0, nil, false)
    Cheat:logInfo("All stolen items removed.")
    return true
end

-- ============================================================================
-- cheat_own_stolen_items
-- ============================================================================
Cheat:createCommandLegacy("cheat_own_stolen_items", "Cheat:cheat_own_stolen_items()", nil,
    "Makes you the owner of all stolen items in your inventory.\n$8This removes the stolen flag from the item.",
    "Take ownership of stolen items", "cheat_own_stolen_items")
function Cheat:cheat_own_stolen_items()
    Cheat:recreateItems("ownstolen", 0, nil, false)
    Cheat:logInfo("All stolen items are now owned by the player.")
    return true
end

-- ============================================================================
-- cheat_repair_gear
-- ============================================================================
Cheat.cheat_repair_gear_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 100, showHelp, "The item condition to apply between 0 and 100. Default 100.") end,
    quality = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The item quality. Defaults to, and cannot exceed, the item's max quality or quality 3.") end,
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt repairing quest items.") end
}
Cheat:createCommandLegacy("cheat_repair_gear", "Cheat:cheat_repair_gear(%line)", Cheat.cheat_repair_gear_args,
    "Repairs weapons and armor." ..
    "\n$4This can uneqip items so don't do this in combat.",
    "Repair gear to 75%.", "cheat_repair_gear condition:75")
function Cheat:cheat_repair_gear(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_repair_gear_args, "cheat_repair_gear")
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    local quality, qualityErr = Cheat:argsGet(args, "quality")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if conditionErr or qualityErr or questErr then
        return false
    end
    Cheat:recreateItems("repairall", condition, quality, quest)
    Cheat:logInfo("All items repaired to at least [%d] condition and [%s] quality.", condition, quality or "default")
    return true
end

-- ============================================================================
-- cheat_damage_gear
-- ============================================================================
Cheat.cheat_damage_gear_args = {
    condition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 50, showHelp, "The item condition to apply between 0 and 100. Default 50.") end,
    quality = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The item quality. Defaults to, and cannot exceed, the item's max quality or quality 3.") end,
    quest = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, attempt damaging quest items.") end
}
Cheat:createCommandLegacy("cheat_damage_gear", "Cheat:cheat_damage_gear(%line)", Cheat.cheat_damage_gear_args,
    "Damages weapons and armor." ..
    "\n$4This can uneqip items so don't do this in combat.",
    "Damage gear to 25%", "cheat_damage_gear condition:25")
function Cheat:cheat_damage_gear(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_damage_gear_args, "cheat_damage_gear")
    local condition, conditionErr = Cheat:argsGet(args, "condition")
    local quality, qualityErr = Cheat:argsGet(args, "quality")
    local quest, questErr = Cheat:argsGet(args, "quest")
    if conditionErr or qualityErr or questErr then
        return false
    end
    Cheat:recreateItems("damageall", condition, quality, quest)
    Cheat:logInfo("All items damaged to at most [%d] condition and [%s] quality.", condition, quality or "default")
    return true
end

-- ============================================================================
-- cheat_list_inventory
-- ============================================================================
Cheat:createCommand("cheat_list_inventory", nil, "Lists your inventory.")
function Cheat:cheat_list_inventory(c)
    local count = 0
    for _, item in pairs(Cheat:getUserItems()) do
        count = count + 1
        Cheat:logInfo("Inventory Item: %s", Cheat:getItemDisplayText(item))
    end
    Cheat:logInfo("List all [%d] inventory items.", count)
    return true
end

-- ============================================================================
-- cheat_backup_inventory
-- ============================================================================
Cheat:createCommandLegacy("cheat_backup_inventory", "Cheat:cheat_backup_inventory()", nil,
    "Saves inventory to temporary mod memory which remains even on the main menu screen.\n" ..
    "Use to avoid situations where game mechanics causes lose of your inventory,\n" ..
    "moving items between game saves, or for New Game+ item transfers.\n" ..
    "Use cheat_restore_inventory to restore the backup.\n" ..
    "$4WARNING: cheat_restore_inventory cannot restore quest items and quality 4 items.\n",
    "Saves all items", "cheat_backup_inventory")
function Cheat:cheat_backup_inventory()
    local userItems, totalItems, backedupItems = Cheat:getUserItems()
    if totalItems > 0 and totalItems == backedupItems then
        local blockedCount = 0
        for _, item in pairs(userItems) do
            if Cheat:canCreateItem(item.id) then
                Cheat:logInfo("Backup Item: %s", Cheat:getItemDisplayText(item))
            else
                blockedCount = blockedCount + 1
                Cheat:logWarn("Your inventory contains a blocked item that may not work with cheat_restore_inventory.")
                Cheat:logWarn("Blocked Item: %s", Cheat:getItemDisplayText(item))
            end
        end

        Cheat.g_user_items = userItems
        Cheat:logInfo("Backed backup [%d] of [%d] items.", backedupItems - blockedCount, totalItems)
        return true
    else
        Cheat.g_user_items = nil
        Cheat:logInfo("Failed to backup [%d] of [%d] items.", totalItems - backedupItems, totalItems)
        return false
    end
end

-- ============================================================================
-- cheat_restore_inventory
-- ============================================================================
Cheat:createCommandLegacy("cheat_restore_inventory", "Cheat:cheat_restore_inventory()", nil,
    "Loads all items stored by cheat_backup_inventory in this game session.\n" ..
    "$4WARNING: cheat_restore_inventory cannot restore quest items and quality 4 items.\n",
    "Load all items", "cheat_restore_inventory")
function Cheat:cheat_restore_inventory()
    if not Cheat.g_user_items then
        Cheat:logError("Have to run cheat_backup_inventory first!")
        return false
    end

    local totalItems = 0
    local itemsRestored = 0
    for _, item in ipairs(Cheat.g_user_items) do
        totalItems = totalItems + 1
        if Cheat:addItem({ exact = true, searchKey = item.id }, item.amount, item.condition, item.quality, true, true, true) then
            itemsRestored = itemsRestored + 1
        else
            Cheat:logError("Failed to restore item: %s", Cheat:getItemDisplayText(item))
        end
    end

    Cheat:logInfo("Restored from backup [%s] of [%s] items.", tostring(itemsRestored), tostring(totalItems))
    return true
end

-- ============================================================================
-- test_core_items
-- ============================================================================
function Cheat:test_core_items()
    Cheat:beginTests("test_core_items")

    self:test_health_and_condition_conversions()
    self:test_cheat_find_items()
    self:test_cheat_add_item()
    self:test_cheat_remove_item()
    self:test_cheat_remove_items()
    self:test_cheat_damage_gear()
    self:test_cheat_repair_gear()
    self:test_cheat_remove_stolen_items()
    self:test_cheat_own_stolen_items()
    self:test_cheat_inventory_backup_restore()
    self:test_can_create_item()
    self:test_cheat_add_all_items()

    Cheat:endTests()
end

function Cheat:test_health_and_condition_conversions()
    Cheat:testAssertEqualsFloat("conditionToHealth q1 c0", Cheat:conditionToHealth(0, 1, 1), 0.0, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q1 c50", Cheat:conditionToHealth(50, 1, 1), 0.5, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q1 c100", Cheat:conditionToHealth(100, 1, 1), 1.0, 0.00001)

    Cheat:testAssertEqualsFloat("conditionToHealth q2 c0", Cheat:conditionToHealth(0, 1, 2), 0.0, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q2 c50", Cheat:conditionToHealth(50, 1, 2), (1 / 3) / 2, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q2 c100", Cheat:conditionToHealth(100, 1, 2), (1 / 3), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q2_2 c0", Cheat:conditionToHealth(0, 2, 2), ((1 / 3) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q2_2 c50", Cheat:conditionToHealth(50, 2, 2), (((1 / 3) + 0.00000001) + (1 - ((1 / 3) + 0.00000001)) / 2), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q2_2 c100", Cheat:conditionToHealth(100, 2, 2), 1.0, 0.00001)

    Cheat:testAssertEqualsFloat("conditionToHealth q3 c0", Cheat:conditionToHealth(0, 1, 3), 0.0, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q3 c100", Cheat:conditionToHealth(100, 1, 3), (1 / 6), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q3_2 c0", Cheat:conditionToHealth(0, 2, 3), ((1 / 6) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q3_2 c100", Cheat:conditionToHealth(100, 2, 3), (3 / 6), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q3_3 c0", Cheat:conditionToHealth(0, 3, 3), ((3 / 6) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q3_3 c100", Cheat:conditionToHealth(100, 3, 3), (6 / 6), 0.00001)

    Cheat:testAssertEqualsFloat("conditionToHealth q4 c0", Cheat:conditionToHealth(0, 1, 4), 0.0, 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4 c100", Cheat:conditionToHealth(100, 1, 4), (1 / 10), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_2 c0", Cheat:conditionToHealth(0, 2, 4), ((1 / 10) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_2 c100", Cheat:conditionToHealth(100, 2, 4), (3 / 10), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_3 c0", Cheat:conditionToHealth(0, 3, 4), ((3 / 10) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_3 c100", Cheat:conditionToHealth(100, 3, 4), (6 / 10), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_4 c0", Cheat:conditionToHealth(0, 4, 4), ((6 / 10) + 0.00000001), 0.00001)
    Cheat:testAssertEqualsFloat("conditionToHealth q4_4 c100", Cheat:conditionToHealth(100, 4, 4), (10 / 10), 0.00001)

    Cheat:testAssertEqualsFloat("healthToCondition q1 h0", Cheat:healthToCondition(0, 1), 0, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q1 h1", Cheat:healthToCondition(1, 1), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q1 h0.5", Cheat:healthToCondition(0.5, 1), 50, 0.00001)

    Cheat:testAssertEqualsFloat("healthToCondition q2 h0", Cheat:healthToCondition(0, 2), 0, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q2 h1/3", Cheat:healthToCondition(1 / 3, 2), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q2 h_just_above_1_3", Cheat:healthToCondition((1 / 3) + 0.0000001, 2), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q2 h1", Cheat:healthToCondition(1, 2), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q2 h_mid_range_2", Cheat:healthToCondition(((1 / 3) + 0.00000001 + 1) / 2, 2), 50, 0.00001)

    Cheat:testAssertEqualsFloat("healthToCondition q3 h0", Cheat:healthToCondition(0, 3), 0, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q3 h1/6", Cheat:healthToCondition(1 / 6, 3), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q3_2 h_just_above_1_6", Cheat:healthToCondition((1 / 6) + 0.0000001, 3), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q3_2 h3/6", Cheat:healthToCondition(3 / 6, 3), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q3_3 h_just_above_3_6", Cheat:healthToCondition((3 / 6) + 0.0000001, 3), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q3_3 h6/6", Cheat:healthToCondition(6 / 6, 3), 100, 0.00001)

    Cheat:testAssertEqualsFloat("healthToCondition q4 h0", Cheat:healthToCondition(0, 4), 0, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q4 h1/10", Cheat:healthToCondition(1 / 10, 4), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_2 h_just_above_1_10", Cheat:healthToCondition((1 / 10) + 0.0000001, 4), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_2 h3/10", Cheat:healthToCondition(3 / 10, 4), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_3 h_just_above_3_10", Cheat:healthToCondition((3 / 10) + 0.0000001, 4), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_3 h6/10", Cheat:healthToCondition(6 / 10, 4), 100, 0.00001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_4 h_just_above_6_10", Cheat:healthToCondition((6 / 10) + 0.0000001, 4), 0, 0.0001)
    Cheat:testAssertEqualsFloat("healthToCondition q4_4 h10/10", Cheat:healthToCondition(10 / 10, 4), 100, 0.00001)
end

function Cheat:test_cheat_find_items()
    local items, result = nil, nil

    Cheat:removeAllItems()
    Cheat:testAssert("remove all items before testing", Cheat:getInventoryItemCount() == 0)

    -- cheat_find_items - no args
    result, items = Cheat:cheat_find_items(nil)
    Cheat:testAssert("cheat_find_items 1.1", result and items and #items > 0)

    result, items = Cheat:cheat_find_items(" ")
    Cheat:testAssert("cheat_find_items 1.2", result and items and #items > 0)

    -- cheat_find_items - any name
    Cheat:removeAllItems()
    result, items = Cheat:cheat_find_items("any:long-range arrow")
    Cheat:testAssert("cheat_find_items any name 2.1", result and items and #items == 2)
    Cheat:testAssert("cheat_find_items any name 2.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items any name 2.3", result and items and items[2].id == Cheat.g_long_ranged_arrow_id)

    -- cheat_find_items - any id
    Cheat:removeAllItems()
    result, items = Cheat:cheat_find_items("any:" .. Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items any id 3.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items any id 3.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)

    -- cheat_find_items - exact name
    Cheat:removeAllItems()
    result, items = Cheat:cheat_find_items("exact:long-range arrow")
    Cheat:testAssert("cheat_find_items exact name 4.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items exact name 4.2", result and items and items[1].id == Cheat.g_long_ranged_arrow_id)

    -- cheat_find_items - exact id
    Cheat:removeAllItems()
    result, items = Cheat:cheat_find_items("exact:" .. Cheat.g_enhanced_long_range_arrow_id)
    Cheat:testAssert("cheat_find_items exact id 5.1", result and items and #items == 1)
    Cheat:testAssert("cheat_find_items exact id 5.2", result and items and items[1].id == Cheat.g_enhanced_long_range_arrow_id)
end

function Cheat:test_cheat_add_item()
    local item = nil

    -- cheat_add_item
    Cheat:removeAllItems()
    Cheat:testAssertFalse("cheat_add_item invalid 1", Cheat:cheat_add_item())
    Cheat:testAssertFalse("cheat_add_item invalid 2", Cheat:cheat_add_item(nil))
    Cheat:testAssertFalse("cheat_add_item invalid 3", Cheat:cheat_add_item(""))

    -- cheat_add_item defaults
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item bread id 1.1", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. ""))
    Cheat:testAssertEquals("cheat_add_item bread id 1.2", Cheat:getItemCount(Cheat.g_bread_id), 1)

    -- cheat_add_item with amount
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item bread id 2.1", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. " amount:2"))
    Cheat:testAssertEquals("cheat_add_item bread id 2.2", Cheat:getItemCount(Cheat.g_bread_id), 2)

    -- cheat_add_item with condition
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item bread id 3.1", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. " condition:50"))
    item = Cheat:getUserItem(Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bread id 3.2", item and item.id == Cheat.g_bread_id)
    Cheat:testAssert("cheat_add_item bread id 3.3", item and item.amount == 1)
    Cheat:testAssert("cheat_add_item bread id 3.4", item and item.condition == 50)

    -- cheat_add_item with quality 1-4 items
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality1 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality1_item_1_id))
    item = Cheat:getUserItem(Cheat.g_quality1_item_1_id)
    Cheat:testAssert("cheat_add_item quality1 2", item and item.amount == 1 and item.condition == 100 and item.quality == 1)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality2 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality2_item_1_id))
    item = Cheat:getUserItem(Cheat.g_quality2_item_1_id)
    Cheat:testAssert("cheat_add_item quality2 2", item and item.amount == 1 and item.condition == 100 and item.quality == 2)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality3 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality3_item_1_id))
    item = Cheat:getUserItem(Cheat.g_quality3_item_1_id)
    Cheat:testAssert("cheat_add_item quality3 2", item and item.amount == 1 and item.condition == 100 and item.quality == 3)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality4 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality4_item_1_id))
    item = Cheat:getUserItem(Cheat.g_quality4_item_1_id)
    Cheat:testAssert("cheat_add_item quality4 2", item and item.amount == 1 and item.condition == 100 and item.quality == 3)

    -- cheat_add_item with quality itemsd 1-4 and custom quality 1 condition 50
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality1 q1 c50 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality1_item_1_id .. " quality:1 condition:50"))
    item = Cheat:getUserItem(Cheat.g_quality1_item_1_id)
    Cheat:testAssert("cheat_add_item quality1 q1 c50 1", item and item.amount == 1 and item.condition == 50 and item.quality == 1)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality2 q1 c50 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality2_item_1_id .. " quality:1 condition:50"))
    item = Cheat:getUserItem(Cheat.g_quality2_item_1_id)
    Cheat:testAssert("cheat_add_item quality2 q1 c50 2", item and item.amount == 1 and item.condition == 50 and item.quality == 1)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality3 q1 c50 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality3_item_1_id .. " quality:1 condition:50"))
    item = Cheat:getUserItem(Cheat.g_quality3_item_1_id)
    Cheat:testAssert("cheat_add_item quality3 q1 c50 2", item and item.amount == 1 and item.condition == 50 and item.quality == 1)

    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item quality4 q1 c50 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quality4_item_1_id .. " quality:1 condition:50"))
    item = Cheat:getUserItem(Cheat.g_quality4_item_1_id)
    Cheat:testAssert("cheat_add_item quality4 q1 c50 2", item and item.amount == 1 and item.condition == 50 and item.quality == 1)

    -- cheat_add_item using localized name
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item lockpick name 5.1", Cheat:cheat_add_item("exact:lockpick"))
    item = Cheat:getUserItem(Cheat.g_lockpick_id)
    Cheat:testAssert("cheat_add_item lockpick name 5.2", item and item.id == Cheat.g_lockpick_id)
    Cheat:testAssert("cheat_add_item lockpick name 5.3", item and item.amount == 1)
    Cheat:testAssert("cheat_add_item lockpick name 5.4", item and item.condition == 100)

    -- cheat_add_item - any name
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item any name 19.1", Cheat:cheat_add_item("any:long-range arrow"))
    Cheat:testAssert("cheat_add_item any name 19.2", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)

    -- cheat_add_item - any id
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item any id 20.1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_add_item any id 20.2", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)

    -- cheat_add_item - exact name
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item exact name 21.1", Cheat:cheat_add_item("exact:enhanced long-range arrow"))
    Cheat:testAssert("cheat_add_item exact name 21.2", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)

    -- cheat_add_item - exact id
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item exact id 22.1", Cheat:cheat_add_item("exact:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_add_item exact id 22.2", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)

    -- cheat_add_item - blocked quest item
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 0)
    Cheat:testAssertFalse("cheat_add_item add quest items 27.1", Cheat:cheat_add_item("exact:2cf06381-7692-4f3c-b917-e98dd3b5f8e3 quest:true"))
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 0)

    -- cheat_add_item - quest item with quest flag
    --[[ won't work until i find addable quest item
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 0)
    Cheat:testAssert("cheat_add_item add quest items 27.1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id .. " quest:true"))
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 1)

    -- cheat_add_item - quest item without quest flag
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 0)
    Cheat:testAssertFalse("cheat_add_item add quest items 27.1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id))
    Cheat:testAssert("cheat_add_item add quest items 27.2", Cheat:getInventoryItemCount() == 0)
    ]]

    -- cheat_add_item - bulk
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_item bulk 1", Cheat:cheat_add_item("any:long-range amount:10 bulk:true"))
    Cheat:testAssert("cheat_add_item bulk 2", Cheat:getInventoryItemCount() == 2)
    for _, userItem in pairs(Cheat:getUserItems()) do
        Cheat:testAssert("cheat_add_item bulk 3", userItem.amount == 10)
        Cheat:testAssert("cheat_add_item bulk 4", userItem.condition == 100)
        Cheat:testAssert("cheat_add_item bulk 4", string.find(userItem.lname, "arrow", 1, true))
    end
end

function Cheat:test_cheat_remove_item()
    -- cheat_remove_item invalid
    Cheat:removeAllItems()
    Cheat:testAssertFalse("cheat_remove_item invalid 1", Cheat:cheat_remove_item())
    Cheat:testAssertFalse("cheat_remove_item invalid 2", Cheat:cheat_remove_item(nil))
    Cheat:testAssertFalse("cheat_remove_item invalid 3", Cheat:cheat_remove_item(""))
    Cheat:testAssertFalse("cheat_remove_item invalid 4", Cheat:cheat_remove_item("exact:"))

    -- cheat_remove_item with partial amount
    Cheat:testAssert("cheat_remove_item partial amount 1", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. " amount:3"))
    Cheat:testAssert("cheat_remove_item partial amount 2", Cheat:cheat_remove_item("exact:" .. Cheat.g_bread_id))
    Cheat:testAssert("cheat_remove_item partial amount 3", Cheat:getItemCount(Cheat.g_bread_id) == 2)
    Cheat:testAssert("cheat_remove_item partial amount 4", Cheat:cheat_remove_item("exact:" .. Cheat.g_bread_id .. " amount:2"))
    Cheat:testAssert("cheat_remove_item partial amount 5", Cheat:getItemCount(Cheat.g_bread_id) == 0)

    -- cheat_remove_item - any name
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item any name 1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any name 2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item any name 3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item any name 4", Cheat:cheat_remove_item("any:long-range arrow"))
    Cheat:testAssert("cheat_remove_item any name 5", Cheat:getInventoryItemCount() == 1) -- removes the last one

    -- cheat_remove_item - any id
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item any id 1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any id 2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item any id 3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item any id 4", Cheat:cheat_remove_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item any id 5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 0)
    Cheat:testAssert("cheat_remove_item any id 6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 1)

    -- cheat_remove_item - exact name
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item exact name 1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item exact name 2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact name 3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item exact name 4", Cheat:cheat_remove_item("exact:enhanced long-range arrow"))
    Cheat:testAssert("cheat_remove_item exact name 5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:testAssert("cheat_remove_item exact name 6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 0)

    -- cheat_remove_item - exact id
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item exact id 1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item exact id 4", Cheat:cheat_remove_item("exact:" .. Cheat.g_enhanced_long_range_arrow_id))
    Cheat:testAssert("cheat_remove_item exact id 5", Cheat:getItemCount(Cheat.g_long_ranged_arrow_id) == 1)
    Cheat:testAssert("cheat_remove_item exact id 6", Cheat:getItemCount(Cheat.g_enhanced_long_range_arrow_id) == 0)

    -- cheat_remove_item blocked quest item
    Cheat:removeAllItems()
    -- TBD: we can't add a block item to the inventory

    -- setup for cheat_remove_item quest item
    --[[ won't work until i find addable quest item
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item quest item 1", Cheat:getInventoryItemCount() == 0)
    Cheat:testAssert("cheat_remove_item quest item 2", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id .. " quest:true"))
    Cheat:testAssert("cheat_remove_item quest item 3", Cheat:getInventoryItemCount() == 1)

    -- cheat_remove_item quest item with no flag
    Cheat:testAssertFalse("cheat_remove_item quest item 4", Cheat:cheat_remove_item("exact:" .. Cheat.g_quest_item_1_id))
    Cheat:testAssert("cheat_remove_item quest item 5", Cheat:getInventoryItemCount() == 1)

    -- cheat_remove_item quest item with flag
    Cheat:testAssertFalse("cheat_remove_item quest item 6", Cheat:cheat_remove_item("exact:" .. Cheat.g_quest_item_1_id .. " quest:true"))
    Cheat:testAssert("cheat_remove_item quest item 7", Cheat:getInventoryItemCount() == 0)
    ]]

    -- cheat_remove_item bulk
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_item bulk 1", Cheat:cheat_add_item("any:" .. Cheat.g_long_ranged_arrow_id .. " amount:10"))
    Cheat:testAssert("cheat_remove_item bulk 2", Cheat:cheat_add_item("any:" .. Cheat.g_enhanced_long_range_arrow_id .. " amount:10"))
    Cheat:testAssert("cheat_remove_item bulk 3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item bulk 4", Cheat:cheat_remove_item("any:arrow amount:5 bulk:true"))
    Cheat:testAssert("cheat_remove_item bulk 5", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_remove_item bulk 6", Cheat:cheat_remove_item("any:arrow amount:5 bulk:true"))
    Cheat:testAssert("cheat_remove_item bulk 7", Cheat:getInventoryItemCount() == 0)
end

function Cheat:test_cheat_remove_items()
    -- cheat_remove_items
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_items 1", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. " amount:10"))
    Cheat:testAssert("cheat_remove_items 2", Cheat:cheat_remove_items())
    Cheat:testAssert("cheat_remove_items 3", Cheat:getInventoryItemCount() == 0)

    --[[ won't work until i find addable quest item
    -- cheat_remove_items with quest flag
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_items quest 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id))
    Cheat:testAssert("cheat_remove_items quest 2", Cheat:cheat_remove_items("quest:true"))
    Cheat:testAssert("cheat_remove_items quest 3", Cheat:getInventoryItemCount() == 0)

    -- cheat_remove_items without quest flag
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_remove_items quest 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id))
    Cheat:testAssert("cheat_remove_items quest 2", Cheat:cheat_remove_items())
    Cheat:testAssert("cheat_remove_items quest 3", Cheat:getInventoryItemCount() == 1)
    ]]
end

function Cheat:test_cheat_damage_gear()
    -- cheat_damage_gear (default 50)
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_damage_gear 8.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_gear 8.2", Cheat:cheat_add_item("exact:" .. Cheat.g_shield1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_gear 8.3", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 100))
    Cheat:testAssert("cheat_damage_gear 8.4", Cheat:getUserItem(Cheat.g_shield1_id, 1, 100))
    Cheat:testAssert("cheat_damage_gear 8.5", Cheat:cheat_damage_gear())
    Cheat:testAssert("cheat_damage_gear 8.6", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_damage_gear 8.7", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear 8.8", Cheat:getUserItem(Cheat.g_shield1_id, 1, 50))

    -- cheat_damage_gear (custom condition)
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_damage_gear 9.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id .. " amount:1 condition:100"))
    Cheat:testAssert("cheat_damage_gear 9.2", Cheat:cheat_add_item("exact:" .. Cheat.g_shield1_id .. " amount:1 condition:20"))
    Cheat:testAssert("cheat_damage_gear 9.3", Cheat:cheat_damage_gear("condition:25"))
    Cheat:testAssert("cheat_damage_gear 9.4", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_damage_gear 9.5", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 25))
    Cheat:testAssert("cheat_damage_gear 9.6", Cheat:getUserItem(Cheat.g_shield1_id, 1, 20))

    -- cheat_damage_gear quest setup
    Cheat:removeAllItems()
    --Cheat:testAssert("cheat_damage_gear quest 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id))
    Cheat:testAssert("cheat_damage_gear quest 2", Cheat:cheat_add_item("exact:" .. Cheat.g_quality1_item_1_id))
    Cheat:testAssert("cheat_damage_gear quest 3", Cheat:cheat_add_item("exact:" .. Cheat.g_quality2_item_1_id))
    Cheat:testAssert("cheat_damage_gear quest 4", Cheat:cheat_add_item("exact:" .. Cheat.g_quality3_item_1_id))
    Cheat:testAssert("cheat_damage_gear quest 5", Cheat:cheat_add_item("exact:" .. Cheat.g_quality4_item_1_id))
    Cheat:testAssert("cheat_damage_gear quest 6", Cheat:getInventoryItemCount() == 4)

    -- cheat_damage_gear no quest flag
    Cheat:testAssert("cheat_damage_gear quest 07", Cheat:cheat_damage_gear())
    --Cheat:testAssert("cheat_damage_gear quest 8", Cheat:getUserItem(Cheat.g_quest_item_1_id, 1, 100))
    Cheat:testAssert("cheat_damage_gear quest 09", Cheat:getUserItem(Cheat.g_quality1_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 10", Cheat:getUserItem(Cheat.g_quality2_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 11", Cheat:getUserItem(Cheat.g_quality3_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 12", Cheat:getUserItem(Cheat.g_quality4_item_1_id, 1, 50))

    -- cheat_damage_gear quest flag
    Cheat:testAssert("cheat_damage_gear quest 13", Cheat:cheat_damage_gear("quest:true"))
    --Cheat:testAssert("cheat_damage_gear quest 14", Cheat:getUserItem(Cheat.g_quest_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 15", Cheat:getUserItem(Cheat.g_quality1_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 16", Cheat:getUserItem(Cheat.g_quality2_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 17", Cheat:getUserItem(Cheat.g_quality3_item_1_id, 1, 50))
    Cheat:testAssert("cheat_damage_gear quest 18", Cheat:getUserItem(Cheat.g_quality4_item_1_id, 1, 50))
end

function Cheat:test_cheat_repair_gear()
    -- cheat_repair_gear (default condition of 100)
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_repair_gear 10.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_gear 10.2", Cheat:cheat_add_item("exact:" .. Cheat.g_shield1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_gear 10.3", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_repair_gear 10.4", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 25))
    Cheat:testAssert("cheat_repair_gear 10.5", Cheat:getUserItem(Cheat.g_shield1_id, 1, 25))
    Cheat:testAssert("cheat_repair_gear 10.6", Cheat:cheat_repair_gear())
    Cheat:testAssert("cheat_repair_gear 10.7", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear 10.8", Cheat:getUserItem(Cheat.g_shield1_id, 1, 100))

    -- cheat_repair_gear (custom conditions)
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_repair_gear 11.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id .. " amount:1 condition:25"))
    Cheat:testAssert("cheat_repair_gear 11.2", Cheat:cheat_add_item("exact:" .. Cheat.g_shield1_id .. " amount:1 condition:80"))
    Cheat:testAssert("cheat_repair_gear 11.3", Cheat:cheat_repair_gear("condition:75"))
    Cheat:testAssert("cheat_repair_gear 11.4", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_repair_gear 11.5", Cheat:getUserItem(Cheat.g_dagger1_id, 1, 75))
    Cheat:testAssert("cheat_repair_gear 11.6", Cheat:getUserItem(Cheat.g_shield1_id, 1, 80))

    -- repair and alias weapon
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_repair_gear alias 28.1", Cheat.g_item_lookup["b867dd0e-1bfe-40e9-b114-4b126a3ff1b0"].wasAlias)
    Cheat:testAssert("cheat_repair_gear alias 28.1", Cheat:cheat_add_item("exact:b867dd0e-1bfe-40e9-b114-4b126a3ff1b0 condition:50"))
    Cheat:testAssert("cheat_repair_gear alias 28.2", Cheat:getUserItem("b867dd0e-1bfe-40e9-b114-4b126a3ff1b0", 1, 50))
    Cheat:testAssert("cheat_repair_gear alias 28.3", Cheat:cheat_repair_gear("condition:100"))
    Cheat:testAssert("cheat_repair_gear alias 28.4", Cheat:getUserItem("b867dd0e-1bfe-40e9-b114-4b126a3ff1b0", 1, 100))

    -- cheat_repair_gear quest setup
    Cheat:removeAllItems()
    --Cheat:testAssert("cheat_repair_gear quest 1", Cheat:cheat_add_item("exact:" .. Cheat.g_quest_item_1_id .. " condition:0"))
    Cheat:testAssert("cheat_repair_gear quest 2", Cheat:cheat_add_item("exact:" .. Cheat.g_quality1_item_1_id .. " condition:0"))
    Cheat:testAssert("cheat_repair_gear quest 3", Cheat:cheat_add_item("exact:" .. Cheat.g_quality2_item_1_id .. " condition:0"))
    Cheat:testAssert("cheat_repair_gear quest 4", Cheat:cheat_add_item("exact:" .. Cheat.g_quality3_item_1_id .. " condition:0"))
    Cheat:testAssert("cheat_repair_gear quest 5", Cheat:cheat_add_item("exact:" .. Cheat.g_quality4_item_1_id .. " condition:0")) -- can't add a q4, will become q3
    Cheat:testAssert("cheat_repair_gear quest 6", Cheat:getInventoryItemCount() == 4)

    -- cheat_repair_gear no quest flag
    Cheat:testAssert("cheat_repair_gear quest 7", Cheat:cheat_repair_gear())
    --Cheat:testAssert("cheat_repair_gear quest 8", Cheat:getUserItem(Cheat.g_quest_item_1_id, 1, 0))
    Cheat:testAssert("cheat_repair_gear quest 9", Cheat:getUserItem(Cheat.g_quality1_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 10", Cheat:getUserItem(Cheat.g_quality2_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 11", Cheat:getUserItem(Cheat.g_quality3_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 12", Cheat:getUserItem(Cheat.g_quality4_item_1_id, 1, 100))

    -- cheat_repair_gear quest flag
    Cheat:testAssert("cheat_repair_gear quest 13", Cheat:cheat_repair_gear("quest:true"))
    --Cheat:testAssert("cheat_repair_gear quest 14", Cheat:getUserItem(Cheat.g_quest_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 15", Cheat:getUserItem(Cheat.g_quality1_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 16", Cheat:getUserItem(Cheat.g_quality2_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 17", Cheat:getUserItem(Cheat.g_quality3_item_1_id, 1, 100))
    Cheat:testAssert("cheat_repair_gear quest 18", Cheat:getUserItem(Cheat.g_quality4_item_1_id, 1, 100))
end

function Cheat:test_cheat_remove_stolen_items()
    Cheat:removeAllItems()
    Cheat:testAssert("remove all items before testing", Cheat:getInventoryItemCount() == 0)

    -- TODO: See if we can change an items owner.

    -- Add a dagger1, which is in g_removestolen_cat_ids
    Cheat:testAssert("cheat_remove_stolen_items setup 12.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id))
    Cheat:testAssert("cheat_remove_stolen_items setup 12.2", Cheat:getInventoryItemCount() == 1)

    -- Execute cheat_remove_stolen_items
    Cheat:testAssert("cheat_remove_stolen_items 12.3", Cheat:cheat_remove_stolen_items())

    -- Assert that the item count is now 1
    Cheat:testAssert("cheat_remove_stolen_items 12.4", Cheat:getInventoryItemCount() == 1)
end

function Cheat:test_cheat_own_stolen_items()
    Cheat:removeAllItems()
    Cheat:testAssert("remove all items before testing", Cheat:getInventoryItemCount() == 0)

    -- TODO: See if we can change an items owner.

    -- Add a dagger1, which is in g_ownstolen_cat_ids
    Cheat:testAssert("cheat_own_stolen_items setup 13.1", Cheat:cheat_add_item("exact:" .. Cheat.g_dagger1_id))
    Cheat:testAssert("cheat_own_stolen_items setup 13.2", Cheat:getInventoryItemCount() == 1)

    -- Execute cheat_own_stolen_items
    Cheat:testAssert("cheat_own_stolen_items 13.3", Cheat:cheat_own_stolen_items())

    -- Assert that the item count is still 1 (item not removed, ownership changed, assuming function logic works)
    Cheat:testAssert("cheat_own_stolen_items 13.4", Cheat:getInventoryItemCount() == 1)
end

function Cheat:test_cheat_inventory_backup_restore()
    Cheat:removeAllItems()

    -- delete any existing backup
    Cheat.g_user_items = nil

    Cheat:testAssert("cheat_backup_inventory 14.1", Cheat:cheat_add_item("exact:" .. Cheat.g_cheesecake .. " amount:2 condition:10"))
    Cheat:testAssert("cheat_backup_inventory 14.2", Cheat:cheat_add_item("exact:" .. Cheat.g_bread_id .. " amount:3 condition:90"))
    Cheat:testAssert("cheat_backup_inventory 14.3", Cheat:cheat_backup_inventory())

    Cheat:removeAllItems()

    Cheat:testAssert("cheat_restore_inventory 14.4", Cheat:cheat_restore_inventory())
    Cheat:testAssert("cheat_restore_inventory 14.5", Cheat:getInventoryItemCount() == 2)
    Cheat:testAssert("cheat_restore_inventory 14.6", Cheat:getUserItem(Cheat.g_cheesecake, 2, 10))
    Cheat:testAssert("cheat_restore_inventory 14.7", Cheat:getUserItem(Cheat.g_bread_id, 3, 90))
end

function Cheat:test_can_create_item()
    -- canCreateItem - this function tests to see if an item can be added to an inventory
    Cheat:removeAllItems()
    Cheat:testAssert("testAddItem ok item", Cheat:canCreateItem("fd65fbb0-115b-4b63-a410-c235a69860a1"))
    Cheat:testAssertFalse("testAddItem blocked item", Cheat:canCreateItem("2cf06381-7692-4f3c-b917-e98dd3b5f8e3"))
end

function Cheat:test_cheat_add_all_items()
    -- this will freeze the game for a while

    -- cheat_add_all_items without quest flag
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_all_items no quest 1", Cheat:cheat_add_all_items())
    Cheat:testAssertEquals("cheat_add_all_items no quest 2", Cheat:getInventoryItemCount(), 4528)

    -- cheat_add_all_items with quest flag
    Cheat:removeAllItems()
    Cheat:testAssert("cheat_add_all_items quest 1", Cheat:cheat_add_all_items())
    Cheat:testAssertEquals("cheat_add_all_items quest 2", Cheat:getInventoryItemCount(), 4528)
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_items.lua loaded")
