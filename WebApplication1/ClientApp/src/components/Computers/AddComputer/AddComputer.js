import React, { Component } from 'react';
import { Checkbox, Form, FormControl, Label, Button } from 'react-bootstrap';

import Requests from '../Requests/Requests';

import './AddComputer.css';

class AddComputer extends Component {
  state = {
    purchaseDate: '',
    decommissioned: 0,
    employeeId: 0,
    inUse: false,
    isMalfunctioning: false,
  };

  clickAddNewComputer = () => {
    return new Promise((resolve, reject) => {
      Requests.Add(this.state)
      .then(response => {
        alert('Computer saved');
        this.props.history.push('/computers/');
        resolve(response);
      })
      .catch(error => reject(error));
    });
  };

  handleChange = e => {
    const {name, value} = e.target;
    this.setState({ [name]: value });
  };

  toggleCheckbox = e => {
    const { name } = e.target;
    this.setState({[name]: !this.state[name]});
};

  render() {
    const {purchaseDate, decommissioned, employeeId, inUse, isMalfunctioning} = this.state;
    return (
      <div>
        <h2>COMPUTER</h2>
        <h3>Add New Computer</h3>
        <Form>
          <Label>Purchase Date: </Label>
          <FormControl
            type="text"
            name="purchaseDate"
            value={purchaseDate}
            onChange={this.handleChange}
          /><br/>
          <Label>Decommissioned? </Label>
          <FormControl
            type="text"
            name="decommissioned"
            value={decommissioned}
            onChange={this.handleChange}
          /><br/>
          <Label>Employee Id</Label>
          <FormControl
            type="number"
            name="employeeId"
            value={employeeId}
            onChange={this.handleChange}
          /><br/>
          <Label>In Use? </Label>
          <Checkbox
            name="inUse"
            checked={inUse}
            onChange={this.toggleCheckbox}
          ></Checkbox><br/>
          <Label>Is Malfunctioning? </Label>
          <Checkbox
            name="isMalfunctioning"
            checked={isMalfunctioning}
            onChange={this.toggleCheckbox}
          ></Checkbox><br/>
        </Form>
        <Button
          onClick={this.clickAddNewComputer}
        >Save Changes</Button>
        <Button
          onClick={() => this.props.history.push('/computers/')}
        >Cancel</Button>
      </div>
    );
  }
};

export default AddComputer;