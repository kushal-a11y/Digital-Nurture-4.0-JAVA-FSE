import "./App.css";
import React, { useState } from "react";

function App() {
  const [counter, setCounter] = useState(0);
  const [message, setMessage] = useState("");
  const sayHello = () => {
    console.log("Hello from Increment");
    setMessage("Hello from Increment");
  };
  const sayWelcome = (welcomeMessage) => {
    console.log(welcomeMessage);
    setMessage(welcomeMessage);
  };
  return (
    <div className="App">
      <h2>Counter: {counter}</h2>
      <button
        onClick={() => {
          setCounter(counter + 1);
          sayHello();
        }}
      >
        Increment
      </button>
      <button
        onClick={() => {
          setCounter(counter > 0 ? counter - 1 : 0);
          // sayHello();
        }}
      >
        Decrement
      </button>
      <h1>Button That Says Welcome</h1>
      <button
        onClick={() => sayWelcome("Welcome")}
        style={{
          color: "white",
          backgroundColor: "green",
          border: "2px solid black",
          width: "100px",
          marginTop: "20px",
        }}
      >
        Say Welcome
      </button>
      {message && <p>{message}</p>}
    </div>
  );
}

export default App;
