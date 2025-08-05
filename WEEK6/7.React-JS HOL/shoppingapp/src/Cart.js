import React from "react";

class Cart extends React.Component {
  render() {
    return (
      <div
        style={{ border: "1px solid black", margin: "10px", padding: "10px" }}
      >
        <h3>{this.props.ItemName}</h3>
        <p>Price: {this.props.price}</p>
      </div>
    );
  }
}

Cart.defultProps = {
  price: 0,
};

export default Cart;
