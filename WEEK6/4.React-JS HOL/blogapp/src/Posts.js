import React from 'react'
import Post from './Post';

class Posts extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            posts: [],
            error: null
        }
    }

    loadPosts(){
        fetch('https://jsonplaceholder.typicode.com/posts')
        .then(response => response.json())
        .then(data => {
            const postObjects = data.map(
                p => new Post(p.id, p.title, p.body)
            );
            this.setState({posts : postObjects});
        })
        .catch(error => {
            this.setState({error});
        });
    }

    componentDidMount(){
        this.loadPosts();
    }

    componentDidCatch(error, info){
        alert("An Error occurred in Post comments");
        console.error("Error: ", error, info);
    }

    render(){
        return(
            <div>
                <h1>Blog Posts</h1>
                {this.state.posts.map(post =>(
                    <div key={post.id}>
                        <h3>{post.title}</h3>
                        <p>{post.body}</p>
                    </div>
                ))}
            </div>
        );
    }
}

export default Posts;
