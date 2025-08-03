import React from "react";
import styles from "./App.css";
import officeImage from "./office.png";

function App() {
  // const office = {
  //   name: "Skyline tower",
  //   rent: 55000,
  //   address: "Downtown Business Street",
  // };
  const offices = [
    { id: 1, name: "Skyline Tower", rent: 55000, address: "Downtown" },
    { id: 2, name: "Tech Park 1", rent: 70000, address: "IT Hub" },
    { id: 3, name: "Home Park", rent: 80000, address: "Home Hub" },
    { id: 4, name: "Noodles Park", rent: 90000, address: "Noodles Hub" },
    { id: 5, name: "Tech Park 2", rent: 70000, address: "IT Hub" },
  ];

  return (
    <div className="App">
      <h1>Office Space Rental</h1>
      {/* <img src={officeImage} alt="Office Image" width={200} />
      <h2>Office name: {office.name}</h2>
      <p style={{ color: office.rent < 60000 ? "red" : "greeb" }}>
        Rent: {office.rent}
      </p>
      <p>Address: {office.address}</p> */}
      <div className="OfficeListContainer">
        {offices.map((office) => (
          <div key={office.id} className="Office">
            {/** A stable  id is used for each office component*/}
            <h1>{office.name}</h1>
            <p style={{ color: office.rent < 60000 ? "red" : "green" }}>
              {office.rent}
            </p>
            <p>{office.address}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;
