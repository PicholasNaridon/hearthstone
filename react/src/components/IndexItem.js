import React from 'react';

const IndexListItem = (props) => {
  let picture = props.picture == null ? 'http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png' : props.picture

  return(
    <div className="small-3 medium-3 large-3 columns">
      <div className="card">
        <div className="card-section">
          <img src={picture} className="image"/>
          <h4><a href={`http://localhost:3000/cards/` + props.id}>{props.name}</a></h4>
        </div>
      </div>
    </div>

  )
}

export default IndexListItem;
