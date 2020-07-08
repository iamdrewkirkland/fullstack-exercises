import React, { useState, useContext } from "react";
import { UserProfileContext } from "./UserProfileProvider";

export const PostContext = React.createContext();

export const PostProvider = (props) => {
  const [posts, setPosts] = useState([]);
  
  const { getToken } = useContext(UserProfileContext);
  

  const getAllPosts = () => {
    return getToken().then((token)=>
    fetch("/api/post", {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
      .then((res) => res.json())
      .then(setPosts));
  };

  const addPost = (post) => {
    return getToken().then((token) => fetch("/api/post", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(post),
    }).then(resp => {
      if (resp.ok) {
        return resp.json();
      }
      throw new Error("Unauthorized");
    }));
  };
  const getPost = (id) => {
    return getToken().then((token) => fetch(`/api/post/${id}`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`
      }
    }).then((res) => res.json()));
};

  return (
    <PostContext.Provider value={{ posts, getAllPosts, addPost, getPost }}>
      {props.children}
    </PostContext.Provider>
  );
};