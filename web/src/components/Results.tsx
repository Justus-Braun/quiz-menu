import { Result } from "./App";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { useState } from "react";
import { Button, Spinner } from "@nextui-org/react";
import { debugData } from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";

debugData([
    {
        action: "setResult",
        data: {
            amountOfCorrectAnswers: 5,
            amountOfQuestions: 10
        }
    },
]);

export default function Results({show}: {show: boolean}) {
    const [result, setResult] = useState<Result | null>(null);

    useNuiEvent<Result>("setResult", (result) => {
        console.log(result);
        setResult(result);
    });

    const close = () => {
        setResult(null);
        fetchNui('hideFrame')
    }

    if (!show) return null;

    return (
        <>
            {result && (
                <div className="flex flex-col items-center justify-center m-auto">
                    <p className="text-primary-500 text-center text-3xl mt-5">
                        You got {result.amountOfCorrectAnswers} out of {result.amountOfQuestions} questions right!
                    </p>
                    <Button
                        className="bg-primary-500 text-white rounded-lg p-2 mt-5"
                        onClick={close}
                    >
                        Close
                    </Button>
                </div>
            )}

            {!result && <Spinner label="Loading" color="primary" labelColor="primary" className="m-auto" />}
        </>
    );
}