import React, {Component} from 'react';

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
      <div className="ratings-box">
        <h1>{this.props.submission.title}</h1>
        <ul><h4 style="text-decoration:underline";>Overall Ratings:</h4>
          <li>Troll: {this.props.submission_rating.troll}</li>
          <li>Funny: {this.props.submission_rating.funny}</li>
          <li>Story: {this.props.submission_rating.story}</li>
          <li>Helpful: {this.props.submission_rating.helpful}</li>
        </ul>
      </div>

      <div className="submission-box">
        <img src={`${this.props.submission.screenshot.url}`} />
        <p>posted @ {this.props.submission.created_at.strftime("%B %d %Y")} by {this.props.submission_creator}</p>
        <a href={`${this.props.submission.url}`}>Original Review</a>

        <h4>Description</h4>
        <p>{this.props.submission.description}</p>

        {edits}
      </div>
    </div>
  )
  }
}

export default ShowPage;
