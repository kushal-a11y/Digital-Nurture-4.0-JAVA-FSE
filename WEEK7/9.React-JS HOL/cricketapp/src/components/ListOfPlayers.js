import React from 'react';

class ListOfPlayers extends React.Component{
    getAllPlayers(players){
        return(
            <ul>
                {players.map((player,index) => (
                    <li key={index}>
                        Name: {player.name} || Score: {player.score}
                    </li>
                    ))}
            </ul>
        );
    };
    
    getAllPlayersBelow70(players){
        const players70 = players.filter((player)=> player.score<=70);
        return(
            <ul>
                {players70.map((player,index)=>(
                    <li key={index}>
                        Name: {player.name} || Score: {player.score}
                    </li>
                ))}
            </ul>
        );
    };
    render(){
        const { players } = this.props;
        return(
            <div>
                <h1>List Of Plyers</h1>
                {this.getAllPlayers(players)}
                <h1>List of Players having score below 70</h1>
                {this.getAllPlayersBelow70(players)}
            </div>
        );
    }
}


export default ListOfPlayers;