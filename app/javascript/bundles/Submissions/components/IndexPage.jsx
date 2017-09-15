import React, {Component} from 'react';
import { Link } from 'react-router'

class IndexPage extends Component {
  render() {

    let listOfSubmissions = this.props.submissions.map(submission => {
      return(
      <div className="tile">
      <p className="symbol-bar">Symbol</p>
        <a href={`/submissions/${submission.id}`}><img {submission.title} className="submission-title"/></a>
        <p className="tile-title">{`submission.title'}'</p>
      </div>
      )
    })
  return (
    <div className="IndexPage">
      {listOfSubmissions}
    </div>
  )
  }
}
export default IndexPage;
