// styles
import {
    Button,
    Form,
    FormContainer,
    TextDiv,
    TextInput,
    TextLabel,
    Title,
} from "../../_styles/Modal/Post";

const Post = ({ title }) => {
    return (
        <Form>
            <Title>{title || "New Post"}</Title>
            <FormContainer>
                <TextDiv>
                    <TextLabel>Title</TextLabel>
                    <TextInput type="text" />
                </TextDiv>
                <TextDiv>
                    <TextLabel>Content</TextLabel>
                    <TextInput type="text" />
                </TextDiv>
                <TextDiv>
                    <Button>Create</Button>
                </TextDiv>
            </FormContainer>
        </Form>
    );
};

export default Post;
