import React, { Component } from 'react';
import CardItem from './CardItem';

class CardList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cards: [],
      search: '',
      group: 1
    };
    this.getCards = this.getCards.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
    this.setCards = this.setCards.bind(this);
  }

  updateSearch(event) {
    this.setState({search: event.target.value.substr(0, 20)});
    if (this.state.search.length > 1) {
      this.setState({ group: 0 });
    } else {
      this.setState({ group: 1 });
    }
  }


  shuffle(array) {
    let currentIndex = array.length, temporaryValue, randomIndex;
    while (0 !== currentIndex) {
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;
      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
    }
    return array;
  }

  getCards() {
    fetch('http://localhost:3000/api/v1/cards.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        let randomizedBody = this.shuffle(body);
        this.setState({ cards: randomizedBody })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getCards();
  }

  setCards(page) {
    this.setState({ group: page })
  }

  render() {

    let groupSize = 6;
    let pageSize = 36;
    let pageNumberLength = Math.ceil(this.state.cards.length / pageSize);

    let cards = this.state.cards.map((card, index) => {
      if (card.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1) {
        return (
          <CardItem
           id={card.id}
           key={index}
           name={card.name}
           picture={card.img}
           key={index + 1}
          />
        );
      }
    }).reduce((r, element, index) => {
      index % groupSize === 0 && r.push([]);
      r[r.length - 1].push(element);
      return r;
    }, []).reduce((r, element, index) => {
      index % pageSize === 0 && r.push([]);
      r[r.length - 1].push(element);
      return r;
    }, []).map((cardContent) => {
      if (this.state.group) {
        return(
          <div className="row">
            {cardContent[this.state.group - 1]}
          </div>
        );
      } else {
        return(
          <div className="row">
            {cardContent}
          </div>
        );
      }
    });

    let pageNumbers = [];
    for(let i = 1; i <= pageNumberLength; i++) {
      pageNumbers.push(<input type="submit" value={i} className="button" onClick={() => this.setCards(i)} />)
    }

    return(
      <div>
        <input type="text" className="search" placeholder="Search"
        value={this.state.search}
        onChange={this.updateSearch}/>
        {cards}
        <div className="numbers">
          {pageNumbers}
        </div>
      </div>
    );
  }
}

export default CardList;
