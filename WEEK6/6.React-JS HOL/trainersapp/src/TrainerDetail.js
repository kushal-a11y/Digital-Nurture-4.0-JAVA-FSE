import React from "react";
import { useParams } from "react-router-dom";
import { trainers } from "./TrainerMock";

export default function TrainerDetails() {
  const { id } = useParams();
  const trainer = trainers.find((t) => String(t.TrainerId) === String(id));

  if (!trainer) return <p>Trainer not found</p>;

  return (
    <div>
      <h2>Trainer Details</h2>
      <p>
        <strong>Name:</strong> {trainer.Name}
      </p>
      <p>
        <strong>Email:</strong> {trainer.Email}
      </p>
      <p>
        <strong>Phone:</strong> {trainer.Phone}
      </p>
      <p>
        <strong>Technology:</strong> {trainer.Technology}
      </p>
      <p>
        <strong>Skills:</strong> {trainer.Skills}
      </p>
    </div>
  );
}
