local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/BeaglewareTM/UILibrary/refs/heads/main/BeaglewareTM"))()

local win = lib:Window("BeaglewareTM", Enum.KeyCode.RightControl, {
    Reload = "https://raw.githubusercontent.com/BeaglewareTM/UILibrary/refs/heads/main/Hub.lua",
})

local main = win:Tab("Main")
local player = win:Tab("Player")
local movement = player:SubTab("Movement")
local combat = player:SubTab("Combat")

win:Settings()
win:PlayerList()
win:Stats()

local buttons = main:Section("Buttons", "Left")
local toggles = main:Section("Toggles", "Left")
local inputs = main:Section("Inputs", "Right")
local walking = movement:Section("Walking", "Left")
local aiming = combat:Section("Aim", "Left")


buttons:Button("Say hi", function()
    print("Hi!")
end)

buttons:Button("Teleport to spawn", function()
    print("Teleporting")
end, { Title = "Teleported", Content = "You were moved to spawn.", Type = "Success" })


toggles:Toggle("Auto farm", false, function(on)
    print("Auto farm:", on)
end)

toggles:Toggle("Infinite jump", false, function(on)
    print("Infinite jump:", on)
end, "Jump again in the air")

toggles:Toggle({
    Name = "Kill aura",
    Keybind = Enum.KeyCode.F,
    Callback = function(on)
        print("Kill aura:", on)
    end,
})

toggles:Toggle({
    Name = "Speed boost",
    Callback = function(on)
        print("Speed boost:", on)
    end,
    Slider = {
        Name = "Strength",
        Min = 16,
        Max = 100,
        Default = 40,
        Callback = function(value)
            print("Strength:", value)
        end,
    },
})

toggles:Toggle({
    Name = "Auto attack",
    Callback = function(on)
        print("Auto attack:", on)
    end,
    Dropdown = {
        Options = { "Nearest", "Lowest health", "Random" },
        Default = "Nearest",
        Callback = function(choice)
            print("Target:", choice)
        end,
    },
})

toggles:Checkbox("Hide name", false, function(on)
    print("Hide name:", on)
end)


walking:Slider("Walk speed", 16, 200, 16, function(value)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = value
    end
end)

walking:Slider({
    Name = "Delay",
    Description = "Time between actions",
    Min = 0,
    Max = 5,
    Default = 0.5,
    Increment = 0.1,
    Suffix = "s",
    Callback = function(value)
        print("Delay:", value)
    end,
})


inputs:Dropdown("Area", { "Spawn", "Forest", "Desert" }, function(choice)
    print("Area:", choice)
end, "Spawn")

inputs:MultiDropdown("Collect", { "Coins", "Gems", "Eggs", "Keys" }, function(list)
    print("Collect:", table.concat(list, ", "))
end, { "Coins" })

inputs:Textbox("Player name", "Type here...", function(text)
    print("Typed:", text)
end)

inputs:Keybind("Panic key", Enum.KeyCode.P, function()
    print("Panic!")
end)

inputs:Label("Info")
inputs:Paragraph("Tip", "Press RightCtrl to hide the menu.")

local level = inputs:ProgressBar("Level", 0)
level:Set(50)


aiming:ColorPicker("ESP colour", Color3.fromRGB(255, 179, 217), function(colour)
    print("Colour:", colour)
end)


lib:Notify("Loaded", "BeaglewareTM is ready.", "Success")

win:OnUnload(function()
    print("Menu closed")
end)
