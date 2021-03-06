import React, { Component} from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import SingleCustomer from './components/SingleCustomer/SingleCustomer';
import Home from './components/Home/Home';
import Computers from './components/Computers/Computers';
import Customers from './components/Customers/Customers';
import Departments from './components/Departments/Departments';
import Employees from './components/Employees/Employees';
import PaymentTypes from './components/PaymentTypes/PaymentTypes';
import OnePaymentType from './components/PaymentTypes/OnePaymentType';
import AddPayments from './components/PaymentTypes/AddPaymentType';
import UpdatePay from './components/PaymentTypes/UpdatePay';
import Products from './components/Products/Products';
import ProductTypes from './components/ProductTypes/ProductTypes';
import TrainingPrograms from './components/TrainingPrograms/TrainingPrograms';
import Navibar from './components/Navibar/Navibar';
import AddCustomer from './components/Customers/AddCustomer';
import AddEmployee from './components/Employees/AddEmployee';
import SingleEmployee from './components/SingleEmployee/SingleEmployee';
import OrderRoutes from './components/Orders/OrderRoutes';



class App extends Component
{
  render()
  {
    return (
      <BrowserRouter>
        <div>
          <Navibar />
          <div className="container">
             <div className="row">
              <Switch>
                <Route component={SingleCustomer} path='/customers/:id' />
                <Route component={SingleEmployee} path='/employees/:id' />
                <Route exact path='/' component={Home} />
                <Route path='/computers' component={Computers} />
                <Route path='/customers' component={Customers} />
                <Route path='/addCustomer' component={AddCustomer} />
                <Route path='/departments' component={Departments} />
                <Route path='/employees' component={Employees} />
                <Route path='/addEmployee' component={AddEmployee} />
                <Route path='/orders' component={OrderRoutes} />
                <Route exact path='/paymenttypes' component={PaymentTypes} />
                <Route path='/paymenttypes/:id' component={OnePaymentType} />
                <Route exact path='/paymenttype/' component={AddPayments} />
                <Route exact path='/paymenttype/:id' component={UpdatePay} />
                <Route path='/products' component={Products} />
                <Route path='/producttypes' component={ProductTypes} />
                <Route path='/trainingprograms' component={TrainingPrograms} />

              </Switch>
            </div>
          </div>
          
        </div>
      </BrowserRouter>
    )
  }
}
export default App;
