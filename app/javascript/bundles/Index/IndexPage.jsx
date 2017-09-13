import React, { Component } from 'react';

class IndexPage extends Component {
  constructor(props) {
    super(props);
    this.state = {


    };
  }

  render() {

    let submissionFragment = this.props.submissions.map(submission => {
    return(
      <li> {submission.title} </li>
    )

    })

    return(
      <div>
      {submissionFragment}
      </div>
    );
  }
};
export default IndexPage;
