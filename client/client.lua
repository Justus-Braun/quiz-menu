local function toggleNuiFrame(shouldShow)
	SetNuiFocus(shouldShow, shouldShow)
	SendReactMessage('setVisible', shouldShow)
end

RegisterNUICallback('hideFrame', function(_, cb)
	toggleNuiFrame(false)
	debugPrint('Hide NUI frame')
	cb({})
end)

RegisterNetEvent('quiz-menu:client:open', function(questions)
	toggleNuiFrame(true)
	SendReactMessage('setData', questions)
end)

RegisterNUICallback('submitForm', function(body, cb)
	local checkedAnswers = body
	toggleNuiFrame(false)
	TriggerServerEvent('quiz-menu:server:finish', checkedAnswers)
	cb({})
end)
