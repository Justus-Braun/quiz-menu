import { useState } from "react";
import { debugData } from "../utils/debugData";
import Quiz from "./Quiz";
import Results from "./Results";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { Spinner } from "@nextui-org/react";

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
    action: "show",
    data: "result",
  },
]);

export interface Question {
  question: string;
  answers: string[];
}

export interface Data {
  header: string;
  questions: Question[];
}

export interface CheckedQuestion extends Question {}

export interface Result {
  amountOfCorrectAnswers: number;
  amountOfQuestions: number;
}

type Show = 'result' | 'questions' | null;

const App: React.FC = () => {
  const [show, setShow] = useState<Show>(null); 

  useNuiEvent<Show>("show", (result) => {
    console.log(result);
    setShow(result);
  });

  return (
    <div className="h-screen w-screen flex items-center justify-center">
      <div className="w-4/6 h-4/6 rounded-2xl flex flex-col align-middle gap-5 overflow-auto no-scrollbar bg-background shadow-[0_0px_10px_3px_rgba(0,0,0,1)]">
        <Quiz show={show === 'questions'} />
        <Results show={show === 'result'} />
        { show === null && <Spinner label="Loading" color="primary" labelColor="primary" className="m-auto" />}
      </div>
    </div>
  );
};

export default App;
