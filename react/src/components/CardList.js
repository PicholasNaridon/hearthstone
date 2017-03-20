import React, { Component } from 'react';
import CardListItem from './CardItem';

class CardList extends Component {
  constructor(props) {
  super(props);
    this.state = {
      cards: [],
      currentPage: 1,
      cardsPerPage: 30
    };
    this.getData = this.getData.bind(this);
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(event) {
    this.setState({
      currentPage: Number(event.target.id)
    });
  }

  getData() {
    fetch('http://localhost:3000/api/v1/cards.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({cards: body});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  };

  render() {
    let indexOfLastCard = this.state.currentPage * this.state.cardsPerPage
    let indexOfFirstCard = indexOfLastCard - this.state.cardsPerPage
    let currentCards = this.state.cards.slice(indexOfFirstCard, indexOfLastCard)

    let newCards = currentCards.map((card, index) =>{
      return (
        <CardListItem
          id={card.id}
          key={index}
          name={card.name}
          picture={card.img}
        />
      )
    });

    let pageNumbers = [];
    for (let i = 1; i <= Math.ceil(this.state.cards.length / this.state.cardsPerPage); i++){
      pageNumbers.push(i);
    }

    let renderPageNumbers = pageNumbers.map(number => {
      return (
        <a className="tiny button"
          key={number}
          id={number}
          onClick={this.handleClick}
        >
          {number}
        </a>
      );
    });

    return(
      <div>
        <div>
          {newCards}
        </div>
        <ul>
          <div className="small-3 small-push-2 columns">
            {renderPageNumbers}
          </div>
        </ul>
      </div>

    )
  }
};

export default CardList;
