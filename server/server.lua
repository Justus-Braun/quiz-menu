---@diagnostic disable-next-line: undefined-global
lib.versionCheck('Justus-Braun/quiz-menu')

---Deep copy of a table. (Because FiveM doesn't support table.deepcopy) and table.clone is not deep. Because FiveM is a bit special. (https://shorturl.at/flCV3)
---@param obj any
---@return any
local function copy(obj)
    if type(obj) ~= 'table' then return obj end
    local res = {}
    for k, v in pairs(obj) do res[copy(k)] = copy(v) end
    return res
end

local function openMenu(source, questions, header)
    local clientData = {
        header = header,
        questions = questions
    }
    TriggerClientEvent("quiz-menu:client:open", source, clientData)
end

local function generateClientQuestions(questionPointer)
    local questions = copy(questionPointer)

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

local function openQuestionMenu(source, questions, header, callback)
    if Cache.ClientIsInUse(source) then
        return
    end

    local data = generateClientQuestions(questions)

    Cache.Add(source, questions, 'normal', callback)

    openMenu(source, data, header)
end

local function openQuestionMenuRandom(source, questions, header, amount, callback)
    if Cache.ClientIsInUse(source) then
        return
    end

    local data = generateClientQuestions(questions)
    local randomArray = Utils.PickRandomElementsInRandomOrder(data, amount)

    Cache.Add(source, questions, 'random', callback)

    openMenu(source, randomArray, header)
end

local function finishQuiz(source, checkedAnswers)
    local clientData = Cache.Get(source)
    if not clientData then
        return
    end

    local amountOfCorrectAnswers, amountOfQuestions = Utils.CheckArray[clientData.type](checkedAnswers, clientData.questions)

    Cache.Remove(source)

    if clientData.callback then
        clientData.callback(amountOfCorrectAnswers, amountOfQuestions)
    end
end

exports('OpenQuestionMenu', openQuestionMenu)
exports('OpenQuestionMenuRandom', openQuestionMenuRandom)

RegisterNetEvent("quiz-menu:server:finish", function (checkedAnswers)
    local source = source
    finishQuiz(source, checkedAnswers)
end)