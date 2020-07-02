import React, { useContext, useRef } from "react";
import {
  Col,
  Button,
  Form,
  FormGroup,
  Label,
  Input,
  FormText,
} from "reactstrap";
import { PostContext } from "../providers/PostProvider";

const PostForm = (props) => {
  const { addPost } = useContext(PostContext);

  const title = useRef();
  const caption = useRef();
  const url = useRef();

  const handleSubmit = (e) => {
    e.preventDefault();
    const newPost = {
      Title: title.current.value,
      ImageUrl: url.current.value,
      Caption: caption.current.value,
      DateCreated: new Date(),
      UserProfileId: 1,
    };
    addPost(newPost);
  };

  return (
    <div className="container" fluid="sm">
      <Form className="form">
        <Col>
          <FormGroup>
            <Label for="form__title">Title</Label>
            <Input
              type="text"
              name="title"
              id="form__title"
              placeholder="Give your GIF a Title"
              innerRef={title}
            />
          </FormGroup>
        </Col>
        <Col>
          <FormGroup>
            <Label for="form__url">URL</Label>
            <Input
              type="url"
              name="url"
              id="form__url"
              placeholder="www.someurl.com"
              innerRef={url}
            />
          </FormGroup>
        </Col>
        <Col>
          <FormGroup>
            <Label for="form__caption">Caption</Label>
            <Input
              type="text"
              name="caption"
              id="form__caption"
              placeholder="Caption say what?"
              innerRef={caption}
            />
          </FormGroup>
        </Col>
        <Button type="submit" onClick={handleSubmit}>
          SUBMIT
        </Button>
      </Form>
    </div>
  );
};

export default PostForm;
