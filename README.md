# QUIZ MENU

This is a simple quiz menu that can be used in any resource. It is a simple menu that can be used to ask questions and get answers from the player.

The questions get only validated on the server side, the client has never the answer to the questions.

## Usage

To use this menu, you need to add the following code to your resource:
```lua
exports['quiz-menun']:OpenQuestionMenu(source, questions, 'Normal', function(amountOfCorrectAnswers, amountOfQuestions)
        print('You got ' .. amountOfCorrectAnswers .. ' out of ' .. amountOfQuestions .. ' correct!')
    end)
```
When you want to randomise the questions, you can use the following code:
```lua	
exports['quiz-menun']:OpenQuestionMenuRandom(source, questions, 'Random', 5, function(amountOfCorrectAnswers, amountOfQuestions)
  print('You got ' .. amountOfCorrectAnswers .. ' out of ' .. amountOfQuestions .. ' correct!')
end)
```

## Example questions

```lua
local questions = {
  {
    question = "What is the capital of France?",
    wrongAnswers = {
      "London",
      "Berlin",
      "Madrid"
    },
    correctAnswers = {
      "Paris"
    },
  },
  {
    question = "What is the capital of Germany?",
    wrongAnswers = {
      "London",
      "Paris",
      "Madrid"
    },
    correctAnswers = {
      "Berlin"
    },
  },
}
```

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
* Thanks to [ProjectError](https://github.com/project-error/fivem-react-boilerplate-lua) for the boilerplate
* Thanks to [NextUI](https://nextui.org/) for the UI library