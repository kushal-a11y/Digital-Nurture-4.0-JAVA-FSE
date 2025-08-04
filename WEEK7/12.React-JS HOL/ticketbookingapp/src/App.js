import "./App.css";
import React, { useState } from "react";
import GuestPage from "./components/GuestPage";
import UserPage from "./components/UserPage";
function App() {
  let content;
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  content = isLoggedIn ? <UserPage /> : <GuestPage />;
  return (
    <div className="App">
      <button
        onClick={() => {
          setIsLoggedIn(!isLoggedIn);
        }}
      >
        {isLoggedIn ? (
          <p style={{ color: "red", fontWeight: "bold" }}>Logout</p>
        ) : (
          <p style={{ color: "white", fontWeight: "bold" }}>Login</p>
        )}
      </button>
      <>{content}</>
    </div>
  );
}

export default App;
