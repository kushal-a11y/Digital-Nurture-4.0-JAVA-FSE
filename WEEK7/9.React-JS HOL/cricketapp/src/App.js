import React from 'react';
import IndianPlayers from './components/IndianPlayers';
import ListOfPlayers from './components/ListOfPlayers'
const players = new Map();

players.set("MS Dhoni",20.00);//1
players.set("Kohli",21.00);//2
players.set("Rahul",22.00);//3
players.set("Rishav",23.00);//4
players.set("Kunal",21.00);//5
players.set("Hardik",2.00);//6
players.set("Pandey",0.00);//7
players.set("kausthav",21.00);//8
players.set("Sanju",10.00);//9
players.set("Kushal",120.00);//10
players.set("Aayush",10.00);//11

const playersArray = Array.from(players, ([name,score]) => ({name,score}));

const flag = false;
function App() {
  return (
    <div>
      {flag ? (
        <ListOfPlayers players={playersArray}/>
      ):(
        <IndianPlayers players={playersArray}/>
      )}
    </div>
  );
}

export default App;
