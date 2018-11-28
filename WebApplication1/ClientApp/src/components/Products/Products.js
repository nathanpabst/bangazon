import React, {Component} from 'react';
import axios from 'axios';

import constants from '../../constants';
import './Products.css';

// http://localhost:58050/
class Products extends Component {
  state = {
    products: [],
  }

  componentDidMount() {
    const apiPath = `api/product`;
    return new Promise((resolve, reject) => {
      axios.get(apiPath)
      .then(products => {
        // sets state with all products
        this.setState({
          products: products.data
        })
        resolve (products);
      })
      .catch(error => reject(error));
    });
  };

  render () {
    const {
      products,
      singleProduct
    } = this.state;

    const clickProduct = () => {
      const {value} = this.props;
      console.log({value});
      const apiPath = `api/product/${value.id}`;
      return new Promise((resolve, reject) => {
        axios.get(apiPath)
        .then(product => {
          // sets state with all products
          this.setState({
            product: product.data
          })
        })
        .then(product => {
          this.props.history.push(`/products/${singleProduct.id}`);
          resolve (product);
        })
        .catch(error => reject(error));
      });

    }

    const output = products.map(product => {
      // Prints all product titles to DOM
      return (
        <h4
          key={product.id}
          value={product}
          onClick={clickProduct} >
          {product.title}
        </h4>
      );
    });

    return (
      <div>
        <h1>Products</h1>
        <div>
          <h2>All Products:</h2>
          <div>
            {output}
          </div>
        </div>
      </div>
    );
  }
};

export default Products;
