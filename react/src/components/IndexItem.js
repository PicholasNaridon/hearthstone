import React from 'react';

const IndexListItem = (props) => {
  let picture = props.picture == null ? 'http://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png' : props.picture

  return(
    <div className="small-3 medium-3 large-3 columns">
      <img src={picture} className="image"/>
      <h4><a href={`http://hsdeckbuilder.herokuapp.com/cards/` + props.id}>{props.name}</a></h4>
    </div>

  )
}

export default IndexListItem;
