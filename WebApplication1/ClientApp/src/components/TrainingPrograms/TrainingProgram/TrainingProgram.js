import React, { Component } from 'react';
import {Button, Form, FormControl, Label} from 'react-bootstrap';

import Requests from '../Requests/Requests';

import './TrainingProgram.css';

class TrainingProgram extends Component {
  state = {
    startdate: '',
    enddate: '',
    maxattendees: 0,
    id: 0,
    isEditing: 0,
    attendees: [],
  }

  componentDidMount() {
    const tpId = this.props.match.params.id;
    return new Promise((resolve, reject) => {
      Requests.GetSingle(tpId)
      .then(tp => {
        this.setState({
          startdate: tp.start_Date,
          enddate: tp.end_Date,
          maxattendees: tp.max_Attendees,
          id: tp.id,
          isEditing: 0,
        });
        resolve(tp);
        Requests.getAttendees(tpId)
          .then(res =>
          {
            this.setState({ attendees: res });
          })
      })
      .catch(error => reject(error));
    });
  };

  clickDeleteTrainingProgram = () => {
    const tpId = this.state.id;
    return new Promise((resolve, reject) => {
      Requests.Delete(tpId)
        .then(response => {
          alert('Record deleted successfully');
          this.props.history.push(`/trainingprograms/`);
          resolve(response);
        })
        .catch(error => reject(error));
    });
  };

  clickUpdateTrainingProgram = () => {
    var currentdate = new Date();
    var tp = this.state
    if (tp.startdate > currentdate)
    {
      console.log(currentdate.getDate);
    }
    return new Promise((resolve, reject) => {
      Requests.Update(this.state, this.state.id)
      .then(response => {
        this.setState({isEditing: 0});
        alert('Updated Training Program Successfully');
        resolve(response);
      })
      .catch(error => reject(error));
    });
  };

  handleChange = e => {
    const {name, value} = e.target;
    this.setState({ [name]: value });
  };

  render() {
    const attendeesComponent = this.state.attendees.map((attendee) =>
    {  
      const singleEmployee = () =>
      {
        this.props.history.push(`/employees/${attendee.employee_id}`)
      };

        return (
          <div key={attendee.employee_id}>
            <li onClick={singleEmployee}>{attendee.employee_name}</li>
          </div>
        )
    });

    const {startdate, enddate, maxattendees, id, isEditing} = this.state;
    if (!isEditing) {
      return (
        <div>
          <h2>TRAINING PROGRAM</h2>
          <p>Start Date: {startdate}</p>
          <p>End Date: {enddate}</p>
          <p>Max Attendees: {maxattendees}</p>
          <p>Id: {id}</p>
          <Button
            onClick={() => this.setState({isEditing: 1})}
          >Edit This Record</Button>
          <Button
            onClick={this.clickDeleteTrainingProgram}
          >Delete Record</Button>
          {attendeesComponent}
        </div>
      );
    }
    else {
      return (
        <div>
          <h2>TRAINING PROGRAM</h2>
          <Form>
            <Label>Start Date: </Label>
            <FormControl
              type="text"
              name="startdate"
              value={startdate}
              onChange={this.handleChange}
            ></FormControl><br />
            <Label>End Date: </Label>
            <FormControl
              type="text"
              name="enddate"
              value={enddate}
              onChange={this.handleChange}
            ></FormControl><br />
            <Label>Max Attendees: </Label>
            <FormControl
              type="number"
              name="maxattendees"
              value={maxattendees}
              onChange={this.handleChange}
            ></FormControl><br />
            <Label>Id: </Label>
            <FormControl
              readOnly
              type="number"
              name="id"
              value={id}
              onChange={this.handleChange}
            ></FormControl><br />
          </Form>
          <Button
            onClick={this.clickUpdateTrainingProgram}
            >Save Changes</Button>
          <Button
            onClick={() => this.props.history.push(`/trainingprograms/`)}
          >Cancel</Button>
        </div>
      );
    }
  }
};

export default TrainingProgram;