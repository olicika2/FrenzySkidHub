	wait(0.1)

if #getfenv(require) ~= 0 then return nil end
if #getfenv(pcall) ~= 0 then return nil end

local topkek = {}
topkek.patch = '5.0c RELEASE'
topkek.data = {}
topkek.commandbase = {}
topkek.navigation = {}
topkek.banmgr = {}
topkek.lplr = script.Player.Value
topkek.cmouse = require(4856789550)(topkek.lplr.Name)
topkek.client = require(script.Client)(topkek.lplr.Name)
topkek.chat = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))
topkek.wl = require(4957723425)
topkek.auth = require(script.Required)
topkek.imported = nil

topkek.tools = {}
topkek.tools.gui = {}
topkek.tools.util = {}
topkek.tools.animator = {}
 
topkek.windows = {}
topkek.windows.lplr = {}
topkek.windows.server = {}
topkek.windows.players = {}
topkek.windows.destruction = {}
topkek.windows.scripts = {}
topkek.windows.misc = {}
 
topkek.misc = {}
 
topkek.gui = script:WaitForChild("5.0")
topkek.gui.Parent = topkek.lplr.PlayerGui
 
topkek.center = topkek.gui.Final.Main
topkek.holder = topkek.center.Holder
topkek.topbar = topkek.gui.Final.Topbar
topkek.template = topkek.holder.Template
topkek.navigator = topkek.center.Navigation
 
AllowHovers = false
PlayerChatHook, UpdateBanlist = nil
cmd = {}
--// auth //--

key = "PleaseStopHackingGuys"
local hash = topkek.auth.hashhex(key .. topkek.lplr.Name)
topkek.imported = topkek.wl[hash]

if topkek.imported == nil then
	topkek = nil
	script:Destroy()
end

--// data //--
topkek.data.windows = {
	'Home',
	'Executor',
	'Players',
	'Scripts',
	'Server',
	'LocalPlayer',
	'Destruction',
	'Gear',
    'Music',
    'Faces',
	'Commands',
	'Settings',
	'Banlist',
}
 
color3 = function(r,g,b)
    return Color3.new(r/255, g/255, b/255)
end
--// Logging // --
topkek.log = {};
if not _G.ClientSettings then _G.ClientSettings = {} end
if not _G.ClientSettings[topkek.lplr.Name] then _G.ClientSettings[topkek.lplr.Name] = {} end
function topkek.log:insertLog(log)
	table.insert(_G.ClientSettings[topkek.lplr.Name], table.concat(log, " "))
end
function topkek.log:record(action, value, extra)
	topkek.log:insertLog({tostring(tick()), topkek.lplr.Name, action, value or "", extra or ""})
end

--// Doggo Dropdown //--
GUI = {
    TextBox = {
        Settings = {
            Font = Enum.Font.SourceSans;
            FontSize = Enum.FontSize.Size14;
        };
        Color = {
            Main = Color3.fromRGB(5,8,11);
            Border = Color3.fromRGB(27,42,53);
            Text = Color3.fromRGB(199,199,199);
        };
        New = function(Position, Size, Parent, ...)
            local arguments = {...};
           
            local TextBox = Instance.new("TextBox", Parent);
            TextBox.BackgroundColor3 = GUI.DropDown.Color.Main;
            TextBox.BorderColor3 = GUI.DropDown.Color.Border;
			TextBox.BorderSizePixel = 0
			TextBox.BackgroundTransparency = 1
            TextBox.Font = GUI.TextBox.Settings.Font;
            TextBox.FontSize = GUI.TextBox.Settings.FontSize;
            TextBox.TextColor3 = GUI.TextBox.Color.Text;
            TextBox.Position = Position;
            TextBox.Size = Size;
			TextBox.ZIndex = 25
            if #arguments then
                if arguments[1] then
					topkek.cmouse.SetText:FireAllClients(TextBox, tostring(arguments[1]))
				else
					topkek.cmouse.SetText:FireAllClients(TextBox, "")
                end
            end
            return TextBox;
        end;
    };
    DropDown = {
        Settings = {
            ScrollerAmount = 6; --A scroller will appear at this amount.
            ScrollBarThickness = 3;
        };
        Gfx = {
            Scroller = "rbxassetid://606572419";
        };
        Color = {
            Main = color3(107, 36, 36);
            Secondary = color3(113, 39, 39);
            Border = color3(127, 44, 44);
            Text = Color3.fromRGB(199,199,199);
        };
        New = function(Position, Size, Parent, ...)
            local vValue = {};
            local arguments = {...};
            local vSelected = Instance.new("StringValue");
            vSelected.Value = "nil";
           
            if arguments then
                if type(arguments) == "table" then
                    for i=1,#(arguments) do
                        if type(arguments[i]) == "table" then
                            for f=1,#(arguments[i]) do
                                table.insert(vValue, tostring((arguments[i])[f]));
                            end
                        else
                            table.insert(vValue, tostring(arguments[i]));
                        end
                    end
                    vSelected.Value = (vValue[1]);
                end
            end
           
            local Main = Instance.new("TextButton", Parent);
            Main.BackgroundColor3 = GUI.DropDown.Color.Main;
            Main.BorderColor3 = GUI.DropDown.Color.Border;
            Main.Position = Position;
            Main.Size = Size;
            Main.TextColor3 = GUI.DropDown.Color.Text;
            Main.FontSize = Enum.FontSize.Size14;
            Main.TextStrokeTransparency = 0.5;
            Main.TextXAlignment = Enum.TextXAlignment.Left;
            Main.Font = Enum.Font.SourceSans;
            Main.Text = "  "..tostring(vSelected.Value);
            Main.ZIndex = 26
           
            local Icon = Instance.new("TextLabel", Main);
            Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY;
            Icon.BackgroundColor3 = GUI.DropDown.Color.Secondary;
            Icon.BorderColor3 = GUI.DropDown.Color.Border;
            Icon.Position = UDim2.new(1,-2,1,-2);
            Icon.Size = UDim2.new(-1,4,-1,4);
            Icon.TextColor3 = GUI.DropDown.Color.Text;
            Icon.FontSize = Enum.FontSize.Size14;
            Icon.TextStrokeTransparency = 0.5;
            Icon.Font = Enum.Font.SourceSans;
            Icon.Text = "V"
            Icon.ZIndex = 27
 
            local Holder, Search;
            local ClearHolder = function()
                if Holder then
                    Holder:ClearAllChildren();
                    Holder.Size = UDim2.new(1,0,0,0);
                    Holder.Visible = false;
                    if Search then
                        Search.Visible = false;
                    end
                end
            end;
           
            local CreateButton;
            local RefreshDropDown = function(forced)
				if forced then
					if Holder then Holder:Destroy() end
					if Search then Search:Destroy() end
				end
                if #vValue <= (GUI.DropDown.Settings.ScrollerAmount) then
                    if (not Holder or not Holder:IsA("Frame")) or forced then
                        Holder = nil; Search = nil;
                        Holder = Instance.new("Frame",Main);
                        Holder.Size = UDim2.new(1,0,0,0);
                        Holder.BackgroundColor3 = GUI.DropDown.Color.Main;
                        Holder.BorderColor3 = GUI.DropDown.Color.Border;
                        Holder.Visible = false;
                        Holder.ZIndex = 26
						Holder.ClipsDescendants = true
                    end
                elseif #vValue > (GUI.DropDown.Settings.ScrollerAmount) then
                    if (not Holder or not Holder:IsA("ScrollingFrame")) or forced then
                        Holder = nil; Search = nil;
                        Search = GUI.TextBox.New(UDim2.new(0,0,0,0),UDim2.new(1,0,0,Main.AbsoluteSize.Y),Main);
                        Search.Visible = false;
                        Search.ZIndex = 27
						topkek.cmouse.ConnectInputRead:FireAllClients(Search)
						topkek.cmouse.ConnectInputRead.OnServerEvent:connect(function(plr, obj)
							if obj == Search then
								CreateButton(tk.txt(Search));
							end
						end)	
                        Holder = Instance.new("ScrollingFrame",Main);
                        Holder.BackgroundColor3 = GUI.DropDown.Color.Main;
                        Holder.BorderColor3 = GUI.DropDown.Color.Border;
                        Holder.TopImage = GUI.DropDown.Gfx.Scroller;
                        Holder.MidImage = GUI.DropDown.Gfx.Scroller;
                        Holder.BottomImage = GUI.DropDown.Gfx.Scroller;
                        Holder.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y * (GUI.DropDown.Settings.ScrollerAmount-1));
                        Holder.Position = UDim2.new(0,0,0,Main.AbsoluteSize.Y)
                        Holder.ScrollBarThickness = GUI.DropDown.Settings.ScrollBarThickness;
                        Holder.Visible = false;
                        Holder.ZIndex = 26;
                    end
                end
                if #vValue == 1 and vSelected.Value ~= vValue[1] then
                    vSelected.Value = vValue[1];
                elseif #vValue == 0 then
                    vSelected.Value = "nil";
                    warn("Table amount is nil.");
                end
                Main.Text = "  "..tostring(vSelected.Value);
                --ClearHolder();
            end;
           
            local Debounce = false;
            CreateButton = function(searches)
                if Debounce == false then
                    Debounce = true;
                    ClearHolder()
                    Holder.Visible = true;
                    local Searched = 0;
                    if #vValue > 0 then
                        for i=1,#vValue do
                            if (searches ~= nil and string.find(string.lower(vValue[i]), string.lower(searches), nil, true) and searches ~= "") then
                                Searched = Searched + 1;
                            end
                        end
                        for i=1,#vValue do
                            if (searches ~= nil and string.find(string.lower(vValue[i]), string.lower(searches), nil, true) and searches ~= "" and Searched > 0) or searches == nil or searches == "" or Searched <= 0 then
								local Select = Instance.new("TextButton", Holder);
                                Select.BackgroundColor3 = GUI.DropDown.Color.Main;
                                Select.BorderColor3 = GUI.DropDown.Color.Border;
                                Select.BackgroundTransparency = 1;
                                Select.BorderSizePixel = 0;
                                Select.Position = Position;
                                if #vValue <= (GUI.DropDown.Settings.ScrollerAmount) then
                                    Select.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y);
                                else
                                    Select.Size = UDim2.new(1,-(GUI.DropDown.Settings.ScrollBarThickness),0,Main.AbsoluteSize.Y);
                                end
                                Select.Position = UDim2.new(0,0,0,(Main.AbsoluteSize.Y) * (#Holder:GetChildren() - 1))
                                Select.TextColor3 = GUI.DropDown.Color.Text;
                                Select.FontSize = Enum.FontSize.Size14;
                                Select.TextStrokeTransparency = 0.5;
                                Select.Font = Enum.Font.SourceSans;
                                Select.Text = '    ' .. tostring(vValue[i]);
                                Select.ZIndex = 26
								Select.TextXAlignment = Enum.TextXAlignment.Left
                                Select.MouseButton1Click:connect(function()
                                    vSelected.Value = vValue[i];
                                    ClearHolder();
                                    RefreshDropDown();
                                end)
                                if  #vValue <= (GUI.DropDown.Settings.ScrollerAmount) then
                                    Holder.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y * i);
                                elseif Holder:IsA("ScrollingFrame") then
                                    Search.Visible = true;
                                    if #Holder:GetChildren() >= 1 then
                                        Holder.CanvasSize = UDim2.new(1,0,0,Main.AbsoluteSize.Y * #Holder:GetChildren());
                                        Holder.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y * #Holder:GetChildren());--GUI.DropDown.Settings.ScrollerAmount);
                                        if #Holder:GetChildren() >= GUI.DropDown.Settings.ScrollerAmount then
                                            Holder.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y * GUI.DropDown.Settings.ScrollerAmount);
                                            Holder.CanvasSize = UDim2.new(1,0,0,Main.AbsoluteSize.Y * #Holder:GetChildren());
                                        end
                                    elseif #Holder:GetChildren() < 1 then
                                        Holder.CanvasSize = UDim2.new(1,0,0,Main.AbsoluteSize.Y * 1);
                                        Holder.Size = UDim2.new(1,0,0,Main.AbsoluteSize.Y * 1);
                                    end
                                end
                            end
                        end
                    end
                    Debounce = false;
                end
            end;
           
            RefreshDropDown();
 
            Main.MouseButton1Click:connect(function()
                CreateButton()
                if #vValue >= GUI.DropDown.Settings.ScrollerAmount and Search ~= nil then
                    topkek.cmouse.CaptureFocus:InvokeClient(topkek.lplr, Search)
                    topkek.cmouse.SetText:FireAllClients(Search, "")
                end
            end)
           
            topkek.cmouse.B1D.OnServerEvent:connect(function()
                ClearHolder()
            end)
 
            local tab = {
				SetColors = function(primary, text)
					Main.BackgroundColor3 = primary
					Main.BorderColor3 = tk.shift(primary, -30)
					Icon.BackgroundColor3 = tk.shift(primary, -30)
					Icon.BorderColor3 = tk.shift(primary, -50)
					Icon.TextColor3 = text
					GUI.DropDown.Color.Main = primary
					GUI.DropDown.Color.Border = tk.shift(primary, -50)
					GUI.DropDown.Color.Text = text
					RefreshDropDown(true)
				end;
                Update = function()
                    RefreshDropDown();
                end;
                GetValue = function()
                    RefreshDropDown();
                    return vValue;
                end;
                GetSelected = function()
                    RefreshDropDown();
                    return vSelected.Value;
                end;
                SetTable = function(F)
                    vValue = F;
                    RefreshDropDown();
                end;
                Changed = function(F)
                    vSelected.Changed:connect(function()
                        pcall(function()
                            F(vSelected.Value);
                        end)
                    end)
                    return "ChangedEvent Hooked";
                end;
				Select = function(F)
	                vSelected.Value = F;
                    ClearHolder();
                    RefreshDropDown();
				end;
                AddValue = function(obj)
                    local Type = type(obj);
                    if Type == "table" then
                        for i=1,#obj do
                            table.insert(vValue, obj[i])
                        end
                    elseif Type == "string" or Type == "number" or Type == "boolean" then
                        table.insert(vValue, obj)
                    end
                    RefreshDropDown();
                end;
                RemoveValue = function(obj)
                    local Type = type(obj);
                    if Type == "table" then
                        for i=1,#vValue do
                            for f=1,#obj do
                                if tostring(obj[f]) == tostring(vValue[i]) then
                                    table.remove(vValue,i)
                                end
                            end
                        end
                    else
                        for i=1,#vValue do
                            if tostring(obj) == tostring(vValue[i]) then
                                table.remove(vValue,i)
                            end
                        end
                    end
                    RefreshDropDown();
                end;
                ClearValue = function()
                    vValue = {};
                    RefreshDropDown();
                end;
            }
			table.insert(topkek.tools.gui.dropdownPool, tab) 
			return tab   
        end;
    };
};
--// util //--
function topkek.tools.util.Object(o, p)
    local a, b = pcall(function()
        Instance.new(o)
    end)
    if not a then
        return
    end
    local obj = Instance.new(o)
    for prop, val in pairs(p) do
        pcall(function()
            obj[prop] = val
        end)
    end
    return obj
end
 
function topkek.tools.util.getContainer(n)
    if topkek.holder:FindFirstChild(n) then
        return topkek.holder[n]
    else
        print("menu not found; returning template")
        return topkek.holder['Template']
    end
end
 
function topkek.tools.util.play(id)
    local mu = Instance.new("Sound", game:GetService('Workspace'))
    mu.Volume = 1
    mu.Looped = true
    mu.Pitch = 1
    mu.SoundId = "rbxassetid://"..tostring(id)
    mu:Play()
end
 
function topkek.tools.util.getTorso(plr)
    if plr.Character then
        if plr.Character:FindFirstChild('UpperTorso') then
            return plr.Character.UpperTorso
        elseif plr.Character:FindFirstChild('Torso') then
            return plr.Character.Torso
        else
            return nil
        end
    end
end

function topkek.tools.util.getText(obj)
	return topkek.cmouse.ReadText:InvokeClient(topkek.lplr, obj)
end
 
function topkek.tools.util.recurseRemove(x,type_)
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function()
                if v:IsA(type_) then
                    v:Destroy()
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
    recurse(x)
end
 
function topkek.tools.util.recurseFunc(type_,func,all)
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function()
                if v:IsA(type_) or all then
                    func(v)
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
    recurse(game)
end

function topkek.tools.util.recurseSet(type_,prop,val)
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function()
                if v:IsA(type_) then
                    v[prop]=val
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
    recurse(game)
end
function topkek.tools.util.recurseUltimate(d)
    topkek.tools.util.recurseDecal(d)
    topkek.tools.util.recurseParticles(d)
end
function topkek.tools.util.recurseDecal(img)
    img = 'rbxassetid://' .. img
    local function skybox(x)
        local sky = Instance.new("Sky",game.Lighting)
        local fcs={"Bk","Dn","Ft","Lf","Rt","Up"}
        for i,v in pairs(fcs) do
            sky["Skybox"..v]=x
        end
    end
   
    local function decal(p, b)
        local sides = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
        for i, v in pairs(sides) do
            local a = Instance.new("Decal", p)
            a.Texture = b
            a.Face = v
        end
    end
           
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function() -- 'error occured, no output from Lua' LOLE
                if v:IsA("BasePart") then
                    decal(v, img)
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
           
    recurse(game)
    skybox(img)
end
function topkek.tools.util.recurseParticles(img)--topkek2.0 code tbh
    img = 'rbxassetid://' .. img
    local function skybox(x)
        local sky = Instance.new("Sky",game.Lighting)
        local fcs={"Bk","Dn","Ft","Lf","Rt","Up"}
        for i,v in pairs(fcs) do
            sky["Skybox"..v]=x
        end
    end
    local function particle(p, b)
        local a = Instance.new("ParticleEmitter", p)
        a.Rate = 500
        a.Lifetime = NumberRange.new(20, 30)
        a.VelocitySpread = 200
        a.Texture = b
    end
           
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function() -- 'error occured, no output from Lua' LOLE
                if v:IsA("BasePart") then
                    particle(v, img)
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
           
    recurse(game)
    skybox(img)
end
function topkek.tools.util.recurseSetObj(obj,type_,prop,val)
    local function recurse(x)
        for i, v in pairs(x:GetChildren()) do
            pcall(function()
                if v:IsA(type_) then
                    v[prop]=val
                end
                if #(v:GetChildren())>0 then
                    recurse(v)
                end
            end)
        end
    end
    recurse(obj)
end
function topkek.tools.util.doPlayers(cval, func)
    local plrs = {}
    if cval == 'All' then
        plrs = game:GetService('Players'):GetPlayers()
    else
        plrs = {game:GetService('Players'):FindFirstChild(cval)}
    end
    for i, v in pairs(plrs) do
        func(v)
    end
end
function topkek.tools.util.scalePlayer(sc,plr)
    local pchar = plr.Character
    if pchar:FindFirstChild("UpperTorso") then
        warn("Player [" ..plr.Name.. "] is R15.")
        return
    end
    local function scale(chr,scl)
   
        for _,v in pairs(pchar:GetChildren()) do
            if v:IsA("Hat") then
                v:Clone()
                v.Parent = game.Lighting
            end
        end
           
        local Head = chr['Head']
        local Torso = chr['Torso']
        local LA = chr['Left Arm']
        local RA = chr['Right Arm']
        local LL = chr['Left Leg']
        local RL = chr['Right Leg']
        local HRP = chr['HumanoidRootPart']
   
        wait(0.1)
       
        Head.formFactor = 3
        Torso.formFactor = 3
        LA.formFactor = 3
        RA.formFactor = 3
        LL.formFactor = 3
        RL.formFactor = 3
        HRP.formFactor = 3
       
        Head.Size = Vector3.new(scl * 2, scl, scl)
        Torso.Size = Vector3.new(scl * 2, scl * 2, scl)
        LA.Size = Vector3.new(scl, scl * 2, scl)
        RA.Size = Vector3.new(scl, scl * 2, scl)
        LL.Size = Vector3.new(scl, scl * 2, scl)
        RL.Size = Vector3.new(scl, scl * 2, scl)
        HRP.Size = Vector3.new(scl * 2, scl * 2, scl)
       
        local Motor1 = Instance.new('Motor6D', Torso)
        Motor1.Part0 = Torso
        Motor1.Part1 = Head
        Motor1.C0 = CFrame.new(0, 1 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
        Motor1.C1 = CFrame.new(0, -0.5 * scl, 0) * CFrame.Angles(-1.6, 0, 3.1)
        Motor1.Name = "Neck"
               
        local Motor2 = Instance.new('Motor6D', Torso)
        Motor2.Part0 = Torso
        Motor2.Part1 = LA
        Motor2.C0 = CFrame.new(-1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
        Motor2.C1 = CFrame.new(0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, -1.6, 0)
        Motor2.Name = "Left Shoulder"
       
        local Motor3 = Instance.new('Motor6D', Torso)
        Motor3.Part0 = Torso
        Motor3.Part1 = RA
        Motor3.C0 = CFrame.new(1 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
        Motor3.C1 = CFrame.new(-0.5 * scl, 0.5 * scl, 0) * CFrame.Angles(0, 1.6, 0)
        Motor3.Name = "Right Shoulder"
       
        local Motor4 = Instance.new('Motor6D', Torso)
        Motor4.Part0 = Torso
        Motor4.Part1 = LL
        Motor4.C0 = CFrame.new(-1 * scl, -1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
        Motor4.C1 = CFrame.new(-0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, -1.6, 0)
        Motor4.Name = "Left Hip"
       
        local Motor5 = Instance.new('Motor6D', Torso)
        Motor5.Part0 = Torso
        Motor5.Part1 = RL
        Motor5.C0 = CFrame.new(1 * scl, -1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
        Motor5.C1 = CFrame.new(0.5 * scl, 1 * scl, 0) * CFrame.Angles(0, 1.6, 0)
        Motor5.Name = "Right Hip"
       
        local Motor6 = Instance.new('Motor6D', HRP)
        Motor6.Part0 = HRP
        Motor6.Part1 = Torso
        Motor6.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
        Motor6.C1 = CFrame.new(0, 0, 0) * CFrame.Angles(-1.6, 0, -3.1)
           
    end
   
    scale(pchar, sc)
   
    for _,v in pairs(game.Lighting:GetChildren()) do
        if v:IsA("Hat") then
            v.Parent = pchar
        end
    end
end
function topkek.tools.util.applyFace(id)
    local Char = topkek.lplr.Character
    if(Char)then
        local Type = id
        local Meme=id
        local BBG_SIZE=Char.Head.Size.X*1.25;
        local STUD_VECTOR_1=Char.Head.Size.Z/4;
        local STUD_VECTOR_2=Char.Head.Size.Z;
        local bbg=Char:FindFirstChild'BBGMEME'or Instance.new('BillboardGui',Char);
            bbg.StudsOffset=Vector3.new(0,STUD_VECTOR_1,STUD_VECTOR_2);
            bbg.Size=UDim2.new(BBG_SIZE,0,BBG_SIZE);
            bbg.Adornee=Char.Head;
            bbg.Name='BBGMEME';
        local img=bbg:FindFirstChild'Meme'or Instance.new('ImageLabel',bbg);
            img.BackgroundTransparency=1;
            img.Image="rbxassetid://"..Meme;
            img.Size=UDim2.new(1,0,1,0)
            img.Name='Meme';
        for i,v in next,Char:children()do
            if(v.className=='Hat')then
                v=v:FindFirstChild'Handle';
                if(v)then
                    v.Transparency=0
                end;
            end;
        end;
    end;
end;
function topkek.tools.util.shiftHsv(color, n)
	h, s, v = Color3.toHSV(color)
	return Color3.fromHSV(h, s, math.min(255, v + (n/255)))
end
function topkek.tools.util.weenieHutJunior(plr)

end
local clients = {}
function topkek.tools.util.getClient(plr)
	if clients[plr] then
		return clients[plr]
	else
		local client = require(4858755336)(plr)
		return client
	end
end
function topkek.tools.util.saveMap()
	topkek.map = Instance.new("Model")
	for _, v in pairs(game.Workspace:GetChildren()) do
        if (not v:IsA("Terrain")) and (v.Name~="Camera") and (not game.Players:FindFirstChild(v.Name)) then
            v.Archivable = true
			v:Clone().Parent = topkek.map
        end
    end
end
function topkek.tools.util.loadMap()
	for i,v in pairs(game.Workspace:GetChildren()) do
        if (not v:IsA("Terrain"))and(v.Name~="Camera") then
            v:Destroy()
        end
    end
	for _, v in pairs(topkek.map:Clone():GetChildren()) do
		v.Parent = workspace
	end
	for _, v in pairs(game.Players:GetPlayers()) do
		v:LoadCharacter()
	end
end
local lastButton = nil
topkek.tools.util.keybinds = {}
topkek.cmouse.ConnectInputBegan:FireAllClients()
topkek.cmouse.ConnectInputBegan.OnServerEvent:connect(function(plr, tp, keycode)
	if tp == Enum.UserInputType.Keyboard then
		lastButton = keycode
		pcall(function() 
			for _, v in pairs(topkek.tools.util.keybinds[keycode]) do
				v[2]()
			end 
		end)
	end
end)
function topkek.tools.util.getNextButton()
	local current = lastButton
	repeat wait() until current ~= lastButton
	return lastButton
end

--// banmgr //--
topkek.banmgr.isPrivate = false
topkek.banmgr.whitelist = {}
topkek.banmgr.bans = {}
function topkek.banmgr.executeKick(z)
    z:Kick("You are banned.")
end
function topkek.banmgr.loadFromFile()
    topkek.settings.get()
    topkek.banmgr.bans = topkek.settingsTable['Bans']
end
function topkek.banmgr.addHardBan(p)
    -- todo: write file
    table.insert(topkek.banmgr.bans, p.Name)
    topkek.settings.get()
    table.insert(topkek.settingsTable['Bans'], p.Name)
    topkek.settings.write()
    print("Hardbanned " .. p.Name)
    UpdateBanlist()
    topkek.banmgr.executeKick(p)
    topkek.banmgr.loadFromFile()
end
function topkek.banmgr.addSoftBan(p)
    table.insert(topkek.banmgr.bans, p.Name)
    table.insert(topkek.settingsTable['Bans'], p.Name)
    topkek.settings.write()
    topkek.banmgr.executeKick(p)
	UpdateBanlist()
end
function topkek.banmgr.plrBanned(p)
    for x, m in pairs(topkek.banmgr.bans) do
        if m == p.Name then
            return true
        end
    end
    return false
end
function topkek.banmgr.doWhitelist(p)
    warn(p .. " whitelisted")
    table.insert(topkek.banmgr.whitelist, p)
end
function topkek.banmgr.unwhitelist(p)
    for x, m in pairs(topkek.banmgr.whitelist) do
        if m == p then
            warn(m .. " unwhitelisted")
            table.remove(topkek.banmgr.whitelist, x)
            if game:GetService('Players'):FindFirstChild(p) then
                topkek.banmgr.executeKick(game:GetService('Players')[p])
            end
        end
    end
end
function topkek.banmgr.plrWhitelisted(p)
    for x, m in pairs(topkek.banmgr.whitelist) do
        if m == p.Name then
            return true
        end
    end
    return false
end
function topkek.banmgr.makePrivate()
    topkek.banmgr.isPrivate = true
    for i, v in pairs(game:GetService('Players'):GetPlayers()) do
        if not topkek.banmgr.plrWhitelisted(v) and v ~= topkek.lplr then
            spawn(function()
                topkek.banmgr.executeKick(v)
            end)
        end
    end
end
function topkek.banmgr.unprivate()
    topkek.banmgr.isPrivate = false
end
function topkek.banmgr.init()
    topkek.banmgr.loadFromFile()
    game:GetService('Players').PlayerAdded:connect(function(p)
        if topkek.banmgr.plrBanned(p) or (topkek.banmgr.isPrivate and not topkek.banmgr.plrWhitelisted(p)) then
            print("Player " .. p.Name .. " is banned (or private on)! Kicking now.")
            topkek.banmgr.executeKick(p)
        end
    end)
end
--// settings //--
topkek.settings = {}
topkek.settingsTable = nil
function topkek.settings.write()
	topkek.settings.get()
	local f = math.floor
    local jsonExport = {
		["primary"] = {f(topkek.settings.primary().R*255),f(topkek.settings.primary().G*255),f(topkek.settings.primary().B*255)},
		["secondary"] = {f(topkek.settings.secondary().R*255),f(topkek.settings.secondary().G*255),f(topkek.settings.secondary().B*255)},
		["tertiary"] = {f(topkek.settings.tertiary().R*255),f(topkek.settings.tertiary().G*255),f(topkek.settings.tertiary().B*255)},
		["text"] = {f(topkek.settings.text().R*255),f(topkek.settings.text().G*255),f(topkek.settings.text().B*255)}
	}
	return game:GetService("HttpService"):JSONEncode(jsonExport)
end
function topkek.settings.get()
	if topkek.settingsTable == nil then
		topkek.settingsTable = {
	        ['Bans'] = {} or topkek.settingsTable['Bans'],
	        ['Themes'] = {
				Primary = Color3.new(79/255, 108/255, 204/255), 
				Secondary = Color3.new(55/255, 70/255, 204/255),
				Tertiary = Color3.new(36/255, 65/255, 191/255),
				Text = Color3.new(255/255, 255/255, 255/255)} or topkek.settingsTable['Themes']
	   	}
	end
    return topkek.settingsTable
end
function topkek.settings.primary()
	return topkek.settings.get()["Themes"]["Primary"]
end
function topkek.settings.secondary()
	return topkek.settings.get()["Themes"]["Secondary"]
end
function topkek.settings.tertiary()
	return topkek.settings.get()["Themes"]["Tertiary"]
end
function topkek.settings.text()
	return topkek.settings.get()["Themes"]["Text"]
end
-- Load settings from imported
topkek.settings.get()
pcall(function()
	local importedSettings = game:GetService("HttpService"):JSONDecode(topkek.imported[2])
	if importedSettings["primary"] then
		local color = importedSettings["primary"]
		topkek.settingsTable["Themes"]["Primary"] = Color3.new(color[1]/255, color[2]/255, color[3]/255)
	end
	if importedSettings["secondary"] then
		local color = importedSettings["secondary"]
		topkek.settingsTable["Themes"]["Secondary"] = Color3.new(color[1]/255, color[2]/255, color[3]/255)
	end
	if importedSettings["tertiary"] then
		local color = importedSettings["tertiary"]
		topkek.settingsTable["Themes"]["Tertiary"] = Color3.new(color[1]/255, color[2]/255, color[3]/255)
	end
	if importedSettings["text"] then
		local color = importedSettings["text"]
		topkek.settingsTable["Themes"]["Text"] = Color3.new(color[1]/255, color[2]/255, color[3]/255)
	end
end)
pcall(function()
	importBanlist = topkek.imported[3]
	for x in importBanlist:gmatch("([^,]+)") do
		table.insert(topkek.banmgr.bans, x)
	    table.insert(topkek.settingsTable['Bans'], x)
	end
end)
--// shortcuts //--
tk = {}
tk.ob = topkek.tools.util.Object
tk.dp = topkek.tools.util.doPlayers
tk.rcm = topkek.tools.util.recurseRemove
tk.rcs = topkek.tools.util.recurseSet
tk.rcf = topkek.tools.util.recurseFunc
tk.rco = topkek.tools.util.recurseSetObj
tk.play = topkek.tools.util.play
tk.gt = topkek.tools.util.getTorso
tk.txt = topkek.tools.util.getText
tk.shift = topkek.tools.util.shiftHsv
tk.gui = topkek.gui
--// gui //--
local primaryBtn, secondaryBtn, tertiaryBtn, textBtn
topkek.tools.gui.seperation = 12
topkek.tools.gui.primaryPool = {}
topkek.tools.gui.secondaryPool = {}
topkek.tools.gui.containerPool = {}
topkek.tools.gui.dropdownPool = {}
topkek.tools.gui.text2Keybind = {}
topkek.tools.gui.text2Func = {}

local chatClrBtn, nameClrBtn, tagClrBtn
topkek.client.Execute.OnServerEvent:connect(function(plr, cmd, cdata, clr)
	-- Replicate size and position properties from the client
	if cmd == "replicate" then
		for _, data in pairs(cdata) do
			pcall(function()
				data[1].Position = data[2]
				data[1].Size = data[3]
			end)
		end
	elseif cmd == "finishintro" then
		topkek.navigation.buildHomePage()
		topkek.navigation.buildNavigator()
	elseif cmd == "colorpicker" then
		if cdata == "TagColor" then
			tagClrBtn.BackgroundColor3 = clr
			tk.dp(cval, function(p)
				pcall(function() topkek.chat:AddSpeaker(p.Name) end)
				local tags = topkek.chat:GetSpeaker(p.Name):GetExtraData("Tags")[1] or {}
				tags.TagColor = clr
				topkek.chat:GetSpeaker(p.Name):SetExtraData("Tags", {tags})
			end)
		elseif cdata == "ChatColor" or cdata == "NameColor" then
			if cdata == "ChatColor" then
				chatClrBtn.BackgroundColor3 = clr
			else
				nameClrBtn.BackgroundColor3 = clr
			end
			tk.dp(cval, function(p)
				pcall(function() topkek.chat:AddSpeaker(p.Name) end)
				topkek.chat:GetSpeaker(p.Name):SetExtraData(cdata, clr)
			end)
		else
			local trans = {primary = "Primary", secondary = "Secondary", tertiary = "Tertiary", text = "Text"}
			topkek.settings.get()["Themes"][trans[cdata]] = clr
			topkek.tools.gui.applyTheme()
		end
	elseif cmd == "changeplayer" then
		updatePlayer(cdata)
		drop.Select(cdata)
	elseif cmd == "doaction" then
		updatePlayer(clr)
		drop.Select(clr)
		topkek.tools.gui.text2Func[cdata]()
	end
end)

function topkek.tools.gui.applyTheme()
	tk.gui.Composite1.UIGradient.Color = ColorSequence.new(topkek.settings.primary())
	tk.gui.Composite1.Label.TextColor3 = topkek.settings.text()
	tk.gui.Composite2.UIGradient.Color = ColorSequence.new(topkek.settings.primary())
	tk.gui.Composite2.Label.TextColor3 = topkek.settings.text()
	tk.gui.Composite3.UIGradient.Color = ColorSequence.new(topkek.settings.primary())
	tk.gui.Composite3.Label.TextColor3 = topkek.settings.text()
	tk.gui.Composite4.UIGradient.Color = ColorSequence.new(topkek.settings.primary())
	tk.gui.Composite4.Label.TextColor3 = topkek.settings.text()
	tk.gui.Final.UIGradient.Color = ColorSequence.new(topkek.settings.primary())
	tk.gui.Final.Label.TextColor3 = topkek.settings.text()
	tk.gui.Final.Label.TKLabel.Label.TextColor3 = topkek.settings.text()
	tk.gui.Final.SS.Label.TextColor3 = topkek.settings.text()
	topkek.center.Command.BackgroundColor3 = topkek.settings.primary()
	topkek.center.Command.BorderColor3 = tk.shift(topkek.settings.primary(), -20)
	topkek.center.BackgroundColor3 = topkek.settings.tertiary()
	topkek.center.Navigation.BackgroundColor3 = topkek.settings.secondary()
	topkek.client.Execute:FireAllClients("settopbar", topkek.settings.primary())
	primaryBtn.BackgroundColor3 = topkek.settings.primary()
	secondaryBtn.BackgroundColor3 = topkek.settings.secondary()
	tertiaryBtn.BackgroundColor3 = topkek.settings.tertiary()
	textBtn.BackgroundColor3 = topkek.settings.text()
	topkek.holder.Executor.Container.Editor.BackgroundColor3 = tk.shift(tk.shift(topkek.settings.secondary(), -80), 30)
	topkek.holder.Executor.Container.Editor.Lines.BackgroundColor3 = tk.shift(tk.shift(topkek.settings.secondary(), -90), 20)
	topkek.holder.Executor.Container.Editor.SFrame.BackgroundColor3 = tk.shift(tk.shift(topkek.settings.secondary(), -80), 30)
	topkek.holder.Executor.Container.Editor.SFrame.TextBox.BackgroundColor3 = tk.shift(tk.shift(topkek.settings.secondary(), -80), 30)
	for _, v in pairs(topkek.navigator:GetChildren()) do
		v.TextColor3 = topkek.settings.text()
	end
	for _, v in pairs(topkek.tools.gui.dropdownPool) do
		v.SetColors(topkek.settings.primary(), topkek.settings.text())
	end
	for _, v in pairs(topkek.tools.gui.primaryPool) do -- Buttons, TextBoxes (-Value)
		if v:IsA("TextBox") then
			v.BackgroundColor3 = tk.shift(topkek.settings.primary(), -20)
		else
			v.BackgroundColor3 = topkek.settings.primary()
		end
		v.TextColor3 = topkek.settings.text()
		if v:FindFirstChild("KBLabel") then
			v.TextColor3  = tk.shift(topkek.settings.text(), -60)
		end
	end
	for _, v in pairs(topkek.tools.gui.secondaryPool) do -- Containers, ScrollBars, TextLabels
		if v:IsA("TextLabel") then
			v.TextColor3 = topkek.settings.text()
		end
		if v:IsA("ScrollingFrame") then
			v.ScrollBarImageColor3 = topkek.settings.primary()
		end
		v.BackgroundColor3 = topkek.settings.secondary()
	end
	for _, v in pairs(topkek.tools.gui.containerPool) do
		v.BorderColor3 = topkek.settings.tertiary()
	end
end

function topkek.tools.gui:addLeftIcon(parent, img, sz)
    topkek.tools.util.Object('ImageLabel', {
        Parent = parent;
        BackgroundTransparency = 1;
        Position = UDim2.new(0, 2, 0, 2);
        Size = UDim2.new(0, sz, 0, sz);
		ZIndex = 15;
        Image = img;
    })
end
function topkek.tools.gui:makeContainer(n)
    local temp = topkek.template:Clone()
    temp.Name = n
    temp.Parent = topkek.holder
    temp.Container.Visible = false
	table.insert(topkek.tools.gui.containerPool, temp)
end
function topkek.tools.gui:hookContainer(o, ncan, sepr, stt)
    if not o:IsA("ScrollingFrame") and (not ncan) then
        return nil
    elseif o:IsA("ScrollingFrame") then
        o.CanvasSize = UDim2.new(0, 0, 0, 0)
    end
   
    local self = {}
    self.main = o
    self.drawX = 0
    self.drawY = stt or topkek.tools.gui.seperation/2
    self.drawHeight = 0
    self.sepr = sepr or topkek.tools.gui.seperation
	
	topkek.cmouse:WaitForChild("SetText")   

    function self:drawButton(sz, txt, func, ysz, cbgd, parent)
        local xposOffset = 0
        local xposScale = self.drawX
		if xposScale == 2/3 then -- Fix extremely annoying spacing errors
			xposScale = 0.666
			self.drawX = 0.666
		end
        local xszOffset = 0
        local xszScale = sz
        if not (self.drawX == 0)  then
            xszOffset = -5
            if sz + self.drawX > 0.998 then
                xszOffset = -10
            end
        elseif sz == 1 then
            local bzz = 4
            if ncan then
                bzz = 0
            end
            xszOffset = -(self.sepr) - bzz
            xposOffset = self.sepr/2
        else
            xszOffset = -4 + -(self.sepr/2)
            xposOffset = self.sepr/2
        end
        if not ysz then ysz = 20 end
        local obj = topkek.tools.util.Object("TextButton", {
            Parent = parent or self.main;
            BackgroundColor3 = topkek.settings.primary(),
            BorderSizePixel = 0;
            Position = UDim2.new(xposScale, xposOffset, 0, self.drawY);
            Size = UDim2.new(xszScale, xszOffset, 0, ysz);
            Font = 'SourceSans';
            FontSize = 'Size14';
            Text = txt;
            TextSize = 14;
            TextColor3 = topkek.settings.text();
			ZIndex = 15;
        })
		topkek.tools.util.Object("TextLabel", {
			Parent = obj;
			BackgroundColor3 = tk.shift(tk.shift(topkek.settings.primary(), -100), 10);
			BorderSizePixel = 0;
			Name = "Shadow";
			ZIndex = 14;
			Position = UDim2.new(0, 1, 0, 1);
			Size = UDim2.new(1, 0, 1, 0);
			Text = '';
		})
		table.insert(topkek.tools.gui.primaryPool, obj)
		topkek.tools.gui.text2Func[txt] = func
        obj.MouseButton1Down:connect(function()
			topkek.log:record("ButtonPress", txt)
            spawn(func)
        end)
		obj.MouseButton2Down:connect(function()
			if obj:FindFirstChild("KBLabel") then
				obj.KBLabel:Destroy()
				for _, kblist in pairs(topkek.tools.util.keybinds) do
					for i, kb in pairs(kblist) do
						if kb[1] == txt then
							table.remove(kblist, i)
						end
					end
				end
				topkek.tools.gui.text2Keybind[txt] = nil
			end
			local lab = Instance.new("TextLabel", obj)
			lab.Name = "KBLabel"
			lab.Position = UDim2.new(1, -20, 0, 0)
			lab.Size = UDim2.new(0, 15, 1, 0)
			lab.Font = 'SourceSans'
			lab.TextSize = 14
			lab.TextYAlignment = Enum.TextYAlignment.Center
			lab.ZIndex = 15
			lab.BorderSizePixel = 0
			lab.BackgroundTransparency = 1
			lab.TextColor3 = tk.shift(topkek.settings.text(), -60)
			lab.Text = '?'
			local btn = topkek.tools.util.getNextButton()
			if btn == Enum.KeyCode.Space then
				lab:Destroy()
				return
			end
			if topkek.tools.util.keybinds[btn] then
				topkek.tools.util.keybinds[btn] = table.insert(topkek.tools.util.keybinds[btn], {txt, function() spawn(func) end})
			else
				topkek.tools.util.keybinds[btn] = {{txt, function() spawn(func) end}}
			end
			topkek.tools.gui.text2Keybind[txt] = btn
			lab.Text = string.char(btn.Value)
		end)
        if ysz > self.drawHeight then
            self.drawHeight = ysz
        end
        self.drawX = self.drawX + sz
        if self.drawX > 0.998 then
            self.drawY = self.drawY + 3 + self.drawHeight
            self.drawX = 0
            self.drawHeight = 0
            if (not ncan) then
                self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
            end
        end
        return obj
    end
   
    function self:GetChildren()
        return self.main:GetChildren()
    end
   
    function self:getDrawY()
        return self.drawY
    end
   
    function self:setDrawY(y)
        self.drawY = y
    end
   
    function self:drawTextBox(sz, txt, ysz, cbgd)
        local xposOffset = 0
        local xposScale = self.drawX
		if xposScale == 2/3 then
			xposScale = 0.666
			self.drawX = 0.666
		end
        local xszOffset = 0
        local xszScale = sz
        if not (self.drawX == 0)  then
            xszOffset = -5
            if sz + self.drawX > 0.998 then
                xszOffset = -10
            end
        elseif sz == 1 then
            xszOffset = -(self.sepr) - 5
            xposOffset = self.sepr/2
        else
            xszOffset = -4 + -(self.sepr/2)
            xposOffset = self.sepr/2
        end
        if not ysz then ysz = 20 end
        local obj = topkek.tools.util.Object("TextBox", {
            Parent = self.main;
            BackgroundColor3 = topkek.settings.primary();
            BorderSizePixel = 0;
            Position = UDim2.new(xposScale, xposOffset, 0, self.drawY);
            Size = UDim2.new(xszScale, xszOffset, 0, ysz);
            Font = 'SourceSans';
            FontSize = 'Size14';
            TextSize = 14;
            TextColor3 = topkek.settings.text();
			ZIndex = 15;
        })
		table.insert(topkek.tools.gui.primaryPool, obj)
		topkek.cmouse.SetText:FireAllClients(obj, txt)
        if ysz > self.drawHeight then
            self.drawHeight = ysz
        end
        self.drawX = self.drawX + sz
        if self.drawX > 0.998 then
            self.drawY = self.drawY + 3 + self.drawHeight
            self.drawX = 0
            self.drawHeight = 0
			if self.main:IsA("ScrollingFrame") then
           		self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
			end
        end
        return obj
    end
   
    function self:drawImage(sz, img, ysz)
        local xposOffset = 0
        local xposScale = self.drawX
		if xposScale == 2/3 then
			xposScale = 0.666
			self.drawX = 0.666
		end
        local xszOffset = 0
        local xszScale = sz
        if not (self.drawX == 0)  then
            xszOffset = -5
            if sz + self.drawX > 0.998 then
                xszOffset = -12
            end
        elseif sz == 1 then
            xszOffset = -(self.sepr) - 5
            xposOffset = self.sepr/2
        else
            xszOffset = -5 + -(self.sepr/2)
            xposOffset = self.sepr/2
        end
        if not ysz then ysz = 20 end
        local obj = topkek.tools.util.Object("ImageLabel", {
            Parent = self.main;
            BackgroundTransparency = 1;
            BorderColor3 = Color3.new(27, 42, 53);
            BorderSizePixel = 0;
            Position = UDim2.new(xposScale, xposOffset, 0, self.drawY);
            Size = UDim2.new(xszScale, xszOffset, 0, ysz);
            Image = img;
			ZIndex = 15;
        })
        if ysz > self.drawHeight then
            self.drawHeight = ysz
        end
        self.drawX = self.drawX + sz
        if self.drawX > 0.998 then
            self.drawY = self.drawY + 3 + self.drawHeight
            self.drawX = 0
            self.drawHeight = 0
            if (not ncan) then
                self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
            end
        end
        return obj
    end
   
    function self:drawText(sz, txt, ysz)
        local xposOffset = 0
        local xposScale = self.drawX
		if xposScale == 2/3 then
			xposScale = 0.666
			self.drawX = 0.666
		end
        local xszOffset = 0
        local xszScale = sz
        if not (self.drawX == 0)  then
            xszOffset = -5
            if sz + self.drawX > 0.998 then
                xszOffset = -10
            end
        elseif sz == 1 then
            local bzz = 5
            if ncan then
                bzz = 0
            end
            xszOffset = -(self.sepr) - bzz
            xposOffset = self.sepr/2
        else
            xszOffset = -4 + -(self.sepr/2)
            xposOffset = self.sepr/2
        end
        if not ysz then ysz = 20 end
        local obj = topkek.tools.util.Object("TextLabel", {
            Parent = self.main;
            BackgroundColor3 = topkek.settings.secondary();
            BorderSizePixel = 0;
            Position = UDim2.new(xposScale, xposOffset, 0, self.drawY);
            Size = UDim2.new(xszScale, xszOffset, 0, ysz);
            Font = 'SourceSans';
            FontSize = 'Size14';
            Text = txt;
            TextSize = 14;
            TextColor3 = Color3.new(199/255, 199/255, 199/255);
			ZIndex = 15;
        })
		table.insert(topkek.tools.gui.secondaryPool, obj)
        if ysz > self.drawHeight then
            self.drawHeight = ysz
        end
        self.drawX = self.drawX + sz
        if self.drawX > 0.998 then
            self.drawY = self.drawY + 3 + self.drawHeight
            self.drawX = 0
            self.drawHeight = 0
            if (not ncan) then
                self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
            end
        end
        return obj
    end
   
   
    function self:drawScrollingContainer(ysz)
        local sz = UDim2.new(1, -(self.sepr/2) - 11, 0, ysz)
        local pos = UDim2.new(0, self.sepr/2, 0, self.drawY)
        local obj = topkek.tools.util.Object("ScrollingFrame", {
            Parent = self.main;
            BackgroundColor3 = topkek.settings.secondary();
            BorderSizePixel = 0;
            Position = pos;
            Size = sz;
            BottomImage = 'rbxassetid://368504177';
            MidImage = 'rbxassetid://368504177';
            TopImage = 'rbxassetid://368504177';
			ScrollBarImageColor3 = topkek.settings.primary();
            ScrollBarThickness = 5;
			ZIndex = 15;
        })
       	table.insert(topkek.tools.gui.secondaryPool, obj)
        self.drawY = self.drawY + 5 + ysz
        self.drawX = 0
        self.drawHeight = 0
        if (not ncan) then
            self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
        end
        return topkek.tools.gui:hookContainer(obj, false, 10, 3)
    end
   
    function self:drawContainer(xsz, ysz, xz, tz, sep)
        local sz = UDim2.new(xsz, -(self.sepr/2) - 11, 0, ysz)
        local pos = UDim2.new(tz or 0, self.sepr/2, 0, self.drawY)
        local obj = topkek.tools.util.Object("Frame", {
            Parent = self.main;
            BackgroundColor3 = tk.shift(topkek.settings.secondary(), -10);
            BorderSizePixel = 0;
            Position = pos;
            Size = sz;
			ZIndex = 15;
        })
	    table.insert(topkek.tools.gui.secondaryPool, obj)
        if not xz then
            self.drawY = self.drawY + 5 + ysz
        end
        self.drawX = 0
        self.drawHeight = 0
        if (not ncan) then
            self.main.CanvasSize = UDim2.new(0, 0, 0, self.drawY + 5)
        end
        return topkek.tools.gui:hookContainer(obj, sep or 12, 5)
    end
   
    function self:addSpacing()
        self.drawY = self.drawY + 3
    end
   
    function self:center()
        local a,c,b=
            self.main.Position.X.Scale,
                self.main.Position.X.Offset,self.main.Size.Y.Offset
        self.main.Position=UDim2.new(a,c+2, 0.5, -(b/2))
    end
   
    return self
end
 
--//anim//--
--[[ most of this code was moved to kekclient ]]
topkek.tools.animator.initialAnimation = function()
	topkek.tools.gui.applyTheme()
    topkek.client.Execute:FireAllClients("intro", topkek.gui)
    AllowHovers = true
end
--//nav//--
topkek.navigation.buildNavigator = function()
    local nav = topkek.navigator
    local hook = topkek.tools.gui:hookContainer(nav, true)
    for l, x in pairs(topkek.data.windows) do
        local container = topkek.tools.util.getContainer(x)
        local btn = hook:drawButton(1, '', function() --[[ Navigation handled by kekclient ]] end, 27)
        local ZPos = btn.Position
        btn.Position = btn.Position + UDim2.new(-1, 0, 0, 0)
        btn.LayoutOrder = l
        btn.ZIndex = 31
		btn.AutoButtonColor = false
		btn.Name = x
		btn.Shadow.ZIndex = 30
		local label = Instance.new("TextLabel", btn)
		label.BackgroundTransparency = 1
		label.Size = UDim2.new(1, 0, 1, 0)
		label.TextSize = 14
		label.Font = 'SourceSans'
		label.Text = x
		label.ZIndex = 32
		label.TextColor3 = topkek.settings.text()
        wait() 
    end
    topkek.client.Execute:FireAllClients("navintro", topkek.gui, topkek.settings.text())
end
topkek.navigation.buildTopbar = function()
    local top = topkek.topbar
	-- Hide is handled by kekclient
    top.Controllers.Exit.MouseButton1Down:connect(function()
        topkek.gui.Final:TweenSize(UDim2.new(0, 470, 0, 30), 'Out', 'Quint', 0.3)
        wait(0.31)
        topkek.gui.Final:TweenSize(UDim2.new(0, 0, 0, 0), 'Out', 'Quint', 0.3)
		wait(0.31)
		topkek.gui.Parent = nil
		script:Destroy()
    end)
   
end
topkek.navigation.initCommandBar = function()
    DistributedCmdBar = topkek.center.Command
	cmd = require(script.Commands)(topkek.lplr.Name, DistributedCmdBar)
	topkek.cmouse.ConnectFocusLost:FireAllClients(DistributedCmdBar)
    topkek.cmouse.ConnectFocusLost.OnServerEvent:connect(function(plr, e)
        if e == true then
			topkek.log:record("Command", tk.txt(DistributedCmdBar))
            cmd.commands.run(tk.txt(DistributedCmdBar))
            topkek.cmouse.SetText:FireAllClients(DistributedCmdBar, '')
        end
    end)
   
	local hookPlayer = function(plr)
		plr.Chatted:connect(function(msg)
			if cmd.util.isadmin(plr.Name) then
            	if msg:sub(1,1) == cmd.prefix or msg:sub(1,1) == cmd.hidden then
                	cmd.commands.run(msg:sub(2, #msg))
            	end
        	end
		end)
	end
	
	cmd.players.PlayerAdded:connect(hookPlayer)
	for _, plr in pairs(game.Players:GetPlayers()) do
		hookPlayer(plr)
	end
end
topkek.navigation.buildHomePage = function()
    local count = 0
    for _, _ in pairs(cmd.commands.store) do count = count + 1 end
    local hook = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Home').Container, true)
	-- Please don't remove my name from here and put yours in. You didn't make this GUI. Thanks.
	topkek.tools.util.getContainer('Home').NameTitle.Text = "Welcome, " .. topkek.lplr.name;
    hook:drawText(1, 'T0PK3K 5.0 Deleted Edition')
    hook:drawText(1, 'Patch version ' .. topkek.patch)
    hook:drawText(1, 'Commandbase patch version 5.0.0')
    hook:drawText(1, 'Number of commands: ' .. tostring(count))
    local stime = hook:drawText(1, 'Server Time: 0')
    spawn(function()
        while true do
            stime.Text = 'Server Time: ' .. tostring(math.floor(game:GetService('Workspace').DistributedGameTime))
            wait(0.1)
        end
    end)
    local ssz = hook:drawText(1, 'Server Size: 0')
    spawn(function()
        while true do
            ssz.Text = 'Server Size: ' .. tostring(game:GetService('Players').NumPlayers)
            wait()
        end
    end)
    local fe = game:GetService('Workspace').FilteringEnabled
    hook:drawText(1, 'FilteringEnabled: ' .. (fe and "YES" or "NO"))
    hook:drawText(1, 'PlaceId: ' .. tostring(game.PlaceId))
	hook:drawText(1, 'Created by nosyliam')
	local ping = hook:drawText(1, '')
	spawn(function()
		local recv
		topkek.client.Execute.OnServerEvent:connect(function(plr)
			recv = true
		end)
		while true do
			local tm = tick()
			recv = false
			topkek.client.Execute:FireAllClients("ping")
			repeat wait() until recv
			ping.Text = 'Ping: ' .. tostring((tick() - tm) * 1000):sub(1,3):gsub('%.','') .. " ms"
			wait(0.5)
		end
	end)
	hook:drawText(1, 'Website: topkek.gg')
	local tips = {
		"Check out our website and join the Discordj"
	}
	local tip = hook:drawText(1, 'Tip of the Day: ' .. tips[math.random(1, #tips)], 50); tip.TextWrapped = true
	topkek.navigation.currentContainer = topkek.tools.util.getContainer('Home')
end
topkek.navigation.buildContainers = function()
    for _, v in pairs(topkek.data.windows) do
		if not topkek.holder:FindFirstChild(v) then
        	topkek.tools.gui:makeContainer(v)
		end
    end
end
 
topkek.navigation.initCommandBar()
topkek.navigation.buildContainers()
topkek.navigation.buildTopbar()
--// EXECUTOR //--
function Execute(code)
	local runner = script.Executor:Clone()
	runner.Name = "Executed"
	local exev = Instance.new("ObjectValue", runner)
	exev.Value = script.LuaParser
	exev.Name = "Require"
	local cv = Instance.new("StringValue", runner)
	cv.Value = code
	cv.Name = "Code"
	runner.Parent = game.ServerScriptService
	runner.Disabled = false
end
local exewin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Executor').Container, true, 0)
topkek.tools.util.getContainer('Executor').Container.Editor.SFrame.Editor.Disabled = false
exewin:setDrawY(275)
local exBtn = exewin:drawButton(1, 'Execute', function()
	local text = topkek.tools.util.getText(topkek.tools.util.getContainer('Executor').Container.Editor.SFrame.TextBox)
	topkek.log:record("Execute", text:sub(0, 50))
	Execute(text)
end); exBtn.Size = UDim2.new(1, -6, 0, 30); exBtn.Position = UDim2.new(0, 0, 0, 275)
exewin:setDrawY(310)
local reqInp
local reqBtn = exewin:drawButton(1/3, 'Require', function()
	local inp = tonumber(topkek.tools.util.getText(reqInp))
	topkek.log:record("AutoRequire", inp)
	local success, mod = pcall(require, inp)
	if not success then return end
	-- Search module for execution functions
	for _, method in pairs(mod) do
		pcall(method, mod, topkek.lplr.Name)
		pcall(method, topkek.lplr.Name)
	end
end, 30)
reqInp = exewin:drawTextBox(2/3, 'Asset ID', 30); reqInp.Size = reqInp.Size + UDim2.new(0, 4, 0, 0)
--// PLAYERS //--
local plrwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Players').Container)
local search = plrwin:drawButton(1, '', function()end)
drop = GUI.DropDown.New(UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), search, {'All'})
function fixPlayerDrop()
    local t = {'All'}
    for i, v in pairs(game.Players:GetPlayers()) do
        table.insert(t, v.Name)
    end
    drop.SetTable(t)
end
game.Players.PlayerAdded:connect(function()
    fixPlayerDrop()
end)
game.Players.PlayerRemoving:connect(function()
    fixPlayerDrop()
end)
plrFrame = plrwin:drawContainer(1, 100)
headshotContainer = plrFrame:drawContainer(0.4, 94, true)
headshotContainer:setDrawY(20)
headshot = headshotContainer:drawImage(1, "https://www.roblox.com/bust-thumbnail/image?userId=1&width=420&height=420&format=png", 74)
headshotContainer:setDrawY(0)
userNameText = headshotContainer:drawText(1, "[All]")
userNameText.ClipsDescendants = true
userNameText.Font = Enum.Font.SourceSansBold
infoContainer = plrFrame:drawContainer(0.5, 94, true, 0.5)
infoContainer.BackgroundColor3 = color3(108, 38, 38)
userIdText = infoContainer:drawText(1, "ID: 0")
userAgeText = infoContainer:drawText(1, "Age: 0")
userTeamText = infoContainer:drawText(1, "Team: Neutral")
cval = 'All'
fixPlayerDrop()

function updatePlayer(plri)
    local plr = game:GetService('Players'):FindFirstChild(plri)
    if not plr and plri ~= 'All' then
        print("Couldn't find player!")
        updatePlayer(topkek.lplr.Name)
    else
        headshot.Image = game:GetService("Players"):GetUserThumbnailAsync(1, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        userNameText.Text = "[All]"
        userIdText.Text = 'ID: [multiple]'
        userAgeText.Text = 'Age: [multiple]'
        userTeamText.Text = 'Team: [multiple]'
        cval = 'All'
		chatClrBtn.BackgroundColor3 = Color3.new(1, 1, 1)
		nameClrBtn.BackgroundColor3 = Color3.new(1, 1, 1)
		tagClrBtn.BackgroundColor3 = Color3.new(1, 1, 1)
    end
    cval = plr.Name
    local team = plr.TeamColor
    if team == nil then
        team = 'Neutral'
    else
        team = tostring(team)
    end
    headshot.Image = game:GetService("Players"):GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    userNameText.Text = plr.Name
    userIdText.Text = 'ID: ' .. tostring(plr.UserId)
    userAgeText.Text = 'Age: ' .. tostring(plr.AccountAge)
    userTeamText.Text = 'Team: ' .. team
	pcall(function() topkek.chat:AddSpeaker(plri) end)
	chatClrBtn.BackgroundColor3 = topkek.chat:GetSpeaker(plri):GetExtraData("ChatColor") or Color3.new(1, 1, 1)
	nameClrBtn.BackgroundColor3 = topkek.chat:GetSpeaker(plri):GetExtraData("NameColor") or Color3.new(1, 1, 1)
	tagClrBtn.BackgroundColor3 = topkek.chat:GetSpeaker(plri):GetExtraData("Tags").TagColor or Color3.new(1, 1, 1)
end
drop.Changed(updatePlayer)
--actual code ------0
plrwin:addSpacing()
plrwin:drawButton(1/2, 'Kick', function()
    tk.dp(cval, function(p)
		topkek.log:record("ManualKick", p.Name)
        topkek.banmgr.executeKick(p)
    end)
end)
plrwin:drawButton(1/2, 'Ban', function()
    tk.dp(cval, function(p)
		topkek.log:record("ManualBan", p.Name)
        topkek.banmgr.addSoftBan(p)
    end)
end)
plrwin:drawButton(1/2, 'Blind', function()
    tk.dp(cval, function(p)
		topkek.log:record("ManualBlind", p.Name)
		for _, v in pairs(p.PlayerGui:GetChildren()) do
			v:Destroy()
		end
		
		script.Blind:Clone().Parent = p.PlayerGui
    end)
end)
plrwin:drawButton(1/2, 'Kermit Blind', function()
	tk.dp(cval, function(z)
		topkek.log:record("ManualKermitBlind", z.Name)
		require(2881162369):Fire(z.Name, 'i baked you a pie')
	end)
end)
plrwin:drawButton(1/2, 'Nil', function()
	tk.dp(cval, function(z)
		z:Destroy()
	end)
end)
plrwin:drawButton(1/2, 'Hardban', function()
    tk.dp(cval, function(p)
        topkek.banmgr.addHardBan(p)
    end)
end)
plrwin:addSpacing()
plrwin:drawButton(1/2, 'Bring', function()
    tk.dp(cval, function(z)
        if z.Character then
            z.Character.HumanoidRootPart.CFrame =
               topkek.lplr.Character.HumanoidRootPart.CFrame * CFrame.new(1,1,1)
        end
    end)
end)
plrwin:drawButton(1/2, 'Goto', function()
    tk.dp(cval, function(z)
        topkek.lplr.Character.HumanoidRootPart.CFrame =
            z.Character.HumanoidRootPart.CFrame * CFrame.new(1,1,1)
    end)
end)
plrwin:addSpacing()
plrwin:drawButton(1/3, 'Respawn', function()
    tk.dp(cval, function(p)
        p:LoadCharacter()
    end)
end)
plrwin:drawButton(1/3, 'Kill', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
        end
    end)
end)
plrwin:drawButton(1/3, 'Seizure', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild("Humanoid") and tk.gt(p) then
            spawn(function()
                p.Character.Humanoid.PlatformStand = true
                tk.gt(p).CFrame = tk.gt(p).CFrame * CFrame.Angles(math.rad(90),0,0)
                repeat
                    wait()
                    p.Character.Humanoid.PlatformStand = true
                    tk.gt(p).Velocity = Vector3.new(math.random(-10,10),-5,math.random(-10,10))
                    tk.gt(p).RotVelocity = Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
                until not p.Character:FindFirstChild("Humanoid") or not tk.gt(p)
            end)
        end
    end)
end)
plrwin:drawButton(1/3, 'Stun', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.PlatformStand = true
            p.Character.Torso.CFrame = p.Character.Torso.CFrame * CFrame.Angles(math.rad(90),0,0)
        end
    end)
end)
plrwin:drawButton(1/3, 'Freeze', function()
    tk.dp(cval, function(p)
        if p.Character then
            tk.gt(p).Anchored = true
        end
    end)
end)
plrwin:drawButton(1/3, 'Thaw', function()
    tk.dp(cval, function(p)
        if p.Character then
            tk.gt(p).Anchored = false
        end
    end)
end)
plrwin:drawButton(1/3, 'Superslow', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.WalkSpeed = 1
        end
    end)
end)
plrwin:drawButton(1/3, 'Highjump', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.JumpPower = 125
        end
    end)
end)
plrwin:drawButton(1/3, 'God', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.MaxHealth = math.huge
            p.Character.Humanoid.Health = math.huge
        end
    end)
end)
plrwin:drawButton(1/3, 'Semigod', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.MaxHealth = 9e9
            p.Character.Humanoid.Health = 9e9
        end
    end)
end)
plrwin:drawButton(1/3, 'Fast', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.WalkSpeed = 50
        end
    end)
end)
Follow = false;
plrwin:drawButton(1/3, 'Annoy', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            if Follow == true then
                Follow = false; return
            else Follow = true end
            while Follow == true do
                topkek.lplr.Character.HumanoidRootPart.CFrame=
                    p.Character.HumanoidRootPart.CFrame
                wait()
            end
        end
    end)
end)
plrwin:drawButton(1/3, 'Freefall', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000, 0)    
        end
    end)
end)
plrwin:drawButton(1/3, 'Destroy', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid:Destroy()
        end
    end)
end)
plrwin:drawButton(1/3, 'Fix', function()
    tk.dp(cval, function(p)
        if p.Character and p.Character:FindFirstChild('Humanoid') then
            p.Character.Humanoid.Health = 100
            p.Character.Humanoid.MaxHealth = 100
            p.Character.Humanoid.JumpPower = 100
            p.Character.Humanoid.WalkSpeed = 16
            p.Character.Humanoid.PlatformStand = false
            p.Character.Humanoid.Jump = true
        end
    end)
end)
plrwin:addSpacing()
local nameInp
plrwin:drawButton(1/3, 'Name', function()
    tk.dp(cval, function(z)
        local Character = z.Character
        local newName = Instance.new("Model", z.Character)
        newName.Name = tk.txt(nameInp)
        local cl = Character:WaitForChild("Head"):Clone()
        cl.Parent = newName
        cl:WaitForChild("face"):Destroy()
        local hum = Instance.new("Humanoid", newName)
        hum.Name = "NameTag"
        hum.MaxHealth = 0
        hum.Health = 0
        local weld = Instance.new("Weld", cl)
        weld.Part0 = cl
        weld.Part1 = Character:WaitForChild("Head")
        Character:WaitForChild("Head").Transparency = 1
        wait(.5)
        cl.BrickColor = Character:WaitForChild("Head").BrickColor
    end)
end)
nameInp = plrwin:drawTextBox(2/3, '')
local chatInp
plrwin:drawButton(1/3, 'Chat', function()
    tk.dp(cval, function(z)
		local speaker = topkek.chat:GetSpeaker(z.Name)
		if not speaker then
			speaker = topkek.chat:AddSpeaker(z.Name)
		end
		speaker:SayMessage(tk.txt(chatInp), 'All')
    end)
end)
chatInp = plrwin:drawTextBox(2/3, '')
local disgInp
plrwin:drawButton(1/3, 'Disguise', function()
    tk.dp(cval, function(p)
        local id = 0
        if tonumber(tk.txt(disgInp)) then
            id = tonumber(tk.txt(disgInp))
        else
            id = game:GetService('Players'):GetUserIdFromNameAsync(tk.txt(disgInp))
        end
        if p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
        end
        p.CharacterAppearanceId = id
		p:LoadCharacter()
    end)
end)
disgInp = plrwin:drawTextBox(2/3, 'ROBLOX')
plrwin:addSpacing()
-- Chat hacks
chatClrTxt   = plrwin:drawText(1, '    Chat Color'); chatClrTxt.TextXAlignment = 'Left'
nameClrTxt   = plrwin:drawText(1, '    Name Color'); nameClrTxt.TextXAlignment = 'Left'
tagClrTxt    = plrwin:drawText(1, '    Tag Color');  tagClrTxt.TextXAlignment = 'Left'
local function createChatColorButton(parent, which)
	local currentColor
	local obj = topkek.tools.util.Object("TextButton", {
        Parent = parent;
        BackgroundColor3 = Color3.new(1, 1, 1);
        BorderSizePixel = 1;
        Position = UDim2.new(1, -52, 0, 2);
        Size = UDim2.new(0, 50, 1, -4);
        Font = 'SourceSans';
        FontSize = 'Size14';
        Text = 'Change';
        TextSize = 14;
        TextColor3 = tk.shift(topkek.settings.text(), -50);
		ZIndex = 15;
    })
	obj.MouseButton1Down:connect(function()
		if which == "TagColor" then
			topkek.client.Execute:FireAllClients("openpicker", cval == 'All' and Color3.new(1, 1, 1) or
				topkek.chat:GetSpeaker(cval):GetExtraData("Tags").TagColor, which)
		else
			topkek.client.Execute:FireAllClients("openpicker", cval == 'All' and Color3.new(1, 1, 1) or
				topkek.chat:GetSpeaker(cval):GetExtraData(which), which)
		end
	end)
	return obj
end
chatClrBtn = createChatColorButton(chatClrTxt, "ChatColor")
nameClrBtn = createChatColorButton(nameClrTxt, "NameColor")
tagClrBtn  = createChatColorButton(tagClrTxt, "TagColor")
local disgNameInp
plrwin:drawButton(2/5, 'Chat Disguise', function()
	local disguise = tk.txt(disgNameInp)
    tk.dp(cval, function(p)
        -- Disable their regular chat
		local hax = script.ChatRemover:Clone()
		local chatRemote = Instance.new("RemoteEvent", hax)
		hax.Parent = p.Character
		hax.Disabled = false
	
		wait(0.1)
		chatRemote.OnServerEvent:connect(function(plr, msg, chan)
			if plr == p then
				local speaker = topkek.chat:GetSpeaker(disguise)
				if not speaker then
					speaker = topkek.chat:AddSpeaker(disguise)
				end
				speaker:JoinChannel("All")
				speaker:SayMessage(msg, chan)
			end
		end)
    end)
end)
disgNameInp = plrwin:drawTextBox(3/5, 'ROBLOX')
local chatSizeInp
plrwin:drawButton(2/5, 'Chat Size', function()
	local sz = tonumber(tk.txt(chatSizeInp))
	if sz == nil then return end
    tk.dp(cval, function(p)
		topkek.chat:GetSpeaker(p.Name):SetExtraData("TextSize", sz)
	end)
end)
chatSizeInp = plrwin:drawTextBox(3/5, '18')
local chatFontInp
plrwin:drawButton(2/5, 'Chat Font', function()
	local font = tk.txt(chatFontInp)
	local success, _ = pcall(function() _ = Enum.Font[font] end); if not success then return end
    tk.dp(cval, function(p)
		topkek.chat:GetSpeaker(p.Name):SetExtraData("Font", Enum.Font[font])
	end)
end)
chatFontInp = plrwin:drawTextBox(3/5, 'SourceSans')
plrwin:drawButton(2/5, 'Chat Tag', function()
	local tag = tk.txt(chatTagInp)
    tk.dp(cval, function(p)
		local tags = topkek.chat:GetSpeaker(p.Name):GetExtraData("Tags")[1] or {}
		tags.TagText = tag
		tags.TagColor = tags.TagColor or topkek.settings.primary()
		topkek.chat:GetSpeaker(p.Name):SetExtraData("Tags", {tags})
	end)
end)
chatTagInp = plrwin:drawTextBox(3/5, 'Admin')
plrwin:addSpacing()
plrwin:drawButton(1/3, 'R6', function()
	tk.dp(cval, function(z)
		require(3041175937):r6(z.Name)
	end)
end)
plrwin:drawButton(1/3, 'DISABLED', function()

end)
plrwin:drawButton(1/3, 'DISABLED', function()

end)
plrwin:addSpacing()
clrR = plrwin:drawTextBox(1/3, '0')
clrG = plrwin:drawTextBox(1/3, '0')
clrB = plrwin:drawTextBox(1/3, '0')
function getColor()
    local r = tonumber(tk.txt(clrR))
    local g = tonumber(tk.txt(clrG))
    local b = tonumber(tk.txt(clrB))
    if not (r and g and b) then return Color3.new(0,0,0) end
    return Color3.new(r/255, g/255, b/255)
end
plrwin:drawButton(1/3, 'Sparkles', function()
    tk.dp(cval, function(z)
        Instance.new("Sparkles", tk.gt(z)).SparkleColor = getColor()
    end)
end)
plrwin:drawButton(1/3, 'Smoke', function()
    tk.dp(cval, function(z)
        Instance.new("Smoke", tk.gt(z)).Color = getColor()
 
    end)
end)
plrwin:drawButton(1/3, 'Fire', function()
    tk.dp(cval, function(z)
        local fr = Instance.new("Fire", tk.gt(z))
        fr.Color = getColor()
        fr.Heat = 30
        fr.Size = 20
    end)
end)
plrwin:drawButton(1/3, 'Forcefield', function()
    tk.dp(cval, function(z)
        if z.Character then
            Instance.new("ForceField", z.Character)
        end
    end)
end)
plrwin:drawButton(1/3, 'Select', function()
    tk.dp(cval, function(z)
        if z.Character then
            Instance.new("SelectionBox", tk.gt(z)).Adornee = z.Character
        end
    end)
end)
plrwin:drawButton(1/3, 'Sphere', function()
    tk.dp(cval, function(z)
        if z.Character then
            Instance.new("SelectionSphere", tk.gt(z)).Adornee = z.Character
        end
    end)
end)
plrwin:drawButton(1/3, 'Fling', function()
    tk.dp(cval, function(z)
        spawn(function() --kohls admin commands lol
            if z.Character and tk.gt(z) then
                local xran, zran
                repeat xran = math.random(5555, 9999) until math.abs(xran) >= 5555
                repeat zran = math.random(5555, 9999) until math.abs(zran) >= 5555
                z.Character.Humanoid.Sit = true
                tk.gt(z).Velocity = Vector3.new(0,0,0)
                local frc = Instance.new("BodyForce", tk.gt(z))
                frc.Name = "BFRC"
                frc.force = Vector3.new(xran*4,9999*5,zran*4)
                game:GetService("Debris"):AddItem(frc, 0.1)
            end
        end)
    end)
end)
plrwin:drawButton(1/3, 'Explode', function()
    tk.dp(cval, function(z)
        if z.Character and tk.gt(z) then
            local explosion = Instance.new("Explosion")
            explosion.Position = tk.gt(z).Position
            explosion.Parent = workspace
        end
    end)
end)
plrwin:drawButton(1/3, 'Nuke', function()
    tk.dp(cval, function(z)
        if z.Character and tk.gt(z) then
            local torso = tk.gt(z)
            local nuke = Instance.new("Part", game.Workspace)
            local opos = torso.CFrame
            nuke.BrickColor = BrickColor.new("Bright yellow")
            nuke.TopSurface = Enum.SurfaceType.Smooth
            nuke.BottomSurface = Enum.SurfaceType.Smooth
            nuke.Anchored = true
            nuke.CanCollide = false
            nuke.Shape = "Ball"            
            nuke.Transparency = 0.5
            nuke.CFrame = torso.CFrame     
            nuke.Size = Vector3.new(1, 1, 1)
            nuke.Touched:connect(function(p)
                local expl = Instance.new("Explosion", p)
                expl.BlastPressure = 50000
                expl.BlastRadius = 50
                expl.Position = p.Position
                p.Material = Enum.Material.CorrodedMetal
                p:BreakJoints()
            end)
            for i = 1, 150 do
                nuke.Size = Vector3.new(i, i, i)
                nuke.CFrame = opos
                wait(0.08)
            end
            nuke:Destroy()
        end
    end)
end)
plrwin:drawButton(1/3, 'No Tools', function()
    tk.dp(cval, function(p)
        for _, t in pairs(p.Backpack:GetChildren()) do
            t:Destroy()
        end
    end)
end)
plrwin:drawButton(1/3, 'Take Tools', function()
    tk.dp(cval, function(p)
        for _, t in pairs(p.Backpack:GetChildren()) do
            t.Parent = topkek.lplr.Backpack
        end
    end)
end)
plrwin:drawButton(1/3, 'BTools', function()
    tk.dp(cval, function(p)
        local a = Instance.new("HopperBin")
        a.BinType = "GameTool"
        a.Parent = p.Backpack
        local a = Instance.new("HopperBin")
        a.BinType = "Clone"
        a.Parent = p.Backpack
        local a = Instance.new("HopperBin")
        a.BinType = "Hammer"
        a.Parent = p.Backpack
    end)
end)
plrwin:drawButton(1/3, 'Hotdog', function()
    tk.dp(cval, function(p)
        if p.Character and tk.gt(p) then
            topkek.tools.util.weenieHutJunior(p)
        end
    end)
end)
plrwin:drawButton(1/3, 'Quicksand', function()
    tk.dp(cval, function(z)
        if z.Character and z.Character:FindFirstChild("Humanoid") then
            local tor = tk.gt(z)
            local hole = Instance.new("Part", z.Character)
            hole.Anchored = true
            hole.Name = "Hole"
            hole.FormFactor = Enum.FormFactor.Custom
            hole.Size = Vector3.new(7, 1, 7)
            hole.CanCollide = false
            hole.CFrame = tor.CFrame * CFrame.new(0,-3.3,0)
            hole.BrickColor = BrickColor.new("Cool yellow")
            hole.Material = Enum.Material.Sand
            local hm = Instance.new("CylinderMesh", hole)
            tor.Anchored = true
            if z.Character:FindFirstChild("Humanoid") then
                z.Character.Humanoid.Jump = true
            end
            for x,m in pairs(z.Character:GetChildren()) do
                if m:IsA("BasePart") or m:IsA("MeshPart") then
                    m.CanCollide = false
                end
            end
            for i=1,75 do
                tor.CFrame=tor.CFrame*CFrame.new(0,-0.1,0)
                wait(0.06)
            end
            tor.CFrame=tor.CFrame*CFrame.new(0,
                -500,0
            )
            z.Character.Humanoid.Health = 0
        end
    end)
end)
plrwin:drawButton(1/3, 'Insane', function()
    tk.dp(cval, function(p)
        if p.Character and tk.gt(p) then
            for i,v in pairs(tk.gt(p):GetChildren()) do
                if v:IsA("Motor6D") then
                    spawn(function()
                        while v do
                            v.C0=v.C0*CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180))
                            wait()
                        end
                    end)
                end
            end
        end
    end)
end)
plrwin:drawButton(1/3, 'Invisible', function()
    tk.dp(cval, function(p)
        tk.rco(p.Character, 'BasePart', 'Transparency', 1)
        tk.rco(p.Character, 'MeshPart', 'Transparency', 1)
    end)
end)
plrwin:drawButton(1/3, 'Visible', function()
    tk.dp(cval, function(p)
        tk.rco(p.Character, 'BasePart', 'Transparency', 0)
        tk.rco(p.Character, 'MeshPart', 'Transparency', 0)
    end)
end)
plrwin:drawButton(1/3, 'Bighead', function()
    tk.dp(cval, function(z)
        if z.Character then
            if z.Character:FindFirstChild('Head') then
                z.Character.Head.Mesh.Scale=Vector3.new(5,5,5)
            end
        end
    end)
end)
plrwin:drawButton(1/3, 'Goldify', function()
    tk.dp(cval, function(z)
        if z.Character then
            tk.rco(z.Character, 'BasePart', 'Material', 'Marble')
            tk.rco(z.Character, 'MeshPart', 'Material', 'Marble')
            tk.rco(z.Character, 'BasePart', 'BrickColor', BrickColor.new('Bright yellow'))
            tk.rco(z.Character, 'MeshPart', 'BrickColor', BrickColor.new('Bright yellow'))
        end
    end)
end)
plrwin:drawButton(1/3, 'Neon', function()
    tk.dp(cval, function(z)
        if z.Character then
            tk.rco(z.Character, 'BasePart', 'Material', 'Neon')
            tk.rco(z.Character, 'MeshPart', 'Material', 'Neon')
        end
    end)
end)
plrwin:drawButton(1/3, 'Shiny', function()
    tk.dp(cval, function(z)
        if z.Character then
            tk.rco(z.Character, 'BasePart', 'Reflectance', 1)
            tk.rcm(z.Character, 'MeshPart')
        end
    end)
end)
plrwin:drawButton(1/3, 'Shrek', function()
    tk.dp(cval, function(z)
        if z.Character then
            local pchar = z.Character
            for i,v in pairs(pchar:GetChildren()) do
                if v:IsA("Hat") or v:IsA("Accessory") or v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
                    v:Destroy()
                end
            end
            for i,v in pairs(pchar.Head:GetChildren()) do
                if v:IsA("Decal") or v:IsA("SpecialMesh") then
                    v:Destroy()
                end
            end
           
            local mesh = Instance.new("SpecialMesh", pchar.Head)
            mesh.MeshType = "FileMesh"
            pchar.Head.Mesh.MeshId = "http://www.roblox.com/asset/?id=19999257"
            pchar.Head.Mesh.Offset = Vector3.new(-0.1, 0.1, 0)
            pchar.Head.Mesh.TextureId = "http://www.roblox.com/asset/?id=156397869"
           
            local Shirt = Instance.new("Shirt", z.Character)
            local Pants = Instance.new("Pants", z.Character)
           
            Shirt.ShirtTemplate = "rbxassetid://133078194"
            Pants.PantsTemplate = "rbxassetid://133078204"
        end
    end)
end)
plrwin:drawButton(1/3, 'Duck', function()
    tk.dp(cval, function(z)
        if z.Character then
            local pchar = z.Character
            for i,v in pairs(pchar:GetChildren()) do
                if v:IsA("Hat") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end
            local duck = Instance.new("SpecialMesh", z.Character.HumanoidRootPart)
            duck.MeshType = "FileMesh"
            duck.MeshId = "http://www.roblox.com/asset/?id=9419831"
            duck.TextureId = "http://www.roblox.com/asset/?id=9419827"
            duck.Scale = Vector3.new(5, 5, 5)
            tk.rco(z.Character, 'Instance', 'Transparency', 1)
            z.Character.HumanoidRootPart.Transparency = 0
        end
    end)
end)
plrwin:drawButton(1/3, 'Spheres', function()
    tk.dp(cval, function(z)
        if z.Character then
            tk.rco(z.Character, 'BasePart', 'Shape', 'Cylinder')
        end
    end)
end)
plrwin:drawButton(1/3, 'Big', function()
    tk.dp(cval, function(z)
        if z.Character then
            topkek.tools.util.scalePlayer(5, z)
        end
    end)
end)
plrwin:drawButton(1/3, 'Small', function()
    tk.dp(cval, function(z)
        if z.Character then
            topkek.tools.util.scalePlayer(0.4, z)
        end
    end)
end)
plrwin:drawButton(1/3, 'Giraffe', function()
    tk.dp(cval, function(z)
        if z.Character then
            local char=z.Character
            local h=char.Head
            local tor=char:FindFirstChild("Torso")
            if not tor then return end
            tor.Neck.C0=tor.Neck.C0*CFrame.new(0,0,5)
            local fn=Instance.new("Part",char)
            fn.Size=Vector3.new(1,5.5,1)
            fn.Name="FakeNeck"
            fn.Anchored=false
            fn.CanCollide=false
            if char:FindFirstChild("Body Colors") then
                fn.BrickColor=char["Body Colors"].HeadColor
            end
            local cm=Instance.new("CylinderMesh",fn)
            local we=Instance.new("Weld",h)
            we.Part0=h
            we.Part1=fn
            we.C1=we.C1*CFrame.new(0,2.6,0)
        end
    end)
end)
plrwin:drawButton(1/3, 'Dab', function()
    tk.dp(cval, function(z)
        if z.Character and z.Character:FindFirstChild("Torso") then
            local chr = z.Character
            chr.Animate.Disabled = true
            chr.Torso["Left Shoulder"].C1 = CFrame.new(0, 0.699999988, 0, 0.939692616, 0, -0.342020124, -0.330366075, -0.258819044, -0.907673359, -0.0885213241, 0.965925813, -0.243210346)
            chr.Torso["Right Shoulder"].C1 = CFrame.new(-0.600000024, 0.5, -0.200000003, 0.664462984, 0.241844743, 0.707106769, -0.664462984, -0.241844788, 0.707106769, 0.342020154, -0.939692616, -3.09086197e-008)
            chr.Torso["Neck"].C1 = CFrame.new(0, -0.600000024, 0, -0.866025388, 0.5, 0, -0.171010137, -0.29619807, 0.939692616, 0.469846278, 0.813797653, 0.342020124)
        end
    end)
end)
plrwin:drawButton(1/3, 'Control', function()
    plr = game.Players:FindFirstChild(cval)
	if plr then
		client = topkek.tools.util.getClient(plr.Name)
		plr.Character.Archivable = true
		for _, v in pairs(plr.Backpack:GetChildren()) do
			v.Parent = topkek.lplr.Backpack
		end
		clone = plr.Character:Clone()
		plr.Character:Destroy()
		plr.Character = nil
		clone.Parent = workspace
		topkek.lplr.Character = clone
		wait(0.5)
		client.Execute:FireAllClients("controlcam", clone)
		topkek.client.Execute:FireAllClients("controlcam", clone)
		for _, v in pairs(clone:GetChildren()) do
			if v:IsA("Script") then
				v.Disabled = true
				wait()
				v.Disabled = false
			end
		end
	end
end)
plrwin:drawButton(1/3, 'Swap', function()
    plr = game.Players:FindFirstChild(cval)
	if plr then
		client = topkek.tools.util.getClient(plr.Name)
		plr.Character.Archivable = true
		topkek.lplr.Character.Archivable = true
		local holder = Instance.new("Model")
		for _, v in pairs(plr.Backpack:GetChildren()) do
			v.Parent = holder
		end
		for _, v in pairs(topkek.lplr.Backpack:GetChildren()) do
			v.Parent = plr.Backpack
		end
		for _, v in pairs(holder:GetChildren()) do
			v.Parent = topkek.lplr.Backpack
		end
		local cloneOther, cloneLocal = plr.Character:Clone(), topkek.lplr.Character:Clone()
		plr.Character:Destroy()
		plr.Character = nil
		cloneOther.Parent = workspace
		cloneLocal.Parent = workspace
		wait()
		topkek.lplr.Character = cloneOther
		plr.Character = cloneLocal
		wait(0.5)
		client.Execute:FireAllClients("controlcam", cloneLocal)
		topkek.client.Execute:FireAllClients("controlcam", cloneOther)
		for _, v in pairs(cloneOther:GetChildren()) do
			if v:IsA("Script") then
				v.Disabled = true
				wait()
				v.Disabled = false
			end
		end
		for _, v in pairs(cloneLocal:GetChildren()) do
			if v:IsA("Script") then
				v.Disabled = true
				wait()
				v.Disabled = false
			end
		end
	end
end)
plrwin:drawButton(1/3, 'Camlock', function()
    tk.dp(cval, function(z)
        z.CameraMode = "LockFirstPerson"
    end)
end)
plrwin:drawButton(1/3, 'Green PP', function()
	tk.dp(cval, function(z)
		person = z.Name
        color = "Bright green"
        pcall(function() v.Character["Nice thing"]:Remove() end)
        D = Instance.new("Model",workspace[person])
        D.Name = "Nice thing"
        bg = Instance.new("BodyGyro",workspace[person].HumanoidRootPart)
        d = Instance.new("Part")
        d.TopSurface = 0
        d.BottomSurface = 0
        d.Name = "Main"
        d.Parent = workspace[person]["Nice thing"]
        d.formFactor = 3
        d.Size = Vector3.new(2,10,2)
        d.BrickColor = BrickColor.new(color)
        d.Position = workspace[person].Head.Position
        d.CanCollide = true
        local cy = Instance.new("CylinderMesh")
        cy.Parent = d
        cy.Scale = Vector3.new(0.6,1,0.6)
        w = Instance.new("Weld")
        w.Parent = workspace[person].Head
        w.Part0 = d
        w.Part1 = workspace[person].Head
        w.C0 = CFrame.new(0,-5,2.35)*CFrame.Angles(math.rad(90),0,0)
        local c = Instance.new("Part")
        c.Name = "Mush"
        c.BottomSurface = 0
        c.TopSurface = 0
        c.FormFactor = 3
        c.Size = Vector3.new(1,1,1)
        c.CFrame = CFrame.new(d.Position)
        c.BrickColor = BrickColor.new("Pink")
        c.CanCollide = true
        c.Parent = workspace[person]["Nice thing"]
        local msm = Instance.new("SpecialMesh")
        msm.Parent = c
        msm.MeshType = "Head"
        msm.Scale = Vector3.new(1.199,1.199,1.199)
        local cw = Instance.new("Weld")
        cw.Parent = c
        cw.Part0 = d
        cw.Part1 = c
        cw.C0 = CFrame.new(0,5,0)
        local ball1 = Instance.new("Part")
        ball1.Parent = workspace[person]["Nice thing"]
        ball1.Name = "Left Ball"
        ball1.BottomSurface = 0
        ball1.TopSurface = 0
        ball1.CanCollide = true
        ball1.formFactor = 3
        ball1.Size = Vector3.new(2,2,2)
        ball1.CFrame = CFrame.new(workspace[person]["Left Leg"].Position)
        ball1.BrickColor = BrickColor.new(color)
        local bsm = Instance.new("SpecialMesh")
        bsm.Parent = ball1
        bsm.MeshType = "Sphere"
        bsm.Scale = Vector3.new(0.8,0.8,0.8)
        local b1w = Instance.new("Weld")
        b1w.Parent = ball1
        b1w.Part0 = workspace[person]["Left Leg"]
        b1w.Part1 = ball1
        b1w.C0 = CFrame.new(1.2,0.5,-0.6)
        local ball2 = Instance.new("Part")
        ball2.Parent = workspace[person]["Nice thing"]
        ball2.Name = "Right Ball"
        ball2.BottomSurface = 0
        ball2.CanCollide = true
        ball2.TopSurface = 0
        ball2.formFactor = 3
        ball2.Size = Vector3.new(2,2,2)
        ball2.CFrame = CFrame.new(workspace[person]["Right Leg"].Position)
        ball2.BrickColor = BrickColor.new(color)
        local b2sm = Instance.new("SpecialMesh")
        b2sm.Parent = ball2
        b2sm.MeshType = "Sphere"
        b2sm.Scale = Vector3.new(0.8,0.8,0.8)
        local b2w = Instance.new("Weld")
        b2w.Parent = ball2
        b2w.Part0 = workspace[person]["Right Leg"]
        b2w.Part1 = ball2
        b2w.C0 = CFrame.new(-1.2,0.5,-0.6)
	end)
end)
plrwin:drawButton(1/3, 'Bleach', function()
	tk.dp(cval, function(z)
		spawn(function()
			require(script.Bleach)(z.Name)
		end)
	end)
end)
plrwin:drawButton(1/3, 'Dog', function()
	-- Skidded from Kohl's Admin Commands 
	tk.dp(cval, function(v)
		if v and v.Character and v.Character:findFirstChild("Torso") then
		if v.Character:findFirstChild("Shirt") then v.Character.Shirt.Parent = v.Character.Torso end
		if v.Character:findFirstChild("Pants") then v.Character.Pants.Parent = v.Character.Torso end
		v.Character.Torso.Transparency = 1
		v.Character.Torso.Neck.C0 = CFrame.new(0,-.5,-2) * CFrame.Angles(math.rad(90),math.rad(180),0)
		v.Character.Torso["Right Shoulder"].C0 = CFrame.new(.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(90),0)
		v.Character.Torso["Left Shoulder"].C0 = CFrame.new(-.5,-1.5,-1.5) * CFrame.Angles(0,math.rad(-90),0)
		v.Character.Torso["Right Hip"].C0 = CFrame.new(1.5,-1,1.5) * CFrame.Angles(0,math.rad(90),0)
		v.Character.Torso["Left Hip"].C0 = CFrame.new(-1.5,-1,1.5) * CFrame.Angles(0,math.rad(-90),0)
		local new = Instance.new("Seat", v.Character) new.Name = "FAKETORSO" new.formFactor = "Symmetric" new.TopSurface = 0 new.BottomSurface = 0 new.Size = Vector3.new(3,1,4) new.CFrame = v.Character.Torso.CFrame
		local bf = Instance.new("BodyForce", new) bf.force = Vector3.new(0,new:GetMass()*196.25,0)
		local weld = Instance.new("Weld", v.Character.Torso) weld.Part0 = v.Character.Torso weld.Part1 = new weld.C0 = CFrame.new(0,-.5,0)
		for a, part in pairs(v.Character:children()) do if part:IsA("BasePart") then part.BrickColor = BrickColor.new("Brown") elseif part:findFirstChild("NameTag") then part.Head.BrickColor = BrickColor.new("Brown") end end
		end
	end)
end)
plrwin:drawButton(1/3, 'DISABLED', function()

end)
plrwin:drawButton(1/3, 'Creeper', function()
	-- Skidded from Kohl's Admin Commands
	tk.dp(cval, function(v)
		if v and v.Character and v.Character:findFirstChild("Torso") then
		if v.Character:findFirstChild("Shirt") then v.Character.Shirt.Parent = v.Character.Torso end
		if v.Character:findFirstChild("Pants") then v.Character.Pants.Parent = v.Character.Torso end
		v.Character.Torso.Transparency = 0
		v.Character.Torso.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(90),math.rad(180),0)
		v.Character.Torso["Right Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(90),0)
		v.Character.Torso["Left Shoulder"].C0 = CFrame.new(0,-1.5,-.5) * CFrame.Angles(0,math.rad(-90),0)
		v.Character.Torso["Right Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(90),0)
		v.Character.Torso["Left Hip"].C0 = CFrame.new(0,-1,.5) * CFrame.Angles(0,math.rad(-90),0)
		for a, part in pairs(v.Character:children()) do if part:IsA("BasePart") then part.BrickColor = BrickColor.new("Bright green") if part.Name == "FAKETORSO" then part:Destroy() end elseif part:findFirstChild("NameTag") then part.Head.BrickColor = BrickColor.new("Bright green") end end
		end
	end)
end)
plrwin:drawButton(1/3, 'Burden', function()
	tk.dp(cval, function(z)
		z.Character.Archivable = true
		clone = z.Character:Clone()
		clone.Parent = workspace
		local rope = Instance.new("RopeConstraint", z.Character.Torso)
		rope.Attachment0 = z.Character.Torso.NeckAttachment
		rope.Attachment1 = clone.Torso.NeckAttachment
		rope.Thickness = 0.5
		rope.Visible = true
		rope.Length = 15
		rope.Color = BrickColor.White()
	end)
end)
plrwin:drawButton(1/3, 'Attach', function()
	tk.dp(cval, function(z)
		z.Character.Archivable = true
		clone = z.Character:Clone()
		clone.Parent = workspace
		local rope = Instance.new("RopeConstraint", z.Character.Torso)
		rope.Attachment0 = z.Character.Torso.NeckAttachment
		rope.Attachment1 = topkek.lplr.Character.Torso.NeckAttachment
		rope.Thickness = 0.5
		rope.Visible = true
		rope.Length = 15
		rope.Color = BrickColor.White()
	end)
end)
plrwin:drawButton(1/3, 'Force Follow', function()
	tk.dp(cval, function(z)
		if z ~= topkek.lplr then
			local hax = script.Follow:Clone()
			local msg = Instance.new("ObjectValue", hax)
			msg.Name = "Target"
			msg.Value = topkek.lplr
			hax.Parent = z.Character
			hax.Disabled = false
		end
	end)
end)
--// SERVER //--
local servwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Server').Container)
local detailWin = servwin:drawContainer(1, 75, nil, nil, 18)
detailWin:drawText(1, 'Job ID: ' .. game.JobId)
pcall(function() detailWin:drawText(1, 'Game Name: ' .. game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name) end)
pcall(function() detailWin:drawText(1, 'Creator Name: ' .. game:GetService('Players'):GetNameFromUserIdAsync(game.CreatorId)) end)
servwin:drawButton(1/2, 'Save Map', function()
	topkek.tools.util.saveMap()
end)
servwin:drawButton(1/2, 'Load Map', function()
	topkek.tools.util.loadMap()
end)
local r6Force = false
local function hookR6(plr)
	plr.CharacterAdded:connect(function()
		if r6Force then
			r6Loader.load(plr.Name)
		end
	end)
end
r6Button = servwin:drawButton(1, 'Force R6 OFF', function()
	if r6Force then
		r6Force = false
		r6Button.Text = "Force R6 OFF"
		return
	end
	r6Force = true
	r6Button.Text = "Force R6 ON"
	for _, v in pairs(game.Players:GetPlayers()) do
		hookR6(v)
		v:LoadCharacter()
	end
end)
r6Loader = require(3094168370) -- not interested in implementing this myself sorry
game.Players.PlayerAdded:connect(function(plr)
	hookR6(plr)
end)
servwin:drawButton(1/2, 'Baseplate', function()
    for X = -2500, 2500, 512 do
        for Z = -2500, 2500, 512 do
            local P = Instance.new("Part")
            P.Anchored = true
            P.Locked = true
            P.Size = Vector3.new(512,3,512)
            P.CFrame = CFrame.new(X,0,Z)
            P.BrickColor = BrickColor.Green()
            P.Parent = game:service'Workspace'
        end
    end
end)
servwin:drawButton(1/2, 'Reset', function()
    for i,v in pairs(game:service'Workspace':GetChildren()) do
        if (not v:IsA("Terrain"))and(v.Name~="Camera") then
            v:Destroy()
        end
    end
    for X = -2500, 2500, 512 do
        for Z = -2500, 2500, 512 do
            local P = Instance.new("Part")
            P.Anchored = true
            P.Locked = true
            P.Size = Vector3.new(512,3,512)
            P.CFrame = CFrame.new(X,0,Z)
            P.BrickColor = BrickColor.Green()
            P.Parent = game:service'Workspace'
        end
    end
    for i, v in pairs(game:GetService('Players'):GetPlayers()) do
        v:LoadCharacter()
    end
end)
servwin:drawButton(1/2, 'Remove Sounds', function()
    tk.rcm(game, 'Sound')
end)
servwin:drawButton(1/2, 'Remove Terrain', function()
    workspace.Terrain:Clear()
end)
servwin:drawButton(1/2, 'Break All', function()
    tk.rcf('BasePart', function(o)
        o:BreakJoints()
    end)
end)
servwin:drawButton(1/2, 'Unlock All', function()
local function r(where)
        for _,v in pairs (where:GetChildren()) do
        if v:IsA("BasePart") then
        spawn(function() while wait(0.1) do v.Locked=false wait()   end end) end r(v) end end r(workspace)
end)
servwin:addSpacing()
local gravInp
servwin:drawButton(1/3, 'Gravity', function()
    if not tonumber(tk.txt(gravInp)) then return end
    workspace.Gravity = tonumber(tk.txt(gravInp))
end)
gravInp = servwin:drawTextBox(2/3, '')
servwin:addSpacing()
servwin:drawButton(1, 'Reset Lighting', function()
    local l = game:service'Lighting'
    l.Ambient = Color3.new(0, 0, 0)
    l.Brightness = 1
    l.GlobalShadows = true
    l.Outlines = true
    l.FogEnd = 100000
    l.FogStart = 0
    l:SetMinutesAfterMidnight(12*60)
end)
local brightInp
servwin:drawButton(1/3, 'Brightness', function()
    if not tonumber(tk.txt(brightInp)) then return end
    game:GetService('Lighting').Brightness = tonumber(tk.txt(brightInp))
end)
brightInp = servwin:drawTextBox(2/3, '100')
local fogInp
servwin:drawButton(1/3, 'Fog', function()
    if not tonumber(tk.txt(fogInp)) then return end
    game:GetService('Lighting').FogEnd = tonumber(tk.txt(fogInp))
end)
fogInp = servwin:drawTextBox(2/3, '0')
local timeInp
servwin:drawButton(1/3, 'Hour', function()
    if not tonumber(tk.txt(timeInp)) then return end
    game:GetService('Lighting'):SetMinutesAfterMidnight(60*tonumber(tk.txt(timeInp)))
end)
timeInp = servwin:drawTextBox(2/3, '12')
servwin:addSpacing()
-- private server crap
servwin:drawButton(1, 'Teleport to Private Server', function()
	local TS = game:GetService("TeleportService")
	local players = game:GetService("Players")
	local code = TS:ReserveServer(game.PlaceId)
	
	TS:TeleportToPrivateServer(game.PlaceId, code, players:GetPlayers())
end)
local privateToggle
local privStatus = false
privateToggle = servwin:drawButton(1, 'Private Server OFF', function()
    if privStatus == false then
        privStatus = true
        privateToggle.Text = 'Private Server ON'
        topkek.banmgr.makePrivate()
    else
        privateToggle.Text = 'Private Server OFF'
        topkek.banmgr.unprivate()
    end
end)
servwin:addSpacing()
servwin:drawText(1, 'Whitelist')
local plrAddInp
servwin:drawButton(1/3, 'Add', function()
    topkek.banmgr.doWhitelist(tk.txt(plrAddInp))
    ReorderWL()
end)
plrAddInp = servwin:drawTextBox(2/3, '')
wlCont = servwin:drawScrollingContainer(100)
function ReorderWL()
    local wl = topkek.banmgr.whitelist
    for i,v in pairs(wlCont:GetChildren()) do
        v:Destroy()
    end
    wlCont:setDrawY(3)
    for i,v in pairs(wl) do
        wlCont:drawText(2/3, v)
        wlCont:drawButton(1/3, 'Remove', function()
            topkek.banmgr.unwhitelist(v)
            ReorderWL()
        end)
    end
end
ReorderWL()
--// lplr //--
local lpwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('LocalPlayer').Container)
lpwin:drawButton(1, 'Clear Executed Scripts', function()
	for _, v in pairs(game.ServerScriptService:GetChildren()) do
		if v.Name == "Runner" or v.Name == "Executed" then
			v.Disabled = true
			v:Destroy()
		end
	end
end)
lpwin:drawButton(1, 'Reset Camera', function()
    topkek.client.Execute:FireAllClients("fixcam")
end)
lpwin:drawButton(1, 'Respawn', function()
    topkek.lplr:LoadCharacter()
end)
lpwin:drawButton(1, 'Rejoin', function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, topkek.lplr)
end)
lpwin:drawButton(1, 'Go Invisible', function()
	local function hide(p)
		if p == topkek.lplr then return end
		local scr = script.Anonymify:Clone()
		local tgt = Instance.new("ObjectValue", scr)
		tgt.Name = "Target"
		tgt.Value = topkek.lplr
		scr.Parent = p.PlayerGui
		scr.Disabled = false
	end
	for _, p in pairs(game.Players:GetPlayers()) do
		hide(p)
	end
	game.Players.PlayerAdded:connect(function(p)
		hide(p)
	end)
	topkek.lplr:ClearCharacterAppearance()
	tk.rco(topkek.lplr.Character, 'BasePart', 'Transparency', 1)
    tk.rco(topkek.lplr.Character, 'MeshPart', 'Transparency', 1)
    tk.rcm(topkek.lplr.Character, 'Decal')
    tk.rcm(topkek.lplr.Character, 'BillboardGui')
	topkek.lplr.Character.Name = ""
end)
lpwin:addSpacing()
lpwin:drawButton(1/2, 'God', function()
    if topkek.lplr.Character:FindFirstChild("Humanoid") then
        topkek.lplr.Character.Humanoid.MaxHealth = math.huge
        topkek.lplr.Character.Humanoid.Health = math.huge
    end
end)
lpwin:drawButton(1/2, 'Semigod', function()
    if topkek.lplr.Character:FindFirstChild("Humanoid") then
        topkek.lplr.Character.Humanoid.MaxHealth = 9e9
        topkek.lplr.Character.Humanoid.Health = 9e9
    end
end)
Loopgod = false
lpwin:drawButton(1, 'Loopgod', function()
    if Loopgod == false then
        Loopgod = true
        spawn(function()
            repeat
                topkek.lplr.Character.Humanoid.MaxHealth = math.huge
                topkek.lplr.Character.Humanoid.Health = math.huge
                wait()
            until Loopgod == false
        end)   
    else
        Loopgod = false
    end
end)
lpwin:addSpacing()
plrwin:addSpacing()
local Lev, Clip, Fly
lpwin:drawButton(1/2, 'Levitate', function()
    if Lev == true then
        Lev = false
        return
    end
    Lev = true
    repeat
        topkek.lplr.Character.Humanoid:ChangeState(10)
        wait(0)
    until Lev == false
end)
lpwin:drawButton(1/2, 'Noclip', function()
    topkek.client.Execute:FireAllClients("noclip")
end)
lpwin:drawButton(1/2, 'Fly', function()
	topkek.client.Execute:FireAllClients("fly")
end)
lpwin:drawButton(1/2, 'Highjump', function()
	topkek.client.Execute:FireAllClients("highjump")
end)
lpwin:addSpacing()
local apprInp
lpwin:drawButton(1/3, 'Appearance', function()
    local id = 0
    if tonumber(tk.txt(apprInp)) then
        id = tonumber(tk.txt(apprInp))
    else
        id = game:GetService('Players'):GetUserIdFromNameAsync(tk.txt(apprInp))
    end
    if topkek.lplr.Character:FindFirstChild("Humanoid") then
        topkek.lplr.Character.Humanoid.Health = 0
    end
    topkek.lplr.CharacterAppearance = 'https://assetgame.roblox.com/Asset/CharacterFetch.ashx?userId=' .. tostring(id)
end)
apprInp = lpwin:drawTextBox(2/3, 'ROBLOX')
local teamInp
lpwin:drawButton(1/3, 'Team', function()
    topkek.lplr.TeamColor = BrickColor.new(tk.txt(teamInp))
end)
teamInp = lpwin:drawTextBox(2/3, 'Bright red')
lpwin:drawButton(1/2, 'Naked', function()
    topkek.lplr:ClearCharacterAppearance()
end)
lpwin:drawButton(1/2, 'Neutral', function()
    topkek.lplr.Neutral = true
end)
lpwin:addSpacing()
lpwin:drawButton(1/2, 'Orb', function()
	topkek.client.Execute:FireAllClients("freecam")
    local m = Instance.new("Model", game.Workspace)
    m.Name = topkek.lplr.Name
    local hum = Instance.new("Humanoid", m)
    hum.Health = 0
    hum.MaxHealth = 0
    local orb = Instance.new("Part", m)
    orb.Size = Vector3.new(1, 1, 1)
    orb.Shape = "Ball"
    orb.Name = "Head"
    orb.Anchored = true
    orb.CanCollide = true
    orb.BottomSurface = Enum.SurfaceType.Smooth
    orb.TopSurface = Enum.SurfaceType.Smooth
    orb.Transparency = 0
    spawn(function()
        while true do
            wait(0.1)
            if orb then
                orb.BrickColor = BrickColor.Random()
            else break end
        end
    end)
   
    game:GetService("RunService").Heartbeat:connect(function()
        orb.CFrame = topkek.cmouse.GetCameraCFrame:InvokeClient(topkek.lplr) * CFrame.new(0, -2, -6)
    end)
    topkek.lplr.Chatted:connect(function(a)
        game:GetService("Chat"):Chat(orb, a)
    end)
end)

lpwin:drawButton(1/2, 'Freecam', function()
	topkek.client.Execute:FireAllClients("freecam")
end)

lpwin:drawButton(1/2, 'NoGrav', function()
    if topkek.lplr.Character then
        for x,m in pairs(topkek.lplr.Character:GetChildren()) do
            if m:IsA("BasePart") then
                local bf = Instance.new("BodyForce", m)
                bf.force = Vector3.new(0, 192.25, 0) * m:GetMass()
            end
            if m:IsA("Hat") or m:IsA("Accessory") then
                if m:findFirstChild("Handle") then
                    local bf = Instance.new("BodyForce", m.Handle)
                    bf.force = Vector3.new(0, 192.25, 0) * m.Handle:GetMass()
                end
            end
        end
    end
end)
lpwin:drawButton(1/2, 'Trowel', function()
    topkek.tools.util.trowel()
end)
lpwin:addSpacing()
lpwin:drawButton(1/2, 'Fedora', function()
    local hats={
        98346834,
        215751161,
        119916949,
        72082328,
        147180077,
        100929604,
        63043890,
        1285307,
        1029025,
        334663683,
        259423244
    }
    local model = game:GetService("InsertService"):LoadAsset(hats[math.random(1,#hats)])
	model:GetChildren()[1].Parent = topkek.lplr.Character
end)
lpwin:drawButton(1/2, 'Rainbow Name', function()
    topkek.lplr.Neutral = false
	local k, add = 1, 5
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(k/255,0/255,0/255))
		k = k + add
	wait()
	end
	while true do
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(255/255,k/255,0/255))
		k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(255/255 - k/255,255/255,0/255))
		k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(0/255,255/255,k/255))
		k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(0/255,255/255 - k/255,255/255))
		k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(k/255,0/255,255/255))
		k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(255/255,0/255,255/255 - k/255))
		k = k + add
	wait()
	end
	while k <= 255 do
		topkek.lplr.TeamColor = BrickColor.new(Color3.new(255/255 - k/255,0/255,0/255))
		k = k + add
	wait()
	end
	end
end)
local tagInp
lpwin:drawButton(1/3, 'Tag', function()
    local len = 10
    local bb = Instance.new("BillboardGui")
    bb.Parent = topkek.lplr.Character.Head
    bb.Adornee = topkek.lplr.Character.Head
    bb.AlwaysOnTop = true
    bb.Enabled = true
    bb.Size = UDim2.new(len, 0, 1.5, 0)
    bb.Name = "tag"
    bb.StudsOffset = Vector3.new(0, 3, 0)
    --local fr = Instance.new("Frame")
    --fr.Parent = bb
    --fr.Size = UDim2.new(1, 0, 1, 0)
    --fr.Style = Enum.FrameStyle.RobloxRound
    local tl = Instance.new("TextLabel")
    tl.Parent = bb
    tl.Font = Enum.Font.Code
    tl.BackgroundTransparency = 1
    tl.TextScaled = true
    tl.TextColor3 = Color3.new(15/255, 15/255, 15/255)
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.Text = tk.txt(tagInp)
    tl.Name = "trutag"
    tl.Visible = true
    tl.ZIndex = 2
end)
tagInp = lpwin:drawTextBox(2/3, '')
--// SCRIPTS //--
local scriptwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Scripts').Container)
local search = scriptwin:drawButton(1, '', function()end)
dropScripts = GUI.DropDown.New(UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), search, {'All'})
function fixPlayerDropScripts()
    local t = {'All'}
    for i, v in pairs(game.Players:GetPlayers()) do
        table.insert(t, v.Name)
    end
    dropScripts.SetTable(t)
end
game.Players.PlayerAdded:connect(function()
    fixPlayerDropScripts()
end)
game.Players.PlayerRemoving:connect(function()
    fixPlayerDropScripts()
end)

cval2 = 'All'
fixPlayerDropScripts()
 
function updatePlayerScripts(plri)
    cval2 = plri
end
dropScripts.Changed(updatePlayerScripts)
dropScripts.Select(topkek.lplr.Name)
local search = scriptwin:drawTextBox(1,'')
local origy = scriptwin:getDrawY()
scriptwin:addSpacing()
scriptwin:addSpacing()
local scripts = script.Scripts
local container = {}
function Run(scr, target)
	local runner = script.Runner:Clone()
	local req = scr:Clone()
	req.Name = "Require"
	req.Parent = runner
	local tgv = Instance.new("StringValue", runner)
	tgv.Value = target
	tgv.Name = "Target"
	runner.Parent = game.ServerScriptService
	runner.Disabled = false
end
function MakeList(condition)
    for i,v in pairs(scriptwin:GetChildren()) do
        if v.Name == "Script" then
            v:Destroy()
        end
    end
    scriptwin:setDrawY(origy)
	local children = scripts:GetChildren()
	table.sort(children, function ( a, b )
    	return a.Name:lower() < b.Name:lower()
	end)
    for i, v in pairs(children) do
        if string.find(v.Name:lower(), condition:lower()) or (condition == "") or (condition == " ") then
            local scr = scriptwin:drawButton(1, v.Name, function()
                spawn(function() 
					if cval2 == 'All' then
						topkek.log:record("Script", v.Name, "All")
						for _, plr in pairs(game.Players:GetPlayers()) do
							Run(v, plr.Name)
						end	
					else
						topkek.log:record("Script", v.Name, cval2)
						Run(v, cval2)
					end
				end)
            end, 25)
            scr.Name = 'Script'
        end
    end
end
topkek.cmouse.ConnectInputRead:FireAllClients(search)
topkek.cmouse.ConnectInputRead.OnServerEvent:connect(function(plr, obj)
	if obj == search then
		MakeList(tk.txt(search))
	end
end)
MakeList('')

--// DESTRUCTION // --
local destwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Destruction').Container)
local noticeContainer = topkek.tools.util.Object("Frame", {
	Parent = topkek.tools.util.getContainer('Destruction').Container,
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundColor3 = topkek.settings.primary(),
	BackgroundTransparency = 0.8,
	ZIndex = 14,
})
local notice = topkek.tools.util.Object("TextLabel", {
	Parent = noticeContainer,
	Size = UDim2.new(0.8, 0, 1, 0),
	Position = UDim2.new(0.1, 0, 0, 0),
	BackgroundTransparency = 1,
	Font = "SourceSansBold",
	TextSize = 25,
	TextWrapped = true,
	TextColor3 = topkek.settings.text(),
	Text = "This module has been disabled due to severe abuse. Soon, this menu will be transformed into a Discord-based require hub.",
	ZIndex = 15
})
--// CMDS //--
cmdwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Commands').Container)
count = 0
for _, _ in pairs(cmd.commands.store) do count = count + 1 end
cmdwin:drawText(1, tostring(count) .. " Commands")
cmdwin:drawText(1, 'Chat Prefix: /')
local cmdlist = cmdwin:drawScrollingContainer(300)
for i, v in pairs(cmd.commands.fmtstore) do
    local xfmt = {}
    local str = "  ;" .. i .. " "
    for form in v:gmatch("[^%%]+") do
        if form ~= 'cmd' then
            if form == 'inf' then form = 'str' end
            str = str .. "{" .. form .. "} "
        end
    end
    cmdlist:drawText(1, str)
end
--// MUSIC //--
musicwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Music').Container)
Sounds = {
    {"caramell", 2303479};
    {"epic", 27697743};
    {"rick", 2027611}; 
    {"halo", 1034065};
    {"pokemon", 1372261};
    {"cursed", 1372257};
    {"extreme", 11420933};
    {"awaken", 27697277};
    {"alone", 27697392};
    {"mario", 1280470};
    {"choir", 1372258};
    {"chrono" ,1280463};
    {"dotr", 11420922};
    {"entertain", 27697267};
    {"fantasy", 1280473};
    {"final", 787};
    {"organ", 11231513};
    {"tunnel", 9650822}
}
 
local cursel
local xcursel = 0
scr = musicwin:drawScrollingContainer(250)
for i, v in pairs(Sounds) do
    scr:drawButton(1, v[1] .. " - " .. tonumber(v[2]), function()
        cursel.Text = "Currently Selected - " .. v[1]
        xcursel = v[2]
    end)
end
 
cursel = musicwin:drawText(1, "Currently Selected - None")
local setInp
musicwin:drawButton(1/3, "Set", function()
    if tonumber(tk.txt(setInp)) then
        cursel.Text = "Currently Selected - " .. setInp.Text
        xcursel = tonumber(tk.txt(setInp))
    end
end)
setInp = musicwin:drawTextBox(2/3, '')
musicwin:drawButton(1, "Play", function()
    tk.rcm(game, 'Sound')
    tk.play(xcursel)   
end)
musicwin:drawButton(1, "Stop", function()
    tk.rcm(game, 'Sound')
end)
--// FACES //--
facwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Faces').Container)
local faces = {
    {name='Rofl',id=47595647},
    {name='Sparta',id=74142203},
    {name='UJelly',id=48989071},
    {name='Troll',id=45120559},
    {name='Horse',id=62079221},
    {name='Angry',id=48258623},
    {name='Okey',id=62830600},
    {name='Yeaw',id=53646377},
    {name='Here',id=62677045},
    {name='Har',id=48260066},
    {name='Baby Sun',id=47596170},
    {name='LOL',id=48293007},
    {name='Sad',id=53645378},
    {name='Joseph Stalin',id=48290678},
    {name='Doge',id=130742396},
    {name='Forever Alone',id=156886272},
    {name='RickRoll',id=5104631},
    {name='Jim Carrey',id=74885351},
    {name='Meh IRL',id=237553381},
	{name='Tryhard',id=1569795428}
}
local cursel, xcursel = nil, 0
faclist = facwin:drawScrollingContainer(300)
for i,v in pairs(faces) do
    local btn = faclist:drawButton(1, v['name'], function()
        xcursel = v['id']
        cursel.Text = 'Currently Selected: ' .. v['name']
    end)
    topkek.tools.gui:addLeftIcon(btn,'rbxassetid://'..tostring(v['id']),20)
end
cursel = facwin:drawText(1, 'Currently Selected: None')
facwin:drawButton(1, 'Wear', function()
    if not (xcursel == 0) then
        if topkek.lplr.Character then
            tk.rcm(topkek.lplr.Character, 'Accessory')
            tk.rcm(topkek.lplr.Character, 'Hat')
            topkek.tools.util.applyFace(xcursel)
        end
    end
end)
--// SETTINGS // --
setwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Settings').Container)
setwin:drawText(1, 'Patch: ' .. topkek.patch)
setwin:drawText(1, 'Devnote: thank you for supporting 5.0 <3')
setwin:addSpacing()
primaryTxt   = setwin:drawText(1, '    Primary Color');   primaryTxt.TextXAlignment = 'Left'
secondaryTxt = setwin:drawText(1, '    Secondary Color'); secondaryTxt.TextXAlignment = 'Left'
tertiaryTxt  = setwin:drawText(1, '    Tertiary Color');  tertiaryTxt.TextXAlignment = 'Left'
textTxt      = setwin:drawText(1, '    Text Color');      textTxt.TextXAlignment = 'Left'
local function createColorButton(parent, which)
	local obj = topkek.tools.util.Object("TextButton", {
        Parent = parent;
        BackgroundColor3 = topkek.settings[which]();
        BorderSizePixel = 1;
        Position = UDim2.new(1, -52, 0, 2);
        Size = UDim2.new(0, 50, 1, -4);
        Font = 'SourceSans';
        FontSize = 'Size14';
        Text = 'Change';
        TextSize = 14;
        TextColor3 = tk.shift(topkek.settings.text(), -50);
		ZIndex = 15;
    })
	obj.MouseButton1Down:connect(function()
		topkek.client.Execute:FireAllClients("openpicker", topkek.settings[which](), which)
	end)
	return obj
end
primaryBtn   = createColorButton(primaryTxt, "primary")
secondaryBtn = createColorButton(secondaryTxt, "secondary")
tertiaryBtn  = createColorButton(tertiaryTxt, "tertiary")
textBtn      = createColorButton(textTxt, "text")

exportBox = setwin:drawTextBox(3/5, 'Copy this text to Discord!'); exportBox.ClipsDescendants = true; exportBox.ClearTextOnFocus = false
exportBtn = setwin:drawButton(2/5, 'Export', function()
	exportBox.Text = topkek.settings.write()
end)
setwin:addSpacing()
local menusEnabled = true
contextBtn = setwin:drawButton(1, 'Disable Player Context Menus', function()
	menusEnabled = not menusEnabled
	contextBtn.Text = menusEnabled and 'Disable Player Context Menus' or 'Enable Player Context Menus'
	topkek.client.Execute:FireAllClients("togglecontext")
end)
setwin:addSpacing()
setwin:drawText(1, [[
    === CREDITS ===
   
    ROBLOX - y u delete?
	Reizayah - told me some stuff
   	
    Thanks to everyone that supported T0PK3K 5.0!
   
]], 125)
setwin:addSpacing()
--// BANLIST //--
banwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Banlist').Container)
local plrBanInp
banwin:drawButton(1/3, 'Add', function()
    topkek.settings.get()
    table.insert(topkek.settingsTable['Bans'], tk.txt(plrBanInp))
    topkek.settings.write()
    UpdateBanlist()
end)
plrBanInp = banwin:drawTextBox(2/3, '')
banCont = banwin:drawScrollingContainer(320)
function UpdateBanlist(x)
    topkek.settings.get()
    local wl = x or topkek.settingsTable['Bans']
    for i,v in pairs(banCont:GetChildren()) do
        v:Destroy()
    end
    banCont:setDrawY(3)
    for i,v in pairs(wl) do
		if game.Players:FindFirstChild(v) then
			game.Players[v]:Kick("You are banned.")
		end
        banCont:drawText(2/3, v)
        banCont:drawButton(1/3, 'Remove', function()
            for x, m in pairs(wl) do
                if m == v then
                    table.remove(topkek.settingsTable['Bans'], x)
                    topkek.banmgr.bans = topkek.settingsTable['Bans']
                    topkek.settings.write()
                    UpdateBanlist()
                end
            end
        end)
    end
end
UpdateBanlist()
--// GEAR //--
hatwin = topkek.tools.gui:hookContainer(topkek.tools.util.getContainer('Gear').Container)
local gear = require(script.Gear)
local searchi = hatwin:drawButton(1, '', function()end)
dropx = GUI.DropDown.New(UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), searchi, {'All'})
function fixPlayerDropi()
    local t = {'All'}
    for i, v in pairs(game.Players:GetPlayers()) do
        table.insert(t, v.Name)
    end
    dropx.SetTable(t)
end
game.Players.PlayerAdded:connect(function()
    fixPlayerDropi()
end)
game.Players.PlayerRemoving:connect(function()
    fixPlayerDropi()
end)
local eval = 'All'
dropx.Changed(function(p) eval = p end)
fixPlayerDropi()
 
local hatInp
hatlist = hatwin:drawScrollingContainer(300)
hatlist.ScrollingEnabled = false
for name, id in pairs(gear) do
    local hb = hatlist:drawButton(1, name, function()
        hatInp.Text = tostring(id[2])
    end)
	topkek.tools.gui:addLeftIcon(hb, 'https://www.roblox.com/asset-thumbnail/image?assetId=' .. tostring(id[2]) .. '&width=420&height=420&format=png', 20)
end

hatwin:drawButton(1/3, 'Equip', function()
	topkek.log:record("EquipGear", tonumber(tk.txt(hatInp)))
    local gr = game:GetService("InsertService"):LoadAsset(tonumber(tk.txt(hatInp))):GetChildren()[1]
    tk.dp(eval, function(x)
        if x.Character then
            gr:Clone().Parent = x.Backpack
        end
    end)
end)

hatInp = hatwin:drawTextBox(2/3, '')
topkek.tools.animator.initialAnimation()
topkek.banmgr.init()
topkek.tools.util.saveMap()
end});
