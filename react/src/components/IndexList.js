import React, { Component } from 'react';
import IndexItem from './IndexItem';

class IndexList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cards: [],
      search: '',
      prevSearch: '',
      group: 1
    };
    this.getCards = this.getCards.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
    this.setCards = this.setCards.bind(this);
    this.updateGroup = this.updateGroup.bind(this);
    this.Shuffle = this.shuffle.bind(this);
  }

  updateSearch(event) {
    let prevSearch = this.state.search;
    this.setState({prevSearch: prevSearch});
    this.setState({search: event.target.value.substr(0, 20)});
    if (this.state.search.length === 1 && this.state.prevSearch > this.state.search) {
      this.setState({ group: 1 });
    }else if (this.state.search.length > -1){
      this.setState({ group: 0 });
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

  updateGroup(page) {

    let nextGroup = this.state.group + page;
    this.setState({ group: nextGroup });


}

  getCards() {
    fetch('http://hsdeckbuilder.herokuapp.com/decks/api/v1/cards.json')
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
        this.setState({ cards: randomizedBody });
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
    let groupSize = 4;
    let pageSize = 120;

    let cards = this.state.cards.map((card, index) => {
      if (card.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1) {
        return (
          <IndexItem
           id={card.id}
           key={index}
           name={card.name}
           picture={card.img}
           key={index + 1}
          />
        );
      }

      // if this.state.group = 0 ignore
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
    let page;
    if (this.state.group === 1) {
     page =
      <div>
        <button type="button" onClick={() => this.updateGroup(1)} className="button"> Next</button>
      </div>
    }else {
       page = <div>
                  <button type="button" onClick={() => this.updateGroup(-1)} className="button">Previous</button>
                  <button type="button" onClick={() => this.updateGroup(1)} className="button"> Next</button>
                </div>
    }

    return(
      <div>
        <input type="text" className="search" placeholder="Search"
        value={this.state.search}
        onChange={this.updateSearch}/>
        <p></p>
        <p></p>
        {cards}
        <div>
          {page}
        </div>
      </div>
    );
  }
}

export default IndexList;
