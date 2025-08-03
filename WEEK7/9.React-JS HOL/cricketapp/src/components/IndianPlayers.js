import React from 'react';

const IndianPlayers = ({players}) => {
    const oddPlayers = players.filter((_,idx)=> (idx + 1)%2 !== 0);
    const evenPlayers = players.filter((_,idx)=> (idx + 1)%2 === 0);
    const T20players = ["Rohit", "Pant", "Hardik"];
    const RanjiTrophy = ["Pujara", "Rahane"];
    const AllIndianPlayers = [...T20players,...RanjiTrophy];
    return(
        <div>
            <h1>Odd Players</h1>
            <ul>
                {oddPlayers.map((player,i)=>
                    <li key={i}>
                       Odd Player {i + 1}: {player.name}
                    </li>    
                )}
            </ul>
            <h1>Even Players</h1>
            <ul>
                {evenPlayers.map((player,i)=>
                    <li key={i}>
                       Even Player {i + 1}: {player.name}
                    </li>    
                )}
            </ul>
            <h1>List of Indian Players Merged</h1>
            <ul>
                {AllIndianPlayers.map((player,i)=>
                    <li key={i}>
                       Indian Player {i + 1}: {player}
                    </li>    
                )}
            </ul>
        </div>
    );
}

export default IndianPlayers;