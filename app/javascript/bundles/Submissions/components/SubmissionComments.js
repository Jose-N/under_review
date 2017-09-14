import React, {Component} from 'react';

class SubmissionComments extends Component {

  render() {

  let comments;
  if (this.props.comments.length > 0) {
    comments = this.props.comments.map( full_comment => {
      let edits;
      if (this.props.allowed) {
        edits =
        <ul>
          <li><a data-confirm="Are you sure?" data-method="delete" href={`/comments/${full_comment.comment.id}`} rel="nofollow">Delete comment</a></li>
        </ul>
      }
      let body;
      if (full_comment.comment.body) {
        body = <li>{full_comment.comment.body}</li>
      }else {
        body = <li>There was no comment for this rating</li>
      }
      return(
        <div className='comment'>
          <p>posted @ {full_comment.comment.created_at} by {full_comment.user.username}</p>
          <ul>
              {body}
              <ul>
                <li>Troll Rating {full_comment.comment.troll}</li>
                <li>Funny Rating {full_comment.comment.funny}</li>
                <li>Story Rating {full_comment.comment.story}</li>
                <li>Helpful Rating {full_comment.comment.helpful}</li>
                {edits}
              </ul>
          </ul>
        </div>
      )
  })
  }else { comments = <p>No Comments Yet</p>}

  return (
    <div className="SubmissionComments">
      <h4>Comments</h4>
      {comments}
    </div>
  )
  }
}
export default SubmissionComments;
