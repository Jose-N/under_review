import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

class App extends Component {

  constructor(props){
    super(props)
    this.state = {

    }
  }

  render() {
  return(
    <Router history={browserHistory}>
      <Route path='/' >
        <IndexRoute component={CerealIndexContainer} />
        <Route path='/cereals' component={CerealIndexContainer} />
        <Route path='/cereals/:id' component={CerealShowContainer} />
      </Route>
    </Router>
    )
  }
}
export default App;
