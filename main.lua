CurrenState = "OFF"
CurrentPupu = "None"
Firstpupu = {}
Secondpupu = {}
--****gloal varables****

function OnEvent(event, arg)

    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
	end
	current_mkey = GetMKeyState()

	if (event == "G_PRESSED" and current_mkey ~= 3) then
		PupuClass = nil
	end	

	if (event == "G_PRESSED" and arg == 1 and current_mkey == 1) then
		PupuClass = PUPU:CreateAkm()
	end
	if (event == "G_PRESSED" and arg == 2 and current_mkey == 1) then
		PupuClass = PUPU:CreateAkm4x()
	end


	if (event == "G_PRESSED" and arg == 3 and current_mkey == 1) then
		PupuClass = PUPU:CreateScarl()
	end

	if (event == "G_PRESSED" and arg == 4 and current_mkey == 1) then
		PupuClass = PUPU:CreateScarl4X()
	end

	if (event == "G_PRESSED" and arg == 1 and current_mkey == 3) then
		if(PupuClass ~= nil) then
			PupuClass:Save(1)
		end
	end

	if (event == "G_PRESSED" and arg == 2 and current_mkey == 3) then
		if(PupuClass ~= nil) then
			PupuClass:Save(2)
		end
	end

	if (event == "G_PRESSED" and arg == 3 and current_mkey == 3) then
		PupuClass = Firstpupu 
		CurrenState = "ON"
		PressKey("1")	
		ReleaseKey("1")		
	end

	if (event == "G_PRESSED" and arg == 4 and current_mkey == 3) then
		PupuClass = Secondpupu
		CurrenState = "ON"	
		PressKey("2")	
		ReleaseKey("2")
	end


	if(event == "G_PRESSED" and PupuClass ~= nil and current_mkey ~= 3) then
		PupuClass:Initialize()
	end

	if (event == "MOUSE_BUTTON_PRESSED"  and arg == 1 and PupuClass ~= nil and CurrenState == "ON")  then
		PupuClass:Basicloves()
	end
end



function GetState()
	if CurrenState == "OFF" then
		CurrenState = "ON"
	else
		CurrenState = "OFF"
	end
	return CurrenState
end

function CheckPupu(s)
	if s ~= CurrentPupu then
		CurrenState = "OFF"
	end
	return s
end




--class sections
PUPU = {}
PUPU.__index = PUPU

function PUPU:CreateAkm()
    local this =
    {
        BasicRecoilX = {-0.104,-0.244,-0.272,-0.343,-0.201,-0.057,-0.741,-0.162,0.023,0.362,-0.33,-0.121,-0.795,-0.53,-1.135,-0.781,-1.146,-0.29,0.396,0.479,-0.557,-0.047,0.824,0.443,-0.163,-0.491,0.715,0.245,0.617},
        BasicRecoilY = {4.331,2.675,3.639,3.229,3.329,4.002,4.249,4.444,4.463,4.072,4.53,4.863,4.537,4.658,4.53,4.323,4.648,4.864,5.266,4.485,5.205,4.431,5.558,5.495,4.947,5.074,5.56,5.568,6.449},
        Name = "AKM AUTO ",
        Speed = 175,
	    MultiplierX = 5,
		MultiplierY = 15
    }
    setmetatable(this, PUPU)
    return this
end

function PUPU:CreateAkm4x()
    local this =
    {
        BasicRecoilX = {-0.104,-0.244,-0.272,-0.343,-0.201,-0.057,-0.741,-0.162,0.023,0.362,-0.33,-0.121,-0.795,-0.53,-1.135,-0.781,-1.146,-0.29,0.396,0.479,-0.557,-0.047,0.824,0.443,-0.163,-0.491,0.715,0.245,0.617},
        BasicRecoilY = {4.331,2.675,3.639,3.229,3.329,4.002,4.249,4.444,4.463,4.072,4.53,4.863,4.537,4.658,4.53,4.323,4.648,4.864,5.266,4.485,5.205,4.431,5.558,5.495,4.947,5.074,5.56,5.568,6.449},
        Name = "AKM AUTO 4x",
        Speed = 150,
	    MultiplierX = 15,
		MultiplierY = 50
    }
    setmetatable(this, PUPU)
    return this
end

function PUPU:CreateScarl()
    local this =
    {
        BasicRecoilX = {-0.192,-0.042,0.666,0.388,0.677,0.185,0.502,0.294,1.152,0.569,-0.516,-0.363,-0.536,-0.297,1.311,0.411,1.204,0.779,-0.708,-0.397,-0.437,-0.243,0.737,0.269,0.959,0,0.794,0.441,-0.724},
        BasicRecoilY = {3.671,1.506,2.064,2.851,2.418,3.25,3.288,3.917,3.707,3.527,3.358,3.296,3.252,2.743,3.758,3.683,3.144,3.513,3.017,3.356,3.699,3.993,3.909,3.479,4.002,3.953,3.735,4.327,4.457},
        Name = "Scarl auto ",
        Speed = 150,
	    MultiplierX = 5,
		MultiplierY = 15
    }
    setmetatable(this, PUPU)
    return this
end

function PUPU:CreateScarl4X()
    local this =
    {
        BasicRecoilX = {-0.192,-0.042,0.666,0.388,0.677,0.185,0.502,0.294,1.152,0.569,-0.516,-0.363,-0.536,-0.297,1.311,0.411,1.204,0.779,-0.708,-0.397,-0.437,-0.243,0.737,0.269,0.959,0,0.794,0.441,-0.724},
        BasicRecoilY = {3.671,1.506,2.064,2.851,2.418,3.25,3.288,3.917,3.707,3.527,3.358,3.296,3.252,2.743,3.758,3.683,3.144,3.513,3.017,3.356,3.699,3.993,3.909,3.479,4.002,3.953,3.735,4.327,4.457},
        Name = "Scarl auto 4X",
        Speed = 150,
	    MultiplierX = 15,
		MultiplierY = 50
    }
    setmetatable(this, PUPU)
    return this
end



function PUPU:Initialize()
	CurrentPupu = CheckPupu(self.Name)
	OutputDebugMessage("LOGITECHSCRIPT_%s%s\n",CurrentPupu,GetState())
end

function PUPU:Save(d)
	szoveg = ""
	if(d==1)then
		Firstpupu = self
		szoveg = "first place"
	end
	if(d==2)then
		Secondpupu = self
		szoveg = "second place"
	end
	OutputDebugMessage("LOGITECHSCRIPT_%s Saved to %s\n",self.Name,szoveg)
end




function PUPU:Basicloves()
    	ism = 1 
	while  IsMouseButtonPressed(1) do
		--EnablePrimaryMouseButtonEvents(false)
		--if overflow then start to 1
		if (ism > table.getn(self.BasicRecoilX)) then 
			ism = 1
		end   
		
		--if tap mode use quick jump to the right positon, not smooth
		tappingmplier = 1   
		felbontas = 3--its for smooth movements
		if (IsModifierPressed("shift")) then 
			tappingmplier = 0.60--it depend the fire rate. taping is slower so we have to use this
			felbontas = 2--in this case the loop bellow only run at once
		end   
		
		PressMouseButton(1)--start to shoot
		lepes = 1--its for smooth movements
		while lepes < felbontas do--for smooth movement ve divide the mov to small moves
			MoveMouseRelative((self.BasicRecoilX[ism] * (self.MultiplierX*tappingmplier))/felbontas , (self.BasicRecoilY[ism] * (self.MultiplierY*tappingmplier))/felbontas )--this is the soul
			Sleep(self.Speed/felbontas)--we divide the dps time too
			lepes = lepes + 1--register divided the step count
		end
		ReleaseMouseButton(1)--end of actual shot
		--EnablePrimaryMouseButtonEvents(true)
		ism = ism + 1	--register the step count
	end	
--until not IsMouseButtonPressed(1) or IsModifierPressed("shift")--if xou release the mouse or use alt to tap then you are exit this loop
end
