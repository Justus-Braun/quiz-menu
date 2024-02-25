---Puts the elements of an array in a random order.
---@param array table
local function putInRandomOrder(array)
    local n = #array
    math.randomseed(os.time())
    for i = 1, n do
        local j = math.random(n)
        array[i], array[j] = array[j], array[i]
    end

    return array
end

---Picks random elements from an array.
---@param array table
---@param amount number
---@return table
local function pickRandomElements(array, amount)
    local picked = {}
    local pickedAmount = 0
    math.randomseed(os.time())
    while pickedAmount < amount do
        local randomNumber = math.random(#array)
        picked[pickedAmount] = array[randomNumber]
        pickedAmount = pickedAmount + 1
        table.remove(array, randomNumber)
    end

    return picked
end

---Picks random elements from an array and puts them in a random order.
---@param array table
---@param amount number
---@return table
local function pickRandomElementsInRandomOrder(array, amount)
    local picked = pickRandomElements(array, amount)

    for i = 1, #picked do
        picked[i].answers = putInRandomOrder(picked[i].answers)
    end

    return picked
end

---Finds the true answers for a question.
---@param question string
---@param originalQuestions table
---@return string[] | nil
local function findTrueAnswerByQuestion(question, originalQuestions)
    for _, value in pairs(originalQuestions) do
        if value.question == question then
            if type(value.correctAnswers) == "string" then
                value.correctAnswers = {value.correctAnswers}
            end
            return value.correctAnswers
        end
    end

    return nil
end


---Checks if the true answers are checked.
---@param answers string[]
---@param correctAnswers string[]
---@return boolean
local function checkIfTrueAnswersAreChecked(answers, correctAnswers)
    local amountOfTrueAnswers = 0
    for i = 1, #answers do
        for j = 1, #correctAnswers do
            if answers[i] == correctAnswers[j] then
                amountOfTrueAnswers = amountOfTrueAnswers + 1
            end
        end
    end


    return amountOfTrueAnswers == #correctAnswers
end

local function checkRandomArray(randomArrayChecked, originalQuestions)
    local amountOfCorrectAnswers = 0

    for i = 1, #randomArrayChecked do
        local question = randomArrayChecked[i].question
        local answers = randomArrayChecked[i].answers

        local correctAnswers = findTrueAnswerByQuestion(question, originalQuestions)

        if correctAnswers then
            if checkIfTrueAnswersAreChecked(answers, correctAnswers) then
                amountOfCorrectAnswers = amountOfCorrectAnswers + 1
            end
        end
    end

    return amountOfCorrectAnswers, #randomArrayChecked
end

local function checkNormalArray(normalArrayChecked, originalQuestions)
    local amountOfCorrectAnswers = 0

    for i = 1, #normalArrayChecked do
        local question = normalArrayChecked[i].question
        local answers = normalArrayChecked[i].answers

        local correctAnswers = findTrueAnswerByQuestion(question, originalQuestions)

        if correctAnswers then
            if checkIfTrueAnswersAreChecked(answers, correctAnswers) then
                amountOfCorrectAnswers = amountOfCorrectAnswers + 1
            end
        end
    end

    return amountOfCorrectAnswers, #normalArrayChecked

end

Utils = {
    PutInRandomOrder = putInRandomOrder,
    PickRandomElements = pickRandomElements,
    PickRandomElementsInRandomOrder = pickRandomElementsInRandomOrder,
    CheckArray = {
        ['random'] = checkRandomArray,
        ['normal'] = checkNormalArray
    }
}
