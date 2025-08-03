import React, { useState } from "react";
import styles from "./CurrencyConverter.css";
const CurrencyConverter = () => {
  const [inr, setInr] = useState(0);
  const [eur, setEur] = useState(0);

  //convert Inr to Eur
  const handleConvert = () => {
    const euroEquivalent = parseFloat(inr) / 90;
    setEur(euroEquivalent);
  };

  return (
    <div className="converter-container">
      <button onClick={() => alert("I was clicked!")}>OnPress</button>
      <h1>Currency Converter</h1>
      <input
        type="number"
        onChange={(e) => {
          setInr(e.target.value);
        }}
        value={inr}
        placeholder="Enter amount in INR"
      />
      <button onClick={handleConvert}>Convert</button>
      {eur !== null && (
        <p>
          {inr} INR = {eur} EUR
        </p>
      )}
    </div>
  );
};

export default CurrencyConverter;
