---@diagnostic disable-next-line: undefined-global
lib.versionCheck('Justus-Braun/quiz-menu')

local function openMenu(source, questions, header)
    local clientData = {
        header = header,
        questions = questions
    }
    TriggerClientEvent("quiz-menu:client:open", source, clientData)
end

local function generateClientQuestions(questions)
    local clientQuestions = {}

    for i = 1, #questions do
        local q = {
            question = questions[i].question,
            answers = questions[i].wrongAnswers
        }
        table.insert(q.answers, questions[i].correctAnswers)
        table.insert(clientQuestions, q)
    end

    return clientQuestions
end

local function openQuestionMenu(source, questions, header)
    if Cache.ClientIsInUse(source) then
        return
    end

    local data = generateClientQuestions(questions)

    Cache.Add(source, questions, 'normal')

    openMenu(source, data, header)
end

local function openQuestionMenuRandom(source, questions, header, amount)
    if Cache.ClientIsInUse(source) then
        return
    end

    local data = generateClientQuestions(questions)
    local randomArray = Utils.PickRandomElementsInRandomOrder(data, amount)
    Cache.Add(source, questions, 'random')

    openMenu(source, randomArray, header)
end

local function finishQuiz(source, checkedAnswers)
    local clientData = Cache.Get(source)
    if not clientData then
        return
    end

    local amountOfCorrectAnswers, amountOfQuestions = Utils.CheckArray[clientData.type](checkedAnswers, clientData.questions)

    Cache.Remove(source)

    print("Player " .. source .. " has finished the quiz with " .. amountOfCorrectAnswers .. " correct answers out of " .. amountOfQuestions)
end

exports('openQuestionMenu', openQuestionMenu)
exports('openQuestionMenuRandom', openQuestionMenuRandom)

RegisterNetEvent("quiz-menu:server:finish", function (checkedAnswers)
    local source = source
    finishQuiz(source, checkedAnswers)
end)