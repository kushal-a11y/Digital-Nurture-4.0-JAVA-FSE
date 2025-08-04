import React, { useState } from "react";
import "./App.css";
import BlogDetails from "./components/BlogDetails";
import BookDetails from "./components/BookDetails";
import CourseDetails from "./components/CourseDetails";

function App() {
  const [isShowBook, setIsShowBook] = useState(false);
  const [isShowBlogs, setIsShowBlogs] = useState(false);
  const [isShowCourses, setIsShowCourses] = useState(false);

  return (
    <div className="App">
      <h1>Blogger App</h1>
      <button onClick={() => setIsShowBook(true)}>Show Books</button>
      <button onClick={() => setIsShowBlogs(true)}>Show Blogs</button>
      <button onClick={() => setIsShowCourses(true)}>Show Courses</button>
      <button
        onClick={() => {
          setIsShowBook(true);
          setIsShowBlogs(true);
          setIsShowCourses(true);
        }}
      >
        Show All
      </button>
      <button
        onClick={() => {
          setIsShowBook(false);
          setIsShowBlogs(false);
          setIsShowCourses(false);
        }}
      >
        Hide All
      </button>
      <div className="section-container">
        {isShowBook && (
          <div className="section-box books-section">
            <BookDetails />
          </div>
        )}
        {isShowBlogs && (
          <div className="section-box blogs-section">
            <BlogDetails />
          </div>
        )}
        {isShowCourses && (
          <div className="section-box courses-section">
            <CourseDetails show={true} />
          </div>
        )}
      </div>
    </div>
  );
}

export default App;
