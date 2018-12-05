import React, { Component } from 'react';
import { Button } from 'react-bootstrap';

import Requests from '../Requests/Requests';

import './AllComputers.css';

class AllComputers extends Component {
  state = {
    allComputers: [],
  }

  componentDidMount() {
    return new Promise((resolve, reject) => {
      Requests.GetAll()
      .then(computer => {
        this.setState({
          allComputers: computer,
        });
        resolve(computer);
      })
      .catch(error => reject(error));
    });
  };

  clickAllComputers = e => {
    const id = e.target.name;
    this.props.history.push(`/computers/${id}`);
  };

  render () {
    const { allComputers } = this.state;

    const output = allComputers.map(c => {
      return (
        <Button
          name={c.id}
          key={c.id}
          value={c.id}
          onClick={this.clickAllComputers}
        >{c.id}</Button>
      );
    });

    return (
      <div>
        <h1>COMPUTERS</h1>
        <div>
          <h2>All Computers</h2>
          <Button
            onClick={() => this.props.history.push('/computers/addcomputer')}
          >Add Computer</Button>
        </div>
        <div>
          {output}
        </div>
      </div>
    );
  }
};

export default AllComputers;