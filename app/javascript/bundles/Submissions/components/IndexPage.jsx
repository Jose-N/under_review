import React, {Component} from 'react';
import { Link } from 'react-router'

class IndexPage extends Component {
  render() {

    let listOfSubmissions = this.props.submissions.map(submission => {
      return(
        <a href={`/submissions/${submission.id}`}><li>{submission.title}</li></a>
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
