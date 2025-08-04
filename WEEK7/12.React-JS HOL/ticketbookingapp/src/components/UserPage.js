import React from "react";
import "./UserPage.css";
export default function UserPage() {
  return (
    <div>
      <h2>welcome, User!</h2>
      <p>You can now book your flight tickets below.</p>
      <button
        onClick={() => {
          alert("Ticket Booked");
        }}
      >
        Book Ticket
      </button>
    </div>
  );
}
