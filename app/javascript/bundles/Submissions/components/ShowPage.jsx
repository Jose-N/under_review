import React, {Component} from 'react';

class ShowPage extends Component {
  render() {
  return (
    <div className="ShowPage">
      <h1>{this.props.submission.title}</h1>
      <ul>
        <li>Overall Troll: {this.props.submission_rating.troll}</li>
        <li>Overall Funny: {this.props.submission_rating.funny}</li>
        <li>Overall Story: {this.props.submission_rating.story}</li>
        <li>Overall Helpful: {this.props.submission_rating.helpful}</li>
      </ul>

      <img src={`${this.props.submission.screenshot.url}`} />
    </div>
  )
  }
}

export default ShowPage;
