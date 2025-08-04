import React from "react";

export default function CourseDetails({ show }) {
  // Optional: return null if show is false (fulfills "prevent rendering")
  if (!show) return null;

  const courses = [
    { id: 1, name: "React Bootcamp" },
    { id: 2, name: "JavaScript Essentials" },
    { id: 3, name: "UI/UX for Beginners" },
  ];

  return (
    <div>
      <h2>Course Details</h2>
      <ul>
        {courses.map((course) => (
          <li key={course.id}>{course.name}</li>
        ))}
      </ul>
    </div>
  );
}
