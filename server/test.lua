RegisterCommand("quizNormal", function (source, args, rawCommand)
    local questions = {
        {
            question = "What is the capital of France?",
            correctAnswers = "Paris",
            wrongAnswers = {
                "London",
                "Berlin",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Germany?",
            correctAnswers = "Berlin",
            wrongAnswers = {
                "London",
                "Paris",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Spain?",
            correctAnswers = "Madrid",
            wrongAnswers = {
                "London",
                "Paris",
                "Berlin"
            }
        },
        {
            question = "What is the capital of Italy?",
            correctAnswers = "Rome",
            wrongAnswers = {
                "Paris",
                "Berlin",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Japan?",
            correctAnswers = "Tokyo",
            wrongAnswers = {
                "Beijing",
                "Seoul",
                "Bangkok"
            }
        },
        {
            question = "What is the capital of Australia?",
            correctAnswers = "Canberra",
            wrongAnswers = {
                "Sydney",
                "Melbourne",
                "Perth"
            }
        },
        {
            question = "What is the capital of Canada?",
            correctAnswers = "Ottawa",
            wrongAnswers = {
                "Toronto",
                "Vancouver",
                "Montreal"
            }
        },
        {
            question = "What is the capital of Brazil?",
            correctAnswers = "Brasília",
            wrongAnswers = {
                "Rio de Janeiro",
                "São Paulo",
                "Salvador"
            }
        },
        {
            question = "What is the capital of South Africa?",
            correctAnswers = "Pretoria",
            wrongAnswers = {
                "Cape Town",
                "Johannesburg",
                "Durban"
            }
        },
        {
            question = "What is the capital of India?",
            correctAnswers = "New Delhi",
            wrongAnswers = {
                "Mumbai",
                "Bangalore",
                "Chennai"
            }
        },
        {
            question = "What is the capital of Mexico?",
            correctAnswers = "Mexico City",
            wrongAnswers = {
                "Cancun",
                "Guadalajara",
                "Monterrey"
            }
        },
        {
            question = "What is the capital of Egypt?",
            correctAnswers = "Cairo",
            wrongAnswers = {
                "Alexandria",
                "Luxor",
                "Aswan"
            }
        },
        {
            question = "What is the capital of Argentina?",
            correctAnswers = "Buenos Aires",
            wrongAnswers = {
                "Cordoba",
                "Rosario",
                "Mendoza"
            }
        }
    }

    exports[GetCurrentResourceName()]:openQuestionMenu(source, questions, 'Normal')
end, false)

RegisterCommand("quizRandom", function(source, args, rawCommand)
    local questions = {
        {
            question = "What is the capital of France?",
            correctAnswers = "Paris",
            wrongAnswers = {
                "London",
                "Berlin",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Germany?",
            correctAnswers = "Berlin",
            wrongAnswers = {
                "London",
                "Paris",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Spain?",
            correctAnswers = "Madrid",
            wrongAnswers = {
                "London",
                "Paris",
                "Berlin"
            }
        },
        {
            question = "What is the capital of Italy?",
            correctAnswers = "Rome",
            wrongAnswers = {
                "Paris",
                "Berlin",
                "Madrid"
            }
        },
        {
            question = "What is the capital of Japan?",
            correctAnswers = "Tokyo",
            wrongAnswers = {
                "Beijing",
                "Seoul",
                "Bangkok"
            }
        },
        {
            question = "What is the capital of Australia?",
            correctAnswers = "Canberra",
            wrongAnswers = {
                "Sydney",
                "Melbourne",
                "Perth"
            }
        },
        {
            question = "What is the capital of Canada?",
            correctAnswers = "Ottawa",
            wrongAnswers = {
                "Toronto",
                "Vancouver",
                "Montreal"
            }
        },
        {
            question = "What is the capital of Brazil?",
            correctAnswers = "Brasília",
            wrongAnswers = {
                "Rio de Janeiro",
                "São Paulo",
                "Salvador"
            }
        },
        {
            question = "What is the capital of South Africa?",
            correctAnswers = "Pretoria",
            wrongAnswers = {
                "Cape Town",
                "Johannesburg",
                "Durban"
            }
        },
        {
            question = "What is the capital of India?",
            correctAnswers = "New Delhi",
            wrongAnswers = {
                "Mumbai",
                "Bangalore",
                "Chennai"
            }
        },
        {
            question = "What is the capital of Mexico?",
            correctAnswers = "Mexico City",
            wrongAnswers = {
                "Cancun",
                "Guadalajara",
                "Monterrey"
            }
        },
        {
            question = "What is the capital of Egypt?",
            correctAnswers = "Cairo",
            wrongAnswers = {
                "Alexandria",
                "Luxor",
                "Aswan"
            }
        },
        {
            question = "What is the capital of Argentina?",
            correctAnswers = "Buenos Aires",
            wrongAnswers = {
                "Cordoba",
                "Rosario",
                "Mendoza"
            }
        }
    }

    exports[GetCurrentResourceName()]:openQuestionMenuRandom(source, questions, 'Random', 5)
end, false)