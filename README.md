<div align="center">
    <a><img src="/APointProven.svg" alt="APointProven" height="200" /></a>
<div>&nbsp;</div>

# RBX Snippets
</div>
This repo is simply just a bunch of functions that I believe have multiple use cases.

As I create more functions that are used throughout my projects, I will add them here :D!

Eventually I will be open to pull requests, but for now, here are my functions:

## [CFrameToAngles](src/CFrameToAngles.lua)

```lua
function Convert(xa, ya, za)
    return CFrame.Angles(math.rad(xa), math.rad(ya), math.rad(za))
end
```

This function simply converts `CFrame` degree input to radians

## [CheckInTable](src/CheckInTable.lua)
```lua
function checkTable(tbl, check: any)
    local bool = true
    for _, v in pairs(tbl) do
	if check then
	    if v ~= check then
		bool = false
	    end
	else
	    if v == nil then
		bool = false
	    end
	end
    end
    return bool
end
```
Allows you to check if all values inside of a `tbl` matches the `check` argument. If no `check` argument is passed then it defaults to seeing if the value exists.

## [GetDictionaryLength](src/GetDictionaryLength.lua)

```lua
local function Length(dictionary)
    local count = 0
    for _,_ in pairs (dictionary) do
	count += 1
    end
    return count
end
```

Since you can't use the `#` symbol on dictionaries, this function adds to the `count` for every index iteration

## [GrabNearbyPlayers](src/GrabNearbyPlayers.lua)

```lua
local Players = game:GetService("Players")
local function grabPlayers(plr: Player, distance: number)
    local Close = {}
    local rootPos: Vector3 = ...
    for _,v  in pairs(Players:GetPlayers()) do
       ... -- omitted due to size
    end
    return Close
end
```
<span style='color:orange'>

**SEE FULL FUNCTION IN SRC**

</span>

This function interates through the `Players` service and adds players near the `plr` argument based on the `distance` argument you provide.

**Example of Use Case:**
```lua
for _,v in pairs(Close) do
    RemoteEvent:Fire(v, ...)
end
```
## [TimeToText](src/TimeToText.lua)

```lua
function Convert(s, bool) -- s(seconds), bool(whether you want hours or not)
    local mins = string.format("%02i:%02i", s/60%60, s%60)
    local hrs = string.format("%02i:%02i:%02i", s/60^2, s/60%60, s%60)
    if bool == nil then
        if (s/60^2) < 1 then
            return mins
        else
            return hrs
        end
    end
    if bool then return hrs end
end
```
This function serves as an easy way to convert seconds into a clock time format for UserInterfaces.

**Example of Use Case:**
```lua
TextLabel.Text = Convert(300)
-- Equates to 05:00

TextLabel.Text = Convert(300, true)
-- Equates to 00:05:00
```
## CopyAndMerge

```lua
-- Copying
local function copy(original)
    local newCopy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            v = copy(v)
        end 
        newCopy[k] = v
    end
    return newCopy
end

-- Merging
return function (original, overrides)
    local newCopy = copy(original)
    for k, v in pairs(overrides) do
        newCopy[k] = v
    end
    return newCopy
end
```
A way to reuse values from dictionaries without OOP.

**Example of Use Case:**
```lua
local merge = require(CopyAndMerge)

local Person1 = {
    name = "Jack",
    city = "Houston",
    state = "Texas",
    hobby = "Golfing"
}
local Person2 = merge(Person1, {
    name = "Cathy",
    hobby = "Biking"
})
```
