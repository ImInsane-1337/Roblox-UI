local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local Window = Library:CreateWindow({
    Title = "Example",
    Footer = "v1.0.0", --small text in the bottom of page
    ToggleKeybind = Enum.KeyCode.RightControl,
    Center = true,
    AutoShow = true,
    Resizable = false, --not rezizeable
    Size = UDim2.fromOffset(700, 500) -- size of ui
})

local KeyTab = Window:AddKeyTab("Key System") -- use addkeytab because this will be for our key box
local InfoTab = Window:AddTab("Info", "info") -- this will be for how to get key
local UiTab = Window:AddTab("UI", "settings") -- to unload ui



KeyTab:AddLabel({
	Text = "Example Key Title\nDefault Key is 'yourkey'",
	DoesWrap = true,
	Size = 36,
})

local examplekey = "yourkey" --change this to any key [TIP: You can also use HWID Keys if you wanna earn money like Luarmor, Platoboost, PandaDevelopment, etc etc instead of a string, just replace the string to the variable to access the HWID Key System]
KeyTab:AddKeyBox(examplekey, function(Success)  --you can also add another variable to get the text currently in keybox, here is how: function(Success, RecivedKey) recived key is the input, a use for this would be for multiple keys at once, because success is a bool (if Sucsess then) but RecivedKey can be used as a string (if RecivedKey == your key)
	if Success then
      --this is for if the key is correct
      Library:Notify("Correct Key!", 5) 
      --you can also replace it with unloading ui and loading a script
	else
	  --this is if its wrong
	  Library:Notify("Incorrect Key!", 5) 
	end
end)

KeyTab:AddLabel({
    Text = "\nDon't have the key? Go to the <font color='rgb(0, 195, 255)'>Info</font> Tab!", --or any text on how to get key
    DoesWrap = true,
    Size = 16,
})

local LeftGroupbox = InfoTab:AddLeftGroupbox("How To Get Key", "key")

local WrappedLabel = LeftGroupbox:AddLabel({
    Text = "Heres where you can add your text on how you can get key! You can use buttons and a setclipboard() fuction to copy the link, here are the example buttons you can use for copying key links! (does not actually copy, just prints)",
    DoesWrap = true
})

local Button = LeftGroupbox:AddButton({
    Text = "<font color='rgb(255, 172, 28)'>Linkvertise</font>",
    Func = function()
        print("Copied Linkvertise!")
    end,
    DoubleClick = false -- Requires double-click
})


--OPTIONAL: Additional buttons to copy links
Button:AddButton({
    Text = "<font color='rgb(0, 255, 0)'>work.inc</font>",
    Func = function()
        print("Copied work.inc!!")
    end
})

local RightGroupbox = InfoTab:AddRightGroupbox("Help", "info")

RightGroupbox:AddLabel({
    Text = "Optional: Copies Discord Link, Great if users are having trouble getting key!",
    DoesWrap = true
})

local Button = RightGroupbox:AddButton({
    Text = "Copy Discord",
    Func = function()
        print("Copied Discord!")
    end,
    DoubleClick = false -- Requires double-click for risky actions
})


local UIGroupbox = UiTab:AddLeftGroupbox("Menu", "settings")

local KeyLabel = UIGroupbox:AddLabel("Menu Bind") --creates a label to attach keybind since it cant be standalone

local Keybind = KeyLabel:AddKeyPicker("MyKeybind", {
    Default = "MB2",
    Text = "Menu Bind",
    Mode = "Toggle", -- Options: "Toggle", "Hold", "Always"
    
    -- Sets the toggle's value according to the keybind state if Mode is Toggle
    SyncToggleState = false,
    
    Callback = function(Value)
        Library:Unload()
    end
})

local Button = UIGroupbox:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end,
    DoubleClick = false -- Requires double-click for risky actions
})
