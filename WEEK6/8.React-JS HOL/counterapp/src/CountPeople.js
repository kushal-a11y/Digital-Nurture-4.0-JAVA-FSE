import React from "react";

class CountPeople extends React.Component {
  constructor(props) {
    super(props);
    this.state = { entrycount: 0, exitcount: 0 };
  }
  //Display the number of people who entered the mall.
  UpdateEntry() {
    this.setState((prevState) => ({
      entrycount: prevState.entrycount + 1,
    }));
  }
  UpdateExit() {
    this.setState((prevState) => ({
      exitcount: prevState.exitcount + 1,
    }));
  }
  render() {
    return (
      <div style={{ textAlign: "center", marginTop: "50px" }}>
        <button
          onClick={() => this.UpdateEntry()}
          style={{
            backgroundColor: "green",
            fontWeight: "bold",
            color: "white",
          }}
        >
          Login
        </button>
        <p>{this.state.entrycount} people entered!!</p>
        <p> </p>
        <button
          onClick={() => this.UpdateExit()}
          style={{
            backgroundColor: "red",
            fontWeight: "bold",
            color: "white",
          }}
        >
          Exit
        </button>
        <p>{this.state.exitcount} people left!!</p>
      </div>
    );
  }
}

export default CountPeople;
