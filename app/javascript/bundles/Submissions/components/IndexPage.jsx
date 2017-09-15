import React, {Component} from 'react';
import { Link } from 'react-router'
import Masonry from 'react-masonry-component';

let masonryOptions = {
  transitionDuration: 0
};

class IndexPage extends Component {
  render() {

    let listOfSubmissions = this.props.submissions.map(submission => {
      return(
      <div className="tile">
        <a href={`/submissions/${submission.id}`}><img src={`${submission.screenshot.url}`} className="submission-tile"/></a>
        <p className="tile-title">{submission.title}</p>
      </div>
      )
    })
  return (
    <Masonry className="IndexPage">
      {listOfSubmissions}
    </Masonry>
  )
  }
}
export default IndexPage;
