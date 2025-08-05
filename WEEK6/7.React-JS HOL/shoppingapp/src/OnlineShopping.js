import React from "react";
import Cart from "./Cart";

class OnlineShopping extends React.Component {
  render() {
    const items = [
      { itemname: "Laptop", price: 50000 },
      { itemname: "Mobile", price: 15000 },
      { itemname: "Headphones", price: 2000 },
      { itemname: "Keyboard", price: 1000 },
      { itemname: "Mouse", price: 500 },
    ];
    return (
      <div style={{}}>
        <h2>Online Shopping Cart</h2>
        {items.map((item, index) => (
          <Cart key={index} ItemName={item.itemname} price={item.price} />
        ))}
      </div>
    );
  }
}

export default OnlineShopping;
