import React, { useState } from "react";
import { debugData } from "../utils/debugData";
import { Button, Card, CardBody, CardHeader, Checkbox, Divider, Spinner } from "@nextui-org/react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

debugData([
  {
    action: "setData",
    data: {
      header: "Mock Data",
      questions: [
        {
          question: "What is the meaning of life?",
          answers: ["42", "Life is a lie"],
        },
        {
          question: "What is the airspeed velocity of an unladen swallow?",
          answers: ["African or European?"],
        },
        {
          question: "What is the answer to the ultimate question?",
          answers: ["42", "What is the ultimate question?", "Life, the universe, and everything", "What?"],
        },
        {
          question: "What is the ultimate question?",
          answers: ["What is the answer to the ultimate question?", "What is the meaning of life?"],
        },
        {
          "question": "Why do we dream?",
          "answers": ["To process emotions", "Random brain activity", "To fulfill unmet needs"]
        },
        {
          "question": "Is time travel possible?",
          "answers": ["Theoretically possible", "Not according to current physics", "Uncertain"]
        },
        {
          "question": "What is consciousness?",
          "answers": ["Awareness of one's existence", "Product of brain activity", "Philosophically debated"]
        },
        {
          "question": "Do aliens exist?",
          "answers": ["Likely in the vast universe", "No evidence so far", "Possibility of microbial life"]
        },
        {
          "question": "What happens after we die?",
          "answers": ["Unknown", "Subject of religious beliefs", "Biological processes cease"]
        },
        {
          "question": "Why is the sky blue?",
          "answers": ["Rayleigh scattering", "Wavelength of sunlight", "Interaction with Earth's atmosphere"]
        },
        {
          "question": "How did the universe begin?",
          "answers": ["Big Bang theory", "Cosmic inflation", "Unknown before Planck time"]
        },
        {
          "question": "What is the purpose of art?",
          "answers": ["Expressing emotions", "Communication", "Aesthetic enjoyment"]
        },
        {
          "question": "Can machines ever become truly intelligent?",
          "answers": ["Possibly with advanced AI", "Depends on defining intelligence", "Ethical considerations"]
        },
        {
          "question": "Is there a parallel universe?",
          "answers": ["Theoretical concept", "Multiverse hypothesis", "No empirical evidence"]
        }
      ],
    }
  }
])

interface Question {
  question: string;
  answers: string[];
}

interface Data {
  header: string;
  questions: Question[];
}

interface CheckedQuestion extends Question {

}

const App: React.FC = () => {
  const [data, setData] = useState<Data | null>(null);
  const [checkedAnswers, setCheckedAnswers] = useState<boolean[][]>([]);

  const handleCheckboxChange = (questionIndex: number, answerIndex: number) => {
    const newCheckedAnswers = [...checkedAnswers];
    newCheckedAnswers[questionIndex][answerIndex] = !newCheckedAnswers[questionIndex][answerIndex];
    setCheckedAnswers(newCheckedAnswers);
  };

  const submitForm = () => {
    const checkedQuestions: CheckedQuestion[] = data!.questions.map((question, questionIndex) => {
      return {
        ...question,
        answers: question.answers.filter((_, answerIndex) => checkedAnswers[questionIndex][answerIndex])
      }
    });

    fetchNui<CheckedQuestion>("submitForm", checkedQuestions)

    setCheckedAnswers([]);
    setData(null);
  };

  useNuiEvent<Data>("setData", (newData) => {
    setCheckedAnswers([]);
    setData(null);

    newData.questions = Object.values(newData.questions);

    for (let i = 0; i < newData.questions.length; i++) {
      setCheckedAnswers((prev) => [...prev, Array(newData.questions[i].answers.length).fill(false)]);
    }
    setData(newData);
  });

  return (
    <div className="h-screen w-screen flex items-center justify-center">
      <div className="w-4/6 h-4/6 rounded-2xl flex flex-col align-middle gap-5 overflow-auto no-scrollbar bg-background shadow-[0_0px_10px_3px_rgba(0,0,0,1)]">
        {data && <p className="text-primary-500 text-center text-3xl mt-5">{data?.header}</p>}
        {data && data.questions.map((question, questionIndex) => (
          <div key={questionIndex}>
            <Card className="w-4/6 mx-auto border-2 border-[#3A3A3D]">
              <CardHeader>{question.question}</CardHeader>
              <Divider  className="h-[2px]" />
              <CardBody>
                {question.answers.map((answer, answerIndex) => (
                  <Checkbox
                    color="primary"
                    key={answerIndex}
                    isSelected={checkedAnswers[questionIndex]?.[answerIndex]}
                    onChange={() => handleCheckboxChange(questionIndex, answerIndex)}
                  >
                    {answer}
                  </Checkbox>
                ))}
              </CardBody>
            </Card>
          </div>
        ))}

        {data && <Button className="min-h-10 mb-5 w-4/6 mx-auto" onClick={submitForm}>Submit</Button>}

        {!data && <Spinner label="Loading" color="primary" labelColor="primary" className="m-auto" />}
      </div>
    </div>
  );
};

export default App;
