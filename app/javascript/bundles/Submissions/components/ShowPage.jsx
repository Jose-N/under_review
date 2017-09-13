import React, {Component} from 'react';

class ShowPage extends Component {
  render() {
  return (
    <div className="ShowPage">
      <p> posted @ {this.props.comments.body[0].created_at} at {this.props.comments.user[0].username}</p>
      <p>{this.props.comments.body[0].body}</p>
      <ul>
      <li>Troll: {this.props.comments.body[0].troll}</li>
      <li>Funny: {this.props.comments.body[0].funny}</li>
      <li>Story: {this.props.comments.body[0].story}</li>
      <li>Helpful: {this.props.comments.body[0].helpful}</li>
      </ul>
    </div>
  )
  }
}
export default ShowPage;
