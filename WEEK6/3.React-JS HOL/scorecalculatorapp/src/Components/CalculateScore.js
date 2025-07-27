import React from 'react'
import '../Stylesheets/mystyle.css';

const percentToDecimal = (decimal)=>{
    return (decimal.toFixed(2) + "%")
}

const calcScore = (total,goal)=>{
    return percentToDecimal(total/goal)
}

export const CalculateScore = ({ Name, School, total, goal }) => {
  return (
    <div className="formatstyle">
      <h1 style={{ color: "brown" }}>Student Details:</h1>

      <div className="Name">
        <b><span>Name: </span></b>
        <span>{Name}</span>
      </div>

      <div className="School">
        <b><span>School: </span></b>
        <span>{School}</span>
      </div>

      <div className="Total">
        <b><span>Total: </span></b>
        <span>{total}</span>
        <span> Marks</span>
      </div>

      <div className="Score">
        <b>Score: </b>
        <span>
          {calcScore(total, goal)}
        </span>
      </div>
    </div>
  );
};

export default CalculateScore;


// function CalculateScore(props){
//     const average = (props.Total/props.Goal) * 100;
//     return(
//         <div className='score-box'>
//             <h1>Student Score Calculator</h1>
//             <p><strong>Name:</strong>{props.name}</p>
//             <p><strong>School:</strong>{props.school}</p>
//             <p><strong>Total Marks:</strong>{props.Total}</p>
//             <p><strong>Goal Marks:</strong>{props.Goal}</p>
//             <p><strong>Average Score:</strong>{average.toFixed(2)}</p>
//         </div>
//     );
// }

// export default CalculateScore;