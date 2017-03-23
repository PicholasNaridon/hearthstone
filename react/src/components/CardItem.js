import React from 'react';

const CardListItem = (props) => {
  let picture = props.picture == null ? 'http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png' : props.picture

  return(
    <div className="small-3 medium-3 large-3 columns">
      <form action={window.location.pathname + `/` + props.id} method="post">
        <button type="submit" value="add card">
          <img src={picture} className="image"/>
        </button>
      </form>
        <h4>
          <a href={`http://localhost:3000/cards/` + props.id}>{props.name}</a>
        </h4>
    </div>


  )
}

export default CardListItem;
