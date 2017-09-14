import React, {Component} from 'react';
import $ from 'jquery'

class ShowPage extends Component {

  handleDelete(url, itemId) {
  }

  render(){
    let edits;

    if (this.props.allowed) {
      edits =
      <ul>
        <li><a href={`/submissions/${this.props.submission.id}/edit`}>Edit this Jawn</a></li>
        <a data-confirm="Are you sure?" data-method="delete" href={`/submissions/${this.props.submission.id}`} rel="nofollow">Delete this Jawn</a>
      </ul>

    }
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
      <p>posted @ {this.props.submission.created_at} by {this.props.submission_creator}</p>

      <h4>Description</h4>
      <p>{this.props.submission.description}</p>

      {edits}
    </div>
  )
  }
}

export default ShowPage;
